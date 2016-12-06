global virtual class EventLogFile implements Database.Batchable<sObject>, Database.Stateful {
/* START - The following class variables are set in the subclass constructor */
    protected final String dmName;
    protected final String metadataJson;
    protected final String query;
/* END - The preceding class variables are set in the subclass constructor */
    protected final String operation;
    protected final String startDateTime;
    protected final String endDateTime;
    protected final Boolean excludeWeekends;
    
    private Id iedId = null;
    private Integer partNumber = 1;
    
    protected Boolean firstCSVPart = true;           // used to generate header on first csv part
       
    global EventLogFile() {
        WaveUploadSettings__c wus = [SELECT Operation__c, StartTime__c, EndTime__c, ExcludeWeekends__c 
                                             FROM WaveUploadSettings__c WHERE Name = 'SObjectMgmtConfig'];
        this.operation = wus.Operation__c;
        this.startDateTime = wus.StartTime__c;
        this.endDateTime = wus.EndTime__c;
        this.excludeWeekends = wus.ExcludeWeekends__c;
    }

    global Database.QueryLocator start(Database.BatchableContext BC) {
        if (this.operation.equals('load')) {
            // Create Wave Header Entry
            InsightsExternalData ied = new InsightsExternalData(
                EdgemartAlias = this.dmName,
                Format = 'CSV',
                Action = 'None',
                Operation = 'Overwrite',
                MetadataJson = Blob.valueOf(this.metadataJson)
            );
            
            insert ied;
            this.iedId = ied.Id;
        }
        
        return Database.getQueryLocator(this.query);
    }
    
    /**
     * This virtual method must be overridden in each subclass.  It
     * should implement the specific load method for that class. 
     **/
    global virtual void execute(Database.BatchableContext BC, List<sObject> scope) {}
    
    protected String getCsvHeader() {
        String csvHeader = this.query.replaceAll('(?i)SELECT', '');
        csvHeader = this.query.replaceAll('(?i)FROM.*$','');
        csvHeader = this.query.replaceAll('__c', '');
        csvHeader = csvHeader.trim() + '\n';
        
        return csvHeader;        
    }
    
    protected void createDataPart(String csvStringPart) {
        InsightsExternalDataPart iedp = new InsightsExternalDataPart(
            PartNumber = this.partNumber++,
            InsightsExternalDataId = this.iedId,
            DataFile = Blob.valueof(csvStringPart)
        );
        insert iedp;
    }
    
    global void finish(Database.BatchableContext BC) {
        if (this.operation.equals('load') && !firstCSVPart) {
            // Update Wave Action to schedule processing
            InsightsExternalData ied = new InsightsExternalData(
                Id = this.iedId,
                EdgemartAlias = this.dmName,
                Action = 'Process'
            );
            update ied;
        }
    }
}