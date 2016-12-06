public class LoginAsWithUsers extends EventLogFile implements Database.Batchable<sObject>, Database.Stateful {
    
    public LoginAsWithUsers() {
        // call the parent class constructor to initialize
        // the date preferences to be used for loading
        super();
        
        dmName = 'LoginAsWithUsers';
        metadataJson = '{"objects":[{"connector":"CSV","description":null,"fullyQualifiedName":"LoginAsWithUsers_csv","label":"LoginAsWithUsers.csv","name":"LoginAsWithUsers_csv","acl":null,"rowLevelSecurityFilter":null,"fields":[{"type":"Text","name":"CLIENT_IP","description":null,"fullyQualifiedName":"CLIENT_IP","label":"CLIENT_IP","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"DELEGATED_USER_ID","description":null,"fullyQualifiedName":"DELEGATED_USER_ID","label":"DELEGATED_USER_ID","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"DELEGATED_USER_ID_DERIVED","description":null,"fullyQualifiedName":"DELEGATED_USER_ID_DERIVED","label":"DELEGATED_USER_ID_DERIVED","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"DELEGATED_USER_NAME","description":null,"fullyQualifiedName":"DELEGATED_USER_NAME","label":"DELEGATED_USER_NAME","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"EVENT_TYPE","description":null,"fullyQualifiedName":"EVENT_TYPE","label":"EVENT_TYPE","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"ORGANIZATION_ID","description":null,"fullyQualifiedName":"ORGANIZATION_ID","label":"ORGANIZATION_ID","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"REQUEST_ID","description":null,"fullyQualifiedName":"REQUEST_ID","label":"REQUEST_ID","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Numeric","name":"TIMESTAMP","description":null,"fullyQualifiedName":"TIMESTAMP","label":"TIMESTAMP","isSystemField":null,"isUniqueId":null,"scale":3,"precision":18,"defaultValue":"0","isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Date","name":"TIMESTAMP_DERIVED","description":null,"fullyQualifiedName":"TIMESTAMP_DERIVED","label":"TIMESTAMP_DERIVED","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":"yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'","multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"URI","description":null,"fullyQualifiedName":"URI","label":"URI","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"USER_ID","description":null,"fullyQualifiedName":"USER_ID","label":"USER_ID","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"USER_ID_DERIVED","description":null,"fullyQualifiedName":"USER_ID_DERIVED","label":"USER_ID_DERIVED","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_IsActive","description":null,"fullyQualifiedName":"User_IsActive","label":"User.IsActive","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_Name","description":null,"fullyQualifiedName":"User_Name","label":"User.Name","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_Profile_Name","description":null,"fullyQualifiedName":"User_Profile_Name","label":"User.Profile.Name","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_User_Role_Name","description":null,"fullyQualifiedName":"User_User_Role_Name","label":"User.User.Role.Name","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_Username","description":null,"fullyQualifiedName":"User_Username","label":"User.Username","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null}]}]}';
        query = 'SELECT CLIENT_IP__c, DELEGATED_USER_ID__c, DELEGATED_USER_ID_DERIVED__c, ' +
            'DELEGATED_USER_NAME__c, EVENT_TYPE__c, ORGANIZATION_ID__c, REQUEST_ID__c, ' +
            'TIMESTAMP__c, TIMESTAMP_DERIVED__c, URI__c, USER_ID__c, ' +
            'USER_ID_DERIVED__c, User_Name__c, User_IsActive__c, User_Profile_Name__c, ' +
            'User_User_Role_Name__c, User_Username__c FROM LoginAsWithUsers__c';
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
            // LoginAsWithUsers-specific processing in sub-method call
            for (Integer idx = 0; idx < scope.size(); idx++) {
                LoginAsWithUsers__c lawu = (LoginAsWithUsers__c) scope[idx];
                String strTimestamp = dateList[idx].format('yyyyMMddHHmmss');
                String strTimestampDerived = dateList[idx].format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'');
                csvString += '"' + (lawu.CLIENT_IP__c == null ? '' : lawu.CLIENT_IP__c) + '",' +
                    '"' + (lawu.DELEGATED_USER_ID__c == null ? '' : lawu.DELEGATED_USER_ID__c) + '",' +
                    '"' + (lawu.DELEGATED_USER_ID_DERIVED__c == null ? '' : lawu.DELEGATED_USER_ID_DERIVED__c) + '",' +
                    '"' + (lawu.DELEGATED_USER_NAME__c == null ? '' : lawu.DELEGATED_USER_NAME__c) + '",' +
                    '"' + (lawu.EVENT_TYPE__c == null ? '' : lawu.EVENT_TYPE__c) + '",' +
                    '"' + (lawu.ORGANIZATION_ID__c == null ? '' : lawu.ORGANIZATION_ID__c) + '",' +
                    '"' + (lawu.REQUEST_ID__c == null ? '' : lawu.REQUEST_ID__c) + '",' +
                    '"' + strTimestamp + '",' +
                    '"' + strTimestampDerived + '",' +
                    '"' + (lawu.URI__c == null ? '' : lawu.URI__c) + '",' +
                    '"' + (lawu.USER_ID__c == null ? '' : lawu.USER_ID__c) + '",' +
                    '"' + (lawu.USER_ID_DERIVED__c == null ? '' : lawu.USER_ID_DERIVED__c) + '",' +
                    '"' + (lawu.User_IsActive__c == null ? '' : lawu.User_IsActive__c) + '",' +
                    '"' + (lawu.User_Name__c == null ? '' : lawu.User_Name__c) + '",' +
                    '"' + (lawu.User_Profile_Name__c == null ? '' : lawu.User_Profile_Name__c) + '",' +
                    '"' + (lawu.User_User_Role_Name__c == null ? '' : lawu.User_User_Role_Name__c) + '",' +
                    '"' + (lawu.User_Username__c == null ? '' : lawu.User_Username__c) + '"\n';
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