public class URIWithUsers extends EventLogFile implements Database.Batchable<sObject>, Database.Stateful {
    
    public URIWithUsers() {
        // call the parent class constructor to initialize
        // the date preferences to be used for loading
        super();
        
        dmName = 'URIWithUsers';
        metadataJson = '{"objects":[{"connector":"CSV","description":null,"fullyQualifiedName":"URIWithUsers_csv","label":"URIWithUsers.csv","name":"URIWithUsers_csv","acl":null,"rowLevelSecurityFilter":null,"fields":[{"type":"Text","name":"CLIENT_IP","description":null,"fullyQualifiedName":"CLIENT_IP","label":"CLIENT_IP","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Numeric","name":"CPU_TIME","description":null,"fullyQualifiedName":"CPU_TIME","label":"CPU_TIME","isSystemField":null,"isUniqueId":null,"scale":0,"precision":18,"defaultValue":"0","isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Numeric","name":"DB_BLOCKS","description":null,"fullyQualifiedName":"DB_BLOCKS","label":"DB_BLOCKS","isSystemField":null,"isUniqueId":null,"scale":0,"precision":18,"defaultValue":"0","isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Numeric","name":"DB_CPU_TIME","description":null,"fullyQualifiedName":"DB_CPU_TIME","label":"DB_CPU_TIME","isSystemField":null,"isUniqueId":null,"scale":0,"precision":18,"defaultValue":"0","isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Numeric","name":"DB_TOTAL_TIME","description":null,"fullyQualifiedName":"DB_TOTAL_TIME","label":"DB_TOTAL_TIME","isSystemField":null,"isUniqueId":null,"scale":0,"precision":18,"defaultValue":"0","isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"EVENT_TYPE","description":null,"fullyQualifiedName":"EVENT_TYPE","label":"EVENT_TYPE","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"ORGANIZATION_ID","description":null,"fullyQualifiedName":"ORGANIZATION_ID","label":"ORGANIZATION_ID","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"REFERRER_URI","description":null,"fullyQualifiedName":"REFERRER_URI","label":"REFERRER_URI","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"REQUEST_ID","description":null,"fullyQualifiedName":"REQUEST_ID","label":"REQUEST_ID","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"REQUEST_STATUS","description":null,"fullyQualifiedName":"REQUEST_STATUS","label":"REQUEST_STATUS","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Numeric","name":"RUN_TIME","description":null,"fullyQualifiedName":"RUN_TIME","label":"RUN_TIME","isSystemField":null,"isUniqueId":null,"scale":0,"precision":18,"defaultValue":"0","isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Numeric","name":"TIMESTAMP","description":null,"fullyQualifiedName":"TIMESTAMP","label":"TIMESTAMP","isSystemField":null,"isUniqueId":null,"scale":3,"precision":18,"defaultValue":"0","isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Date","name":"TIMESTAMP_DERIVED","description":null,"fullyQualifiedName":"TIMESTAMP_DERIVED","label":"TIMESTAMP_DERIVED","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":"yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'","multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"URI","description":null,"fullyQualifiedName":"URI","label":"URI","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"USER_ID","description":null,"fullyQualifiedName":"USER_ID","label":"USER_ID","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"USER_ID_DERIVED","description":null,"fullyQualifiedName":"USER_ID_DERIVED","label":"USER_ID_DERIVED","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_IsActive","description":null,"fullyQualifiedName":"User_IsActive","label":"User.IsActive","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_Name","description":null,"fullyQualifiedName":"User_Name","label":"User.Name","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_Profile_Name","description":null,"fullyQualifiedName":"User_Profile_Name","label":"User.Profile.Name","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_User_Role_Name","description":null,"fullyQualifiedName":"User_User_Role_Name","label":"User.User.Role.Name","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_Username","description":null,"fullyQualifiedName":"User_Username","label":"User.Username","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null}]}]}';
        query = 'SELECT CLIENT_IP__c, CPU_TIME__c, DB_BLOCKS__c, DB_CPU_TIME__c, ' + 
            'DB_TOTAL_TIME__c, EVENT_TYPE__c, ORGANIZATION_ID__c, REFERRER_URI__c, ' +
            'REQUEST_ID__c, REQUEST_STATUS__c, RUN_TIME__c, TIMESTAMP__c, ' +
            'TIMESTAMP_DERIVED__c, URI__c, USER_ID_DERIVED__c, USER_ID__c, ' +
            'User_IsActive__c, User_Name__c, User_Profile_Name__c, ' +
            'User_User_Role_Name__c, User_Username__c FROM URIWithUsers__c';
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
            // URIWithUsers-specific processing in sub-method call
            for (Integer idx = 0; idx < scope.size(); idx++) {
                URIWithUsers__c uwu = (URIWithUsers__c) scope[idx];
                String strTimestamp = dateList[idx].format('yyyyMMddHHmmss');
                String strTimestampDerived = dateList[idx].format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'');
                csvString += '"' + (uwu.CLIENT_IP__c == null ? '' : uwu.CLIENT_IP__c) + '",' +
                    '"' + (uwu.CPU_TIME__c == null ? '' : uwu.CPU_TIME__c) + '",' +
                    '"' + (uwu.DB_BLOCKS__c == null ? '' : uwu.DB_BLOCKS__c) + '",' +
                    '"' + (uwu.DB_CPU_TIME__c == null ? '' : uwu.DB_CPU_TIME__c) + '",' +
                    '"' + (uwu.DB_TOTAL_TIME__c == null ? '' : uwu.DB_TOTAL_TIME__c) + '",' +
                    '"' + (uwu.EVENT_TYPE__c == null ? '' : uwu.EVENT_TYPE__c) + '",' +
                    '"' + (uwu.ORGANIZATION_ID__c == null ? '' : uwu.ORGANIZATION_ID__c) + '",' +
                    '"' + (uwu.REFERRER_URI__c == null ? '' : uwu.REFERRER_URI__c) + '",' +
                    '"' + (uwu.REQUEST_ID__c == null ? '' : uwu.REQUEST_ID__c) + '",' +
                    '"' + (uwu.REQUEST_STATUS__c == null ? '' : uwu.REQUEST_STATUS__c) + '",' +
                    '"' + (uwu.RUN_TIME__c == null ? '' : uwu.RUN_TIME__c) + '",' +
                    '"' + strTimestamp + '",' +
                    '"' + strTimestampDerived + '",' +
                    '"' + (uwu.URI__c == null ? '' : uwu.URI__c) + '",' +
                    '"' + (uwu.USER_ID_DERIVED__c == null ? '' : uwu.USER_ID_DERIVED__c) + '",' +
                    '"' + (uwu.USER_ID__c == null ? '' : uwu.USER_ID__c) + '",' +
                    '"' + (uwu.User_IsActive__c == null ? '' : uwu.User_IsActive__c) + '",' +
                    '"' + (uwu.User_Name__c == null ? '' : uwu.User_Name__c) + '",' +
                    '"' + (uwu.User_Profile_Name__c == null ? '' : uwu.User_Profile_Name__c) + '",' +
                    '"' + (uwu.User_User_Role_Name__c == null ? '' : uwu.User_User_Role_Name__c) + '",' +
                    '"' + (uwu.User_Username__c == null ? '' : uwu.User_Username__c) + '"\n';
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