public class ContentTransferWithUsers extends EventLogFile implements Database.Batchable<sObject>, Database.Stateful {
    
    public ContentTransferWithUsers() {
        // call the parent class constructor to initialize
        // the date preferences to be used for loading
        super();
        
        dmName = 'ContentTransferWithUsers';
        metadataJson = '{"objects":[{"connector":"CSV","description":null,"fullyQualifiedName":"ContentTransferWithUsers_csv","label":"ContentTransferWithUsers.csv","name":"ContentTransferWithUsers_csv","acl":null,"rowLevelSecurityFilter":null,"fields":[{"type":"Text","name":"DOCUMENT_ID","description":null,"fullyQualifiedName":"DOCUMENT_ID","label":"DOCUMENT_ID","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"DOCUMENT_ID_DERIVED","description":null,"fullyQualifiedName":"DOCUMENT_ID_DERIVED","label":"DOCUMENT_ID_DERIVED","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"EVENT_TYPE","description":null,"fullyQualifiedName":"EVENT_TYPE","label":"EVENT_TYPE","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"FILE_PREVIEW_TYPE","description":null,"fullyQualifiedName":"FILE_PREVIEW_TYPE","label":"FILE_PREVIEW_TYPE","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"FILE_TYPE","description":null,"fullyQualifiedName":"FILE_TYPE","label":"FILE_TYPE","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"ORGANIZATION_ID","description":null,"fullyQualifiedName":"ORGANIZATION_ID","label":"ORGANIZATION_ID","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"REQUEST_ID","description":null,"fullyQualifiedName":"REQUEST_ID","label":"REQUEST_ID","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Numeric","name":"SIZE_BYTES","description":null,"fullyQualifiedName":"SIZE_BYTES","label":"SIZE_BYTES","isSystemField":null,"isUniqueId":null,"scale":0,"precision":18,"defaultValue":"0","isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Numeric","name":"TIMESTAMP","description":null,"fullyQualifiedName":"TIMESTAMP","label":"TIMESTAMP","isSystemField":null,"isUniqueId":null,"scale":3,"precision":18,"defaultValue":"0","isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Date","name":"TIMESTAMP_DERIVED","description":null,"fullyQualifiedName":"TIMESTAMP_DERIVED","label":"TIMESTAMP_DERIVED","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":"yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'","multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"TRANSACTION_TYPE","description":null,"fullyQualifiedName":"TRANSACTION_TYPE","label":"TRANSACTION_TYPE","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"USER_ID","description":null,"fullyQualifiedName":"USER_ID","label":"USER_ID","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"USER_ID_DERIVED","description":null,"fullyQualifiedName":"USER_ID_DERIVED","label":"USER_ID_DERIVED","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_IsActive","description":null,"fullyQualifiedName":"User_IsActive","label":"User.IsActive","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_Name","description":null,"fullyQualifiedName":"User_Name","label":"User.Name","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_Profile_Name","description":null,"fullyQualifiedName":"User_Profile_Name","label":"User.Profile.Name","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_User_Role_Name","description":null,"fullyQualifiedName":"User_User_Role_Name","label":"User.User.Role.Name","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"User_Username","description":null,"fullyQualifiedName":"User_Username","label":"User.Username","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"VERSION_ID","description":null,"fullyQualifiedName":"VERSION_ID","label":"VERSION_ID","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null},{"type":"Text","name":"VERSION_ID_DERIVED","description":null,"fullyQualifiedName":"VERSION_ID_DERIVED","label":"VERSION_ID_DERIVED","isSystemField":null,"isUniqueId":null,"scale":null,"precision":null,"defaultValue":null,"isMultiValue":null,"format":null,"multiValueSeparator":null,"fiscalMonthOffset":null,"acl":null}]}]}';
        query = 'SELECT DOCUMENT_ID__c, DOCUMENT_ID_DERIVED__c, EVENT_TYPE__c, ' +
            'FILE_PREVIEW_TYPE__c, FILE_TYPE__c, ORGANIZATION_ID__c, REQUEST_ID__c, ' +
            'SIZE_BYTES__c, TIMESTAMP__c, TIMESTAMP_DERIVED__c, TRANSACTION_TYPE__c, ' +
            'USER_ID__c, USER_ID_DERIVED__c, User_IsActive__c, User_Name__c, ' +
            'User_Profile_Name__c, User_User_Role_Name__c, User_Username__c, ' +
            'VERSION_ID_DERIVED__c, VERSION_ID__c FROM ContentTransferWithUsers__c';
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
            // ContentTransferWithUsers-specific processing in sub-method call
            for (Integer idx = 0; idx < scope.size(); idx++) {
                ContentTransferWithUsers__c ctwu = (ContentTransferWithUsers__c) scope[idx];
                String strTimestamp = dateList[idx].format('yyyyMMddHHmmss');
                String strTimestampDerived = dateList[idx].format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'');
                
                csvString += '"' + (ctwu.DOCUMENT_ID__c == null ? '' : ctwu.DOCUMENT_ID__c) + '",' +
                    '"' + (ctwu.DOCUMENT_ID_DERIVED__c == null ? '' : ctwu.DOCUMENT_ID_DERIVED__c) + '",' +
                    '"' + (ctwu.EVENT_TYPE__c == null ? '' : ctwu.EVENT_TYPE__c) + '",' +
                    '"' + (ctwu.FILE_PREVIEW_TYPE__c == null ? '' : ctwu.FILE_PREVIEW_TYPE__c) + '",' +
                    '"' + (ctwu.FILE_TYPE__c == null ? '' : ctwu.FILE_TYPE__c) + '",' +
                    '"' + (ctwu.ORGANIZATION_ID__c == null ? '' : ctwu.ORGANIZATION_ID__c) + '",' +
                    '"' + (ctwu.REQUEST_ID__c == null ? '' : ctwu.REQUEST_ID__c) + '",' +
                    '"' + (ctwu.SIZE_BYTES__c == null ? '' : ctwu.SIZE_BYTES__c) + '",' +
                    '"' + strTimestamp + '",' +
                    '"' + strTimestampDerived + '",' +
                    '"' + (ctwu.TRANSACTION_TYPE__c == null ? '' : ctwu.TRANSACTION_TYPE__c) + '",' +
                    '"' + (ctwu.USER_ID__c == null ? '' : ctwu.USER_ID__c) + '",' +
                    '"' + (ctwu.USER_ID_DERIVED__c == null ? '' : ctwu.USER_ID_DERIVED__c) + '",' +
                    '"' + (ctwu.User_IsActive__c == null ? '' : ctwu.User_IsActive__c) + '",' +
                    '"' + (ctwu.User_Name__c == null ? '' : ctwu.User_Name__c) + '",' +
                    '"' + (ctwu.User_Profile_Name__c == null ? '' : ctwu.User_Profile_Name__c) + '",' +
                    '"' + (ctwu.User_User_Role_Name__c == null ? '' : ctwu.User_User_Role_Name__c) + '",' +
                    '"' + (ctwu.User_Username__c == null ? '' : ctwu.User_Username__c) + '",' +
                    '"' + (ctwu.VERSION_ID_DERIVED__c == null ? '' : ctwu.VERSION_ID_DERIVED__c) + '",' +
                    '"' + (ctwu.VERSION_ID__c == null ? '' : ctwu.VERSION_ID__c) + '"\n';
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