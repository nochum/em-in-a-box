public without sharing class WaveDemoLoadSobjects implements Queueable, Database.AllowsCallouts {

    private final String eventType;
    private final String elfName;
    private final String sessionID;
    private final String systemBase;
    private String sfBaseUrl;
    public class WaveDemoLoadException extends Exception { }
    
    public WaveDemoLoadSobjects(String evt, String elf, String sess) {
        this.eventType = evt;
        this.elfName = elf;
        this.sessionID = sess;
        this.systemBase = URL.getSalesforceBaseUrl().toExternalForm();
    }
    
    public void execute(QueueableContext context) {
        Integer allowedCallouts = Limits.getLimitCallouts() - Limits.getCallouts();
        if (allowedCallouts <= 0) {
            System.debug('Exiting as the callout limit has been reached.');
            return;
        }

        String jobId = processEventLog();
    }

    /**
     * Ideally, we would truncate each object prior to loading
     * data into it.  Even better, we would provide a UI checkbox
     * allowing the user to choose between overwrite and append
     * functionality.  Unfortunately, Apex lacks sleep()
     * capabilities which are necessary both to determine the
     * completion of the initial query (for the Ids to delete)
     * and the completion of the delete operation itself.  For now
     * we will require users to manually truncate the objects prior
     * to performing a new load.
     **/
    private String processEventLog() {
        // get the file content from AWS S3
        HTTPResponse s3Res = S3EeventFileCallout(elfName);
        Blob csvFile = s3Res.getBodyAsBlob();
        
        // get the appropriate URL for the Bulk API
        HttpResponse bacRes = baseUrlCallout(systemBase, sessionId);        
        if (bacRes.getStatusCode() == 302) {
            String locHeader = bacRes.getHeader('Location');
            String redirectHost = locHeader.substringBetween('https://', '/');
            this.sfBaseUrl = 'https://' + redirectHost;
        } else {
            this.sfBaseUrl = systemBase;
        }

        // create a bulk insert job
        HttpResponse jRes = createJobCallout(this.sfBaseUrl, this.sessionId, 'insert', eventType);
        Dom.XMLNode jobInfo = jRes.getBodyDocument().getRootElement();        
        String jobId = jobInfo.getChildElement('id', 'http://www.force.com/2009/06/asyncapi/dataload').getText();

        // add a batch to the existing job
        HttpResponse bRes = createBatchCallout(this.sfBaseUrl, this.sessionId, jobId, eventType, csvFile);
        Dom.XMLNode batchInfo  = bRes.getBodyDocument().getRootElement();
        String batchId = batchInfo.getChildElement('id', 'http://www.force.com/2009/06/asyncapi/dataload').getText();

        HttpResponse cjRes = closeJobCallout(this.sfBaseUrl, this.sessionId, jobId);
        return jobId;
    }
    
    /**
     * Call stack: execute() => processEventLog() => getBaseUrl()
     * 
     * We are running in a queueable context.  Therefore the server
     * running this code will not necessarily be the same server
     * that hosts the API.  In order to avoid surprises (redirects)
     * later, we will check for them now to ensure that all REST
     * API calls go to the appropriate host.
     **/
    public static HttpResponse baseUrlCallout(String systemBase, String sessionId) {
        final String relativeURI = '/services/async/38.0/job';
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(systemBase + relativeURI);
        req.setMethod('GET');
        req.setHeader('X-SFDC-Session', sessionID);

        HttpResponse res = ( new Http().send(req) );
        
        return res;
    }
    
    public static HttpResponse createJobCallout(String baseUrl, String session, String operation, String objName) {
        String job = null;
        final String relativeURI = '/services/async/38.0/job';
        final String payLoad = '<?xml version="1.0" encoding="UTF-8"?>' +
            '<jobInfo xmlns="http://www.force.com/2009/06/asyncapi/dataload">' +
            '<operation>' + operation + '</operation>' +
            '<object>' + objName + '__c</object>' +
            '<contentType>CSV</contentType>' +
            '</jobInfo>';
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(baseUrl + relativeURI);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/xml; charset=UTF-8');
        req.setHeader('X-SFDC-Session', session);
        req.setBody(payLoad);

        HttpResponse res =  ( new Http().send(req) );
        if (!res.getStatus().equals('Created')) {
            throw new WaveDemoLoadException('Bad server response in createJob(): ' + 
				res.getStatusCode() + ' ' + res.getStatus() + ' ' + res.getBody());
        }        

        return res;
    }
    
    /**
     * Note that a maximum of 10,000 lines of csv may be loaded in one
     * shot.  Any lines that exceed 10,000 will be ignored by the Bulk API.
     **/
    public static HttpResponse createBatchCallout(String baseUrl, String session, String jobId, String eventType, Blob csvFile) {
        final String relativeURI = '/services/async/38.0/job/' + jobId + '/batch';

        HttpRequest req = new HttpRequest();
        req.setEndpoint(baseUrl + relativeURI);
        req.setMethod('POST');
        req.setHeader('X-SFDC-Session', session);
        req.setHeader('Content-Type', 'text/csv; charset=UTF-8');
        req.setBodyAsBlob(csvFile);
        HttpResponse res = ( new Http().send(req) );

        if (!res.getStatus().equals('Created')) {
            throw new WaveDemoLoadException('Bad server response in createBatch(): ' + 
				res.getStatusCode() + ' ' + res.getStatus() + ' ' + res.getBody());
        }
        
        return res;
    }

    public static HttpResponse S3EeventFileCallout(String elfName) {
        final String baseURI = 'https://s3.amazonaws.com/some-bucket-somewhere/';

        HttpRequest req = new HttpRequest();
        req.setEndpoint(baseURI + elfName);
        req.setMethod('GET');
        
        //Execute web service call here     
        HTTPResponse res = ( new Http().send(req) );
        
        if (!res.getStatus().equals('OK')) {
            throw new WaveDemoLoadException('Bad server response from S3 data download in createBatch(): ' + 
                res.getStatusCode() + ' ' + res.getStatus() + ' ' + res.getBody());
        }        
        
        return res;
    }
    
    public static HttpResponse closeJobCallout(String baseUrl, String session, String jobId) {
        final String relativeURI = '/services/async/38.0/job/' + jobId;
        String payload = '<?xml version="1.0" encoding="UTF-8"?>' +
            '<jobInfo xmlns="http://www.force.com/2009/06/asyncapi/dataload">' +
            '<state>Closed</state>' +
            '</jobInfo>';
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(baseUrl + relativeURI);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/xml; charset=UTF-8');
        req.setHeader('X-SFDC-Session', session);
        req.setBody(payLoad);
        HttpResponse res = ( new Http().send(req) );
        if (!res.getStatus().equals('OK')) {
            throw new WaveDemoLoadException('Bad server response in closeJob(): ' + 
				res.getStatusCode() + ' ' + res.getStatus() + ' ' + res.getBody());
        }
        
        return res;
    }  
}
