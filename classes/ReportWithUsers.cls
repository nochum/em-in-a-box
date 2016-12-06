public class ReportWithUsers extends EventLogFile implements Database.Batchable<sObject>, Database.Stateful {
    
    public ReportWithUsers() {
        // call the parent class constructor to initialize
        // the date preferences to be used for loading
        super();
        
        dmName = 'ReportWithUsers';
        metadataJson = '{"objects":[{"connector":"CSV","description":null,"fullyQualifiedName":"ReportWithUsers_csv","label":"ReportWithUsers.csv","name":"ReportWithUsers_csv","acl":null,"rowLevelSecurityFilter":null,"fields":[{"type":"Text","name":"CLIENT_IP","description":null,"fullyQualifiedName":"CLIENT_IP","label":"CLIENT_IP","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Numeric","name":"CPU_TIME","description":null,"fullyQualifiedName":"CPU_TIME","label":"CPU_TIME","isSystemField":null,"isUniqueId":null,"scale":0,"precision":18,"defaultValue":"0","isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Numeric","name":"DB_BLOCKS","description":null,"fullyQualifiedName":"DB_BLOCKS","label":"DB_BLOCKS","isSystemField":null,"isUniqueId":null,"scale":0,"precision":18,"defaultValue":"0","isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Numeric","name":"DB_CPU_TIME","description":null,"fullyQualifiedName":"DB_CPU_TIME","label":"DB_CPU_TIME","isSystemField":null,"isUniqueId":null,"scale":0,"precision":18,"defaultValue":"0","isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Numeric","name":"DB_TOTAL_TIME","description":null,"fullyQualifiedName":"DB_TOTAL_TIME","label":"DB_TOTAL_TIME","isSystemField":null,"isUniqueId":null,"scale":0,"precision":18,"defaultValue":"0","isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"DISPLAY_TYPE","description":null,"fullyQualifiedName":"DISPLAY_TYPE","label":"DISPLAY_TYPE","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"ENTITY_NAME","description":null,"fullyQualifiedName":"ENTITY_NAME","label":"ENTITY_NAME","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"EVENT_TYPE","description":null,"fullyQualifiedName":"EVENT_TYPE","label":"EVENT_TYPE","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Numeric","name":"NUMBER_BUCKETS","description":null,"fullyQualifiedName":"NUMBER_BUCKETS","label":"NUMBER_BUCKETS","isSystemField":null,"isUniqueId":null,"scale":0,"precision":18,"defaultValue":"0","isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Numeric","name":"NUMBER_COLUMNS","description":null,"fullyQualifiedName":"NUMBER_COLUMNS","label":"NUMBER_COLUMNS","isSystemField":null,"isUniqueId":null,"scale":0,"precision":18,"defaultValue":"0","isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Numeric","name":"NUMBER_EXCEPTION_FILTERS","description":null,"fullyQualifiedName":"NUMBER_EXCEPTION_FILTERS","label":"NUMBER_EXCEPTION_FILTERS","isSystemField":null,"isUniqueId":null,"scale":0,"precision":18,"defaultValue":"0","isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"ORGANIZATION_ID","description":null,"fullyQualifiedName":"ORGANIZATION_ID","label":"ORGANIZATION_ID","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"RENDERING_TYPE","description":null,"fullyQualifiedName":"RENDERING_TYPE","label":"RENDERING_TYPE","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"REPORT_ID","description":null,"fullyQualifiedName":"REPORT_ID","label":"REPORT_ID","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"REPORT_ID_DERIVED","description":null,"fullyQualifiedName":"REPORT_ID_DERIVED","label":"REPORT_ID_DERIVED","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"REQUEST_ID","description":null,"fullyQualifiedName":"REQUEST_ID","label":"REQUEST_ID","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"REQUEST_STATUS","description":null,"fullyQualifiedName":"REQUEST_STATUS","label":"REQUEST_STATUS","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Numeric","name":"RUN_TIME","description":null,"fullyQualifiedName":"RUN_TIME","label":"RUN_TIME","isSystemField":null,"isUniqueId":null,"scale":0,"precision":18,"defaultValue":"0","isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"Report_Name","description":null,"fullyQualifiedName":"Report_Name","label":"Report.Name","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"SORT","description":null,"fullyQualifiedName":"SORT","label":"SORT","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Numeric","name":"TIMESTAMP","description":null,"fullyQualifiedName":"TIMESTAMP","label":"TIMESTAMP","isSystemField":null,"isUniqueId":null,"scale":3,"precision":18,"defaultValue":"0","isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Date","name":"TIMESTAMP_DERIVED","description":null,"fullyQualifiedName":"TIMESTAMP_DERIVED","label":"TIMESTAMP_DERIVED","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":"yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'","multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"URI","description":null,"fullyQualifiedName":"URI","label":"URI","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"USER_ID","description":null,"fullyQualifiedName":"USER_ID","label":"USER_ID","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"USER_ID_DERIVED","description":null,"fullyQualifiedName":"USER_ID_DERIVED","label":"USER_ID_DERIVED","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_IsActive","description":null,"fullyQualifiedName":"User_IsActive","label":"User.IsActive","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_Name","description":null,"fullyQualifiedName":"User_Name","label":"User.Name","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_Profile_Name","description":null,"fullyQualifiedName":"User_Profile_Name","label":"User.Profile.Name","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_User_Role_Name","description":null,"fullyQualifiedName":"User_User_Role_Name","label":"User.User.Role.Name","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_Username","description":null,"fullyQualifiedName":"User_Username","label":"User.Username","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null}]}]}';
        query = 'SELECT CLIENT_IP__c, CPU_TIME__c, DB_BLOCKS__c, DB_CPU_TIME__c, ' +
            'DB_TOTAL_TIME__c, DISPLAY_TYPE__c, ENTITY_NAME__c, EVENT_TYPE__c, ' +
            'NUMBER_BUCKETS__c, NUMBER_COLUMNS__c, NUMBER_EXCEPTION_FILTERS__c, ' +
            'ORGANIZATION_ID__c, RENDERING_TYPE__c, REPORT_ID__c, ' +
            'REPORT_ID_DERIVED__c, REQUEST_ID__c, REQUEST_STATUS__c, RUN_TIME__c, ' +
            'Report_Name__c, SORT__c, TIMESTAMP__c, TIMESTAMP_DERIVED__c, ' +
            'URI__c, USER_ID__c, USER_ID_DERIVED__c, User_IsActive__c, ' +
            'User_Name__c, User_Profile_Name__c, User_User_Role_Name__c, ' +
            'User_Username__c FROM ReportWithUsers__c';
    }
    
    /**
     * This method overrides the parent class method.
     * It contains class-specific load logic.
     **/
    public override void execute(Database.BatchableContext BC, List<sObject> scope) {
        if ( operation.equals('load') ) {
            final Integer CHUNK_MAX_BYTES = 10000000; // 10 MB per chunk (technically 10485756)
            List<DateTime> dateList = RandomDateGenerator.getDates(startDateTime, endDateTime, scope.size(), excludeWeekends);
            
            String csvString = '';
            if (firstCSVPart) {
                csvString += getCsvHeader();
                firstCSVPart = false;
            }
            // ReportWithUsers-specific processing in sub-method call
            for (Integer idx = 0; idx < scope.size(); idx++) {
                ReportWithUsers__c rwu = (ReportWithUsers__c) scope[idx];
                String strTimestamp = dateList[idx].format('yyyyMMddHHmmss');
                String strTimestampDerived = dateList[idx].format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'');
                csvString += '"' + (rwu.CLIENT_IP__c == null ? '' : rwu.CLIENT_IP__c) + '",' +
                    '"' + (rwu.CPU_TIME__c == null ? '' : rwu.CPU_TIME__c) + '",' +
                    '"' + (rwu.DB_BLOCKS__c == null ? '' : rwu.DB_BLOCKS__c) + '",' +
                    '"' + (rwu.DB_CPU_TIME__c == null ? '' : rwu.DB_CPU_TIME__c) + '",' +
                    '"' + (rwu.DB_TOTAL_TIME__c == null ? '' : rwu.DB_TOTAL_TIME__c) + '",' +
                    '"' + (rwu.DISPLAY_TYPE__c == null ? '' : rwu.DISPLAY_TYPE__c) + '",' +
                    '"' + (rwu.ENTITY_NAME__c == null ? '' : rwu.ENTITY_NAME__c) + '",' +
                    '"' + (rwu.EVENT_TYPE__c == null ? '' : rwu.EVENT_TYPE__c) + '",' +
                    '"' + (rwu.NUMBER_BUCKETS__c == null ? '' : rwu.NUMBER_BUCKETS__c) + '",' +
                    '"' + (rwu.NUMBER_COLUMNS__c == null ? '' : rwu.NUMBER_COLUMNS__c) + '",' +
                    '"' + (rwu.NUMBER_EXCEPTION_FILTERS__c == null ? '' : rwu.NUMBER_EXCEPTION_FILTERS__c) + '",' +
                    '"' + (rwu.ORGANIZATION_ID__c == null ? '' : rwu.ORGANIZATION_ID__c) + '",' +
                    '"' + (rwu.RENDERING_TYPE__c == null ? '' : rwu.RENDERING_TYPE__c) + '",' +
                    '"' + (rwu.REPORT_ID_DERIVED__c == null ? '' : rwu.REPORT_ID_DERIVED__c) + '",' +
                    '"' + (rwu.REPORT_ID__c == null ? '' : rwu.REPORT_ID__c) + '",' +
                    '"' + (rwu.REQUEST_ID__c == null ? '' : rwu.REQUEST_ID__c) + '",' +
                    '"' + (rwu.REQUEST_STATUS__c == null ? '' : rwu.REQUEST_STATUS__c) + '",' +
                    '"' + (rwu.RUN_TIME__c == null ? '' : rwu.RUN_TIME__c) + '",' +
                    '"' + (rwu.Report_Name__c == null ? '' : rwu.Report_Name__c) + '",' +
                    '"' + (rwu.SORT__c == null ? '' : rwu.SORT__c) + '",' +
                    '"' + strTimestamp + '",' +
                    '"' + strTimestampDerived + '",' +
                    '"' + (rwu.URI__c == null ? '' : rwu.URI__c) + '",' +
                    '"' + (rwu.USER_ID_DERIVED__c == null ? '' : rwu.USER_ID_DERIVED__c) + '",' +
                    '"' + (rwu.USER_ID__c == null ? '' : rwu.USER_ID__c) + '",' +
                    '"' + (rwu.User_IsActive__c == null ? '' : rwu.User_IsActive__c) + '",' +
                    '"' + (rwu.User_Name__c == null ? '' : rwu.User_Name__c) + '",' +
                    '"' + (rwu.User_Profile_Name__c == null ? '' : rwu.User_Profile_Name__c) + '",' +
                    '"' + (rwu.User_User_Role_Name__c == null ? '' : rwu.User_User_Role_Name__c) + '",' +
                    '"' + (rwu.User_Username__c == null ? '' : rwu.User_Username__c) + '"\n';
                if (csvString.length() >= CHUNK_MAX_BYTES) {
                    createDataPart(csvString);
                    csvString = '';  // We only need the header on the first chunk
                }            
            }
            createDataPart(csvString);
        } else if ( operation.equals('truncate') && scope.size() > 0 ) {
            delete scope;
            DataBase.emptyRecycleBin(scope);
        }
    }
}