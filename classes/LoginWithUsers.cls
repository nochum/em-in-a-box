public class LoginWithUsers extends EventLogFile implements Database.Batchable<sObject>, Database.Stateful {
    
    public LoginWithUsers() {
        // call the parent class constructor to initialize
        // the date preferences to be used for loading
        super();
        
        dmName = 'LoginWithUsers';
        metadataJson = '{"objects":[{"connector":"CSV","description":null,"fullyQualifiedName":"LoginWithUsers_csv","label":"LoginWithUsers.csv","name":"LoginWithUsers_csv","acl":null,"rowLevelSecurityFilter":null,"fields":[{"type":"Text","name":"API_TYPE","description":null,"fullyQualifiedName":"API_TYPE","label":"API_TYPE","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Numeric","name":"API_VERSION","description":null,"fullyQualifiedName":"API_VERSION","label":"API_VERSION","isSystemField":null,"isUniqueId":null,"scale":1,"precision":18,"defaultValue":"0","isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"BROWSER_TYPE","description":null,"fullyQualifiedName":"BROWSER_TYPE","label":"BROWSER_TYPE","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"CLIENT_IP","description":null,"fullyQualifiedName":"CLIENT_IP","label":"CLIENT_IP","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Numeric","name":"CPU_TIME","description":null,"fullyQualifiedName":"CPU_TIME","label":"CPU_TIME","isSystemField":null,"isUniqueId":null,"scale":0,"precision":18,"defaultValue":"0","isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Numeric","name":"DB_TOTAL_TIME","description":null,"fullyQualifiedName":"DB_TOTAL_TIME","label":"DB_TOTAL_TIME","isSystemField":null,"isUniqueId":null,"scale":0,"precision":18,"defaultValue":"0","isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"EVENT_TYPE","description":null,"fullyQualifiedName":"EVENT_TYPE","label":"EVENT_TYPE","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"ORGANIZATION_ID","description":null,"fullyQualifiedName":"ORGANIZATION_ID","label":"ORGANIZATION_ID","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"REQUEST_ID","description":null,"fullyQualifiedName":"REQUEST_ID","label":"REQUEST_ID","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"REQUEST_STATUS","description":null,"fullyQualifiedName":"REQUEST_STATUS","label":"REQUEST_STATUS","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Numeric","name":"RUN_TIME","description":null,"fullyQualifiedName":"RUN_TIME","label":"RUN_TIME","isSystemField":null,"isUniqueId":null,"scale":0,"precision":18,"defaultValue":"0","isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"SOURCE_IP","description":null,"fullyQualifiedName":"SOURCE_IP","label":"SOURCE_IP","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Numeric","name":"TIMESTAMP","description":null,"fullyQualifiedName":"TIMESTAMP","label":"TIMESTAMP","isSystemField":null,"isUniqueId":null,"scale":3,"precision":18,"defaultValue":"0","isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Date","name":"TIMESTAMP_DERIVED","description":null,"fullyQualifiedName":"TIMESTAMP_DERIVED","label":"TIMESTAMP_DERIVED","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":"yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'","multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"URI","description":null,"fullyQualifiedName":"URI","label":"URI","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"USER_ID","description":null,"fullyQualifiedName":"USER_ID","label":"USER_ID","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"USER_ID_DERIVED","description":null,"fullyQualifiedName":"USER_ID_DERIVED","label":"USER_ID_DERIVED","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"USER_NAME","description":null,"fullyQualifiedName":"USER_NAME","label":"USER_NAME","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_IsActive","description":null,"fullyQualifiedName":"User_IsActive","label":"User.IsActive","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_Name1","description":null,"fullyQualifiedName":"User_Name1","label":"User.Name","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_Profile_Name","description":null,"fullyQualifiedName":"User_Profile_Name","label":"User.Profile.Name","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_User_Role_Name","description":null,"fullyQualifiedName":"User_User_Role_Name","label":"User.User.Role.Name","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_Username","description":null,"fullyQualifiedName":"User_Username","label":"User.Username","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null}]}]}';
        query = 'SELECT API_TYPE__c, API_VERSION__c, BROWSER_TYPE__c, CLIENT_IP__c, ' +
            'CPU_TIME__c, DB_TOTAL_TIME__c, EVENT_TYPE__c, ORGANIZATION_ID__c, ' +
            'REQUEST_ID__c, REQUEST_STATUS__c, RUN_TIME__c, SOURCE_IP__c, ' +
            'TIMESTAMP__c, TIMESTAMP_DERIVED__c, URI__c, USER_ID__c, ' +
            'USER_ID_DERIVED__c, USER_NAME__c, User_IsActive__c, User_Name1__c, ' +
            'User_Profile_Name__c, User_User_Role_Name__c, User_Username__c ' +
            'FROM LoginWithUsers__c';
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
            // LoginWithUsers-specific processing in sub-method call
            for (Integer idx = 0; idx < scope.size(); idx++) {
                LoginWithUsers__c lwu = (LoginWithUsers__c) scope[idx];
                String strTimestamp = dateList[idx].format('yyyyMMddHHmmss');
                String strTimestampDerived = dateList[idx].format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'');
                csvString += '"' + (lwu.API_TYPE__c == null ? '' : lwu.API_TYPE__c) + '",' +
                    '"' + (lwu.API_VERSION__c == null ? '' : lwu.API_VERSION__c) + '",' +
                    '"' + (lwu.BROWSER_TYPE__c == null ? '' : lwu.BROWSER_TYPE__c) + '",' +
                    '"' + (lwu.CLIENT_IP__c == null ? '' : lwu.CLIENT_IP__c) + '",' +
                    '"' + (lwu.CPU_TIME__c == null ? '' : lwu.CPU_TIME__c) + '",' +
                    '"' + (lwu.DB_TOTAL_TIME__c == null ? '' : lwu.DB_TOTAL_TIME__c) + '",' +
                    '"' + (lwu.EVENT_TYPE__c == null ? '' : lwu.EVENT_TYPE__c) + '",' +
                    '"' + (lwu.ORGANIZATION_ID__c == null ? '' : lwu.ORGANIZATION_ID__c) + '",' +
                    '"' + (lwu.REQUEST_ID__c == null ? '' : lwu.REQUEST_ID__c) + '",' +
                    '"' + (lwu.REQUEST_STATUS__c == null ? '' : lwu.REQUEST_STATUS__c) + '",' +
                    '"' + (lwu.RUN_TIME__c == null ? '' : lwu.RUN_TIME__c) + '",' +
                    '"' + (lwu.SOURCE_IP__c == null ? '' : lwu.SOURCE_IP__c) + '",' +
                    '"' + strTimestamp + '",' +
                    '"' + strTimestampDerived + '",' +
                    '"' + (lwu.URI__c == null ? '' : lwu.URI__c) + '",' +
                    '"' + (lwu.USER_ID_DERIVED__c == null ? '' : lwu.USER_ID_DERIVED__c) + '",' +
                    '"' + (lwu.USER_ID__c == null ? '' : lwu.USER_ID__c) + '",' +
                    '"' + (lwu.USER_NAME__c == null ? '' : lwu.USER_NAME__c) + '",' +
                    '"' + (lwu.User_IsActive__c == null ? '' : lwu.User_IsActive__c) + '",' +
                    '"' + (lwu.User_Name1__c == null ? '' : lwu.User_Name1__c) + '",' +
                    '"' + (lwu.User_Profile_Name__c == null ? '' : lwu.User_Profile_Name__c) + '",' +
                    '"' + (lwu.User_User_Role_Name__c == null ? '' : lwu.User_User_Role_Name__c) + '",' +
                    '"' + (lwu.User_Username__c == null ? '' : lwu.User_Username__c) + '"\n';
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