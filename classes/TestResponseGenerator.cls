@isTest
global class TestResponseGenerator implements HttpCalloutMock {
    //  Default Constructor
    global TestResponseGenerator() {}

    //  Handle responses for multiple callouts
    global HTTPResponse respond(HTTPRequest req) {

        String thisEndpoint = req.getEndpoint();
        String thisMethod = req.getMethod();
        // S3 data request
        if
        (thisEndpoint.startsWith('https://s3.amazonaws.com/some-bucket-somewhere/')) {
            return S3RetrieveDataMock();
        }
        // Determine Bulk API endpoint
        else if (thisEndpoint.endsWith('/services/async/38.0/job') && thisMethod.equals('GET')) {
            return BulkAPIEndpointMock();         
        } 
        // Bulk API create job
        else if (thisEndpoint.endsWith('/services/async/38.0/job') && thisMethod.equals('POST')) {
            return BulkAPICreateJobMock();
        } 
        // Bulk API create batch
        else if (thisEndpoint.endsWith('/batch') && thisMethod.equals('POST')) {
            return BulkAPICreateBatchMock();
        } 
        // Bulk API close job
        else if (thisEndpoint.contains('/services/async/38.0/job/') && !thisEndpoint.endsWith('/services/async/38.0/job/')) {
            return BulkAPICloseJobMock();
        } else {
            return null;
        }
    }
    
    private HttpResponse S3RetrieveDataMock() {
        final String responsePayload = 'DOCUMENT_ID__c,DOCUMENT_ID_DERIVED__c,EVENT_TYPE__c,FILE_PREVIEW_TYPE__c,FILE_TYPE__c,ORGANIZATION_ID__c,REQUEST_ID__c,SIZE_BYTES__c,TIMESTAMP__c,TIMESTAMP_DERIVED__c,TRANSACTION_TYPE__c,USER_ID__c,USER_ID_DERIVED__c,User_IsActive__c,User_Name__c,User_Profile_Name__c,User_User_Role_Name__c,User_Username__c,VERSION_ID_DERIVED__c,VERSION_ID__c' +
            '069R0000000oWb9,069R0000000oWb9VBD,ContentTransfer,jpg,jpg,00DB0000000HbMZ,45kSFGeJyb5NBi11grnmW-,1212777421,20160921144313,2016-09-21T14:43:13.000Z,VersionRenditionDownload,005B0000002F9ob,005B0000002F9obIAC,TRUE,Helen Roberts,System Administrator - CIO,Director of Human Resources,hroberts@example.com,068Y0000000rYs8QRN,068Y0000000rYs8';
        HttpResponse response = new HttpResponse();                
        response.setHeader('Content-Type', 'application/octet-stream');
        response.setBody(responsePayload);
        response.setStatusCode(200);
        response.setStatus('OK');
		
		return response;        
    }

    private HttpResponse BulkAPIEndpointMock() {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'text/plain');
        response.setBody('');
        response.setStatusCode(200);
        response.setStatus('OK');
        
        return response;         
    }

    private HttpResponse BulkAPICreateJobMock() {
        final String responsePayload = '<?xml version="1.0" encoding="UTF-8"?>' +
            '<jobInfo' +
            '    xmlns="http://www.force.com/2009/06/asyncapi/dataload">' +
            '  <id>750D00000004SkLIAU</id>' +
            '  <operation>insert</operation>' +
            '  <object>Account</object>' +
            '  <createdById>005D0000001b0fFIAQ</createdById>' +
            '  <createdDate>2015-12-15T21:41:45.000Z</createdDate>' +
            '  <systemModstamp>2015-12-15T21:41:45.000Z</systemModstamp>' +
            '  <state>Open</state>' +
            '  <concurrencyMode>Parallel</concurrencyMode>' +
            '  <contentType>CSV</contentType>' +
            '  <numberBatchesQueued>0</numberBatchesQueued>' +
            '  <numberBatchesInProgress>0</numberBatchesInProgress>' +
            '  <numberBatchesCompleted>0</numberBatchesCompleted>' +
            '  <numberBatchesFailed>0</numberBatchesFailed>' +
            '  <numberBatchesTotal>0</numberBatchesTotal>' +
            '  <numberRecordsProcessed>0</numberRecordsProcessed>' +
            '  <numberRetries>0</numberRetries>' +
            '  <apiVersion>36.0</apiVersion>' +
            '  <numberRecordsFailed>0</numberRecordsFailed>' +
            '  <totalProcessingTime>0</totalProcessingTime>' +
            '  <apiActiveProcessingTime>0</apiActiveProcessingTime>' +
            '  <apexProcessingTime>0</apexProcessingTime>' +
            '</jobInfo>';
            
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/xml');
        response.setBody(responsePayload);
        response.setStatusCode(200);
        response.setStatus('Created');
        return response; 
    }

    private HttpResponse BulkAPICreateBatchMock() {
        final String responsePayload = '<?xml version="1.0" encoding="UTF-8"?>' +
            '<batchInfo' +
            '   xmlns="http://www.force.com/2009/06/asyncapi/dataload">' +
            ' <id>751D0000000004rIAA</id>' +
            ' <jobId>750D0000000002lIAA</jobId>' +
            ' <state>Queued</state>' +
            ' <createdDate>2009-04-14T18:15:59.000Z</createdDate>' +
            ' <systemModstamp>2009-04-14T18:15:59.000Z</systemModstamp>' +
            ' <numberRecordsProcessed>0</numberRecordsProcessed>' +
            ' <numberRecordsFailed>0</numberRecordsFailed>' +
            ' <totalProcessingTime>0</totalProcessingTime>' +
            ' <apiActiveProcessingTime>0</apiActiveProcessingTime>' +
            ' <apexProcessingTime>0</apexProcessingTime>' +
            '</batchInfo>';
            
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/xml');
        response.setBody(responsePayload);
        response.setStatusCode(200);
        response.setStatus('Created');

        return response;
    }

    private HttpResponse BulkAPICloseJobMock() {
        final String responsePayload = '<?xml version="1.0" encoding="UTF-8"?>' +
            '<jobInfo' +
            '   xmlns="http://www.force.com/2009/06/asyncapi/dataload">' +
            ' <id>750D00000004SkLIAU</id>' +
            ' <operation>insert</operation>' +
            ' <object>Account</object>' +
            ' <createdById>005D0000001ALVFIA4</createdById>' +
            ' <createdDate>2009-04-14T18:15:59.000Z</createdDate>' +
            ' <systemModstamp>2009-04-14T18:15:59.000Z</systemModstamp>' +
            ' <state>Closed</state>' +
            ' <concurrencyMode>Parallel</concurrencyMode>' +
            ' <contentType>XML</contentType>' +
            ' <numberBatchesQueued>0</numberBatchesQueued>' +
            ' <numberBatchesInProgress>0</numberBatchesInProgress>' +
            ' <numberBatchesCompleted>1</numberBatchesCompleted>' +
            ' <numberBatchesFailed>0</numberBatchesFailed>' +
            ' <numberBatchesTotal>1</numberBatchesTotal>' +
            ' <numberRecordsProcessed>2</numberRecordsProcessed>' +
            ' <numberRetries>0</numberRetries>' +
            ' <apiVersion>36.0</apiVersion>' +
            ' <numberRecordsFailed>0</numberRecordsFailed>' +
            ' <totalProcessingTime>3647</totalProcessingTime>' +
            ' <apiActiveProcessingTime>2136</apiActiveProcessingTime>' +
            ' <apexProcessingTime>0</apexProcessingTime>' +
            '</jobInfo>';
            
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/xml');
        response.setBody(responsePayload);
        response.setStatusCode(200);
        response.setStatus('OK');

        return response; 
    }
}
