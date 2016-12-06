@IsTest
public class EventLogFilesTest {

    static testmethod void testContentTransferWithUsersLoad() {
        // Set processing context
        WaveUploadSettings__c newWus = new WaveUploadSettings__c(
            Operation__c = 'load',
            StartTime__c = '2016-04-01 00:00:01',
            EndTime__c = '2016-6-30 23:59:59',
            ExcludeWeekends__c = true,
            Name = 'SObjectMgmtConfig'
        );
        insert newWus;

        // Initialize ContentTransferWithUsers
        List<ContentTransferWithUsers__c> ctList = new List<ContentTransferWithUsers__c>();
        
        for( Integer i=0; i<10; i++ ){
            
            ctList.add(
                new ContentTransferWithUsers__c(
                    EVENT_TYPE__c   = 'ContentTransfer',
                    ORGANIZATION_ID__c  = '00D36000001DsqM',
                    TIMESTAMP__c    = DateTime.now().format('yyyyMMddHHmmss'),
                    TIMESTAMP_DERIVED__c = DateTime.now().format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'')
                )
            );
        }
        Database.insert( ctList );

       Test.startTest();
       ContentTransferWithUsers c = new ContentTransferWithUsers();
       Database.executeBatch(c);
       Test.stopTest();

       // Difficult to test whether items got loaded into Wave 
       Integer i = [SELECT COUNT() FROM ContentTransferWithUsers__c];
       System.assert((i > 0), 'Expected more than zero items in ContentTransferWithUsers__c.');
    }

    static testmethod void testContentTransferWithUsersTruncate() {
        // Set processing context
        WaveUploadSettings__c newWus = new WaveUploadSettings__c(
            Operation__c = 'truncate',
            StartTime__c = '',
            EndTime__c = '',
            ExcludeWeekends__c = false,
            Name = 'SObjectMgmtConfig'
        );
        insert newWus;

        // Initialize ContentTransferWithUsers
        List<ContentTransferWithUsers__c> ctList = new List<ContentTransferWithUsers__c>();
        
        for( Integer i=0; i<10; i++ ){
            
            ctList.add(
                new ContentTransferWithUsers__c(
                    EVENT_TYPE__c   = 'ContentTransfer',
                    ORGANIZATION_ID__c  = '00D36000001DsqM',
                    TIMESTAMP__c    = DateTime.now().format('yyyyMMddHHmmss'),
                    TIMESTAMP_DERIVED__c = DateTime.now().format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'')
                )
            );
        }
        Database.insert( ctList );

       Test.startTest();
       ContentTransferWithUsers c = new ContentTransferWithUsers();
       Database.executeBatch(c);
       Test.stopTest();

       // Difficult to test whether items got loaded into Wave 
       Integer i = [SELECT COUNT() FROM ContentTransferWithUsers__c];
       System.assert((i == 0), 'Expected zero items in ContentTransferWithUsers__c.');
    }

    static testmethod void testLoginAsWithUsersLoad() {
        // Set processing context
        WaveUploadSettings__c newWus = new WaveUploadSettings__c(
            Operation__c = 'load',
            StartTime__c = '2016-04-01 00:00:01',
            EndTime__c = '2016-6-30 23:59:59',
            ExcludeWeekends__c = true,
            Name = 'SObjectMgmtConfig'
        );
        insert newWus;

        // Initialize LoginAsWithUsers
        List<LoginAsWithUsers__c> ctList = new List<LoginAsWithUsers__c>();
        
        for( Integer i=0; i<10; i++ ){
            
            ctList.add(
                new LoginAsWithUsers__c(
                    EVENT_TYPE__c   = 'LoginAs',
                    ORGANIZATION_ID__c  = '00D36000001DsqM',
                    TIMESTAMP__c    = DateTime.now().format('yyyyMMddHHmmss'),
                    TIMESTAMP_DERIVED__c = DateTime.now().format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'')
                )
            );
        }
        Database.insert( ctList );

       Test.startTest();
       LoginAsWithUsers c = new LoginAsWithUsers();
       Database.executeBatch(c);
       Test.stopTest();

       // Difficult to test whether items got loaded into Wave 
       Integer i = [SELECT COUNT() FROM LoginAsWithUsers__c];
       System.assert((i > 0), 'Expected more than zero items in LoginAsWithUsers__c.');
    }

    static testmethod void testLoginAsWithUsersTruncate() {
        // Set processing context
        WaveUploadSettings__c newWus = new WaveUploadSettings__c(
            Operation__c = 'truncate',
            StartTime__c = '',
            EndTime__c = '',
            ExcludeWeekends__c = false,
            Name = 'SObjectMgmtConfig'
        );
        insert newWus;

        // Initialize LoginAsWithUsers
        List<LoginAsWithUsers__c> ctList = new List<LoginAsWithUsers__c>();
        
        for( Integer i=0; i<10; i++ ){
            
            ctList.add(
                new LoginAsWithUsers__c(
                    EVENT_TYPE__c   = 'LoginAs',
                    ORGANIZATION_ID__c  = '00D36000001DsqM',
                    TIMESTAMP__c    = DateTime.now().format('yyyyMMddHHmmss'),
                    TIMESTAMP_DERIVED__c = DateTime.now().format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'')
                )
            );
        }
        Database.insert( ctList );

       Test.startTest();
       LoginAsWithUsers c = new LoginAsWithUsers();
       Database.executeBatch(c);
       Test.stopTest();

       // Difficult to test whether items got loaded into Wave 
       Integer i = [SELECT COUNT() FROM LoginAsWithUsers__c];
       System.assert((i == 0), 'Expected zero items in LoginAsWithUsers__c.');
    }

    static testmethod void testLoginWithUsersLoad() {
        // Set processing context
        WaveUploadSettings__c newWus = new WaveUploadSettings__c(
            Operation__c = 'load',
            StartTime__c = '2016-04-01 00:00:01',
            EndTime__c = '2016-6-30 23:59:59',
            ExcludeWeekends__c = true,
            Name = 'SObjectMgmtConfig'
        );
        insert newWus;

        // Initialize LoginWithUsers
        List<LoginWithUsers__c> ctList = new List<LoginWithUsers__c>();
        
        for( Integer i=0; i<10; i++ ){
            
            ctList.add(
                new LoginWithUsers__c(
                    EVENT_TYPE__c   = 'Login',
                    ORGANIZATION_ID__c  = '00D36000001DsqM',
                    TIMESTAMP__c    = DateTime.now().format('yyyyMMddHHmmss'),
                    TIMESTAMP_DERIVED__c = DateTime.now().format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'')
                )
            );
        }
        Database.insert( ctList );

       Test.startTest();
       LoginWithUsers c = new LoginWithUsers();
       Database.executeBatch(c);
       Test.stopTest();

       // Difficult to test whether items got loaded into Wave 
       Integer i = [SELECT COUNT() FROM LoginWithUsers__c];
       System.assert((i > 0), 'Expected more than zero items in LoginWithUsers__c.');
    }

    static testmethod void testLoginWithUsersTruncate() {
        // Set processing context
        WaveUploadSettings__c newWus = new WaveUploadSettings__c(
            Operation__c = 'truncate',
            StartTime__c = '',
            EndTime__c = '',
            ExcludeWeekends__c = false,
            Name = 'SObjectMgmtConfig'
        );
        insert newWus;

        // Initialize LoginWithUsers
        List<LoginWithUsers__c> ctList = new List<LoginWithUsers__c>();
        
        for( Integer i=0; i<10; i++ ){
            
            ctList.add(
                new LoginWithUsers__c(
                    EVENT_TYPE__c   = 'Login',
                    ORGANIZATION_ID__c  = '00D36000001DsqM',
                    TIMESTAMP__c    = DateTime.now().format('yyyyMMddHHmmss'),
                    TIMESTAMP_DERIVED__c = DateTime.now().format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'')
                )
            );
        }
        Database.insert( ctList );

       Test.startTest();
       LoginWithUsers c = new LoginWithUsers();
       Database.executeBatch(c);
       Test.stopTest();

       // Difficult to test whether items got loaded into Wave 
       Integer i = [SELECT COUNT() FROM LoginWithUsers__c];
       System.assert((i == 0), 'Expected zero items in LoginWithUsers__c.');
    }
    
    static testmethod void testReportWithUsersLoad() {
        // Set processing context
        WaveUploadSettings__c newWus = new WaveUploadSettings__c(
            Operation__c = 'load',
            StartTime__c = '2016-04-01 00:00:01',
            EndTime__c = '2016-6-30 23:59:59',
            ExcludeWeekends__c = true,
            Name = 'SObjectMgmtConfig'
        );
        insert newWus;

        // Initialize ReportWithUsers
        List<ReportWithUsers__c> ctList = new List<ReportWithUsers__c>();
        
        for( Integer i=0; i<10; i++ ){
            
            ctList.add(
                new ReportWithUsers__c(
                    EVENT_TYPE__c   = 'Report',
                    ORGANIZATION_ID__c  = '00D36000001DsqM',
                    TIMESTAMP__c    = DateTime.now().format('yyyyMMddHHmmss'),
                    TIMESTAMP_DERIVED__c = DateTime.now().format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'')
                )
            );
        }
        Database.insert( ctList );

       Test.startTest();
       ReportWithUsers c = new ReportWithUsers();
       Database.executeBatch(c);
       Test.stopTest();

       // Difficult to test whether items got loaded into Wave 
       Integer i = [SELECT COUNT() FROM ReportWithUsers__c];
       System.assert((i > 0), 'Expected more than zero items in ReportWithUsers__c.');
    }

    static testmethod void testReportWithUsersTruncate() {
        // Set processing context
        WaveUploadSettings__c newWus = new WaveUploadSettings__c(
            Operation__c = 'truncate',
            StartTime__c = '',
            EndTime__c = '',
            ExcludeWeekends__c = false,
            Name = 'SObjectMgmtConfig'
        );
        insert newWus;

        // Initialize ReportWithUsers
        List<ReportWithUsers__c> ctList = new List<ReportWithUsers__c>();
        
        for( Integer i=0; i<10; i++ ){
            
            ctList.add(
                new ReportWithUsers__c(
                    EVENT_TYPE__c   = 'Report',
                    ORGANIZATION_ID__c  = '00D36000001DsqM',
                    TIMESTAMP__c    = DateTime.now().format('yyyyMMddHHmmss'),
                    TIMESTAMP_DERIVED__c = DateTime.now().format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'')
                )
            );
        }
        Database.insert( ctList );

       Test.startTest();
       ReportWithUsers c = new ReportWithUsers();
       Database.executeBatch(c);
       Test.stopTest();

       // Difficult to test whether items got loaded into Wave 
       Integer i = [SELECT COUNT() FROM ReportWithUsers__c];
       System.assert((i == 0), 'Expected zero items in ReportWithUsers__c.');
    }
    
    static testmethod void testURIWithUsersLoad() {
        // Set processing context
        WaveUploadSettings__c newWus = new WaveUploadSettings__c(
            Operation__c = 'load',
            StartTime__c = '2016-04-01 00:00:01',
            EndTime__c = '2016-6-30 23:59:59',
            ExcludeWeekends__c = true,
            Name = 'SObjectMgmtConfig'
        );
        insert newWus;

        // Initialize URIWithUsers
        List<URIWithUsers__c> ctList = new List<URIWithUsers__c>();
        
        for( Integer i=0; i<10; i++ ){
            
            ctList.add(
                new URIWithUsers__c(
                    EVENT_TYPE__c   = 'URI',
                    ORGANIZATION_ID__c  = '00D36000001DsqM',
                    TIMESTAMP__c    = DateTime.now().format('yyyyMMddHHmmss'),
                    TIMESTAMP_DERIVED__c = DateTime.now().format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'')
                )
            );
        }
        Database.insert( ctList );

       Test.startTest();
       URIWithUsers c = new URIWithUsers();
       Database.executeBatch(c);
       Test.stopTest();

       // Difficult to test whether items got loaded into Wave 
       Integer i = [SELECT COUNT() FROM URIWithUsers__c];
       System.assert((i > 0), 'Expected more than zero items in URIWithUsers__c.');
    }

    static testmethod void testURIWithUsersTruncate() {
        // Set processing context
        WaveUploadSettings__c newWus = new WaveUploadSettings__c(
            Operation__c = 'truncate',
            StartTime__c = '',
            EndTime__c = '',
            ExcludeWeekends__c = false,
            Name = 'SObjectMgmtConfig'
        );
        insert newWus;

        // Initialize URIWithUsers
        List<URIWithUsers__c> ctList = new List<URIWithUsers__c>();
        
        for( Integer i=0; i<10; i++ ){
            
            ctList.add(
                new URIWithUsers__c(
                    EVENT_TYPE__c   = 'URI',
                    ORGANIZATION_ID__c  = '00D36000001DsqM',
                    TIMESTAMP__c    = DateTime.now().format('yyyyMMddHHmmss'),
                    TIMESTAMP_DERIVED__c = DateTime.now().format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'')
                )
            );
        }
        Database.insert( ctList );

       Test.startTest();
       URIWithUsers c = new URIWithUsers();
       Database.executeBatch(c);
       Test.stopTest();

       // Difficult to test whether items got loaded into Wave 
       Integer i = [SELECT COUNT() FROM URIWithUsers__c];
       System.assert((i == 0), 'Expected zero items in URIWithUsers__c.');
    }
    
}