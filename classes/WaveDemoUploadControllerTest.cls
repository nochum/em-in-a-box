@isTest
public class WaveDemoUploadControllerTest {
    
    @isTest
    static void loadWave() {
        // Step 1: create the test data        
        WaveUploadSettings__c newWus = new WaveUploadSettings__c(
            Operation__c = 'load',
            StartTime__c = '2016-04-01 00:00:01',
            EndTime__c = '2016-6-30 23:59:59',
            ExcludeWeekends__c = true,
            Name = 'SObjectMgmtConfig'
        );
        insert newWus;
        
        // private controller class variable elfConfigList gets populated
        // from a SELECT against object EventStoryConfig__c.  We need to
        // setup the test data for that.
        List<EventStoryConfig__c> escList = new List<EventStoryConfig__c> {
            new EventStoryConfig__c(
                EventType__c = 'ContentTransferWithUsers',
                EventLogFileName__c = 'Default-ContentTransferWithUsers'
            ),
                new EventStoryConfig__c(
                    EventType__c = 'LoginAsWithUsers',
                    EventLogFileName__c = 'Default-LoginAsWithUsers'
                ),
                new EventStoryConfig__c(
                    EventType__c = 'LoginWithUsers',
                    EventLogFileName__c = 'Default-LoginWithUsers'
                ),
                new EventStoryConfig__c(
                    EventType__c = 'ReportWithUsers',
                    EventLogFileName__c = 'Default-ReportWithUsers'
                ),
                new EventStoryConfig__c(
                    EventType__c = 'ReportWithUsers',
                    EventLogFileName__c = 'TomTerminated-ReportWithUsers'
                ),
                new EventStoryConfig__c(
                    EventType__c = 'URIWithUsers',
                    EventLogFileName__c = 'Default-URIWithUsers'
                )
                };
        insert escList;

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
        
        // Initialize LoginWithUsers
        List<LoginWithUsers__c> lList = new List<LoginWithUsers__c>();        
        for( Integer i=0; i<10; i++ ){            
            lList.add(
                new LoginWithUsers__c(
                    EVENT_TYPE__c   = 'Login',
                    ORGANIZATION_ID__c  = '00D36000001DsqM',
                    TIMESTAMP__c    = DateTime.now().format('yyyyMMddHHmmss'),
                    TIMESTAMP_DERIVED__c = DateTime.now().format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'')
                )
            );
        }        
        Database.insert( lList );
        
        // Initialize LoginAsWithUsers
        List<LoginAsWithUsers__c> laList = new List<LoginAsWithUsers__c>();        
        for( Integer i=0; i<10; i++ ){            
            laList.add(
                new LoginAsWithUsers__c(
                    EVENT_TYPE__c   = 'LoginAs',
                    ORGANIZATION_ID__c  = '00D36000001DsqM',
                    TIMESTAMP__c    = DateTime.now().format('yyyyMMddHHmmss'),
                    TIMESTAMP_DERIVED__c = DateTime.now().format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'')
                )
            );
        }        
        Database.insert( laList );
        
        // Initialize ReportWithUsers
        List<ReportWithUsers__c> rList = new List<ReportWithUsers__c>();        
        for( Integer i=0; i<10; i++ ){
            rList.add(
                new ReportWithUsers__c(
                    EVENT_TYPE__c   = 'Report',
                    ORGANIZATION_ID__c  = '00D36000001DsqM',
                    TIMESTAMP__c    = DateTime.now().format('yyyyMMddHHmmss'),
                    TIMESTAMP_DERIVED__c = DateTime.now().format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'')
                )
            );
        }        
        Database.insert( rList );
        
        // Initialize URIWithUsers
        List<URIWithUsers__c> uList = new List<URIWithUsers__c>();        
        for( Integer i=0; i<10; i++ ){            
            uList.add(
                new URIWithUsers__c(
                    EVENT_TYPE__c   = 'URI',
                    ORGANIZATION_ID__c  = '00D36000001DsqM',
                    TIMESTAMP__c    = DateTime.now().format('yyyyMMddHHmmss'),
                    TIMESTAMP_DERIVED__c = DateTime.now().format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'')
                )
            );
        }        
        Database.insert( uList );

        // instantiate the controller before the test
        WaveDemoUploadController wduc = new WaveDemoUploadController();
        wduc.startDateTime = '2016-04-01 00:00:01';
        wduc.endDateTime = '2016-6-30 23:59:59';
        wduc.excludeWeekends = true;

        // Step 2: Start the test
        Test.startTest();
        
	    // Step 3: Set mock callout class 
	    Test.setMock(HttpCalloutMock.class, new TestResponseGenerator());

        // Step 4: Use previously created test data
        wduc.loadWave();

        // Step 5: Stop the test.  This will force/wait for async code to complete.
        Test.stopTest();
        
        // Step 6: Assert the code works as expected
        List<InsightsExternalData> insightsExternalDataList = new List<InsightsExternalData>(
            [SELECT Id,Action,EdgemartAlias FROM InsightsExternalData WHERE CreatedDate = TODAY]
        );
        
        System.assertEquals(6, insightsExternalDataList.size());
        
        System.assertEquals( 'Process', insightsExternalDataList[0].Action );
        
        List<InsightsExternalDataPart> insightsExternalDataPartList = new List<InsightsExternalDataPart>(
            [SELECT Id FROM InsightsExternalDataPart WHERE InsightsExternalDataId = :insightsExternalDataList[0].Id ]
        );
        
        System.assertEquals(1, insightsExternalDataPartList.size());
    }
    
    @isTest
    static void loadSObjects() {
        // Step 1: create the test data        
        WaveDemoUploadController wduc = new WaveDemoUploadController();
        wduc.selectedCtwu = 'Default-ContentTransferWithUsers.csv';
        wduc.selectedLawu = 'Default-LoginAsWithUsers.csv';
        wduc.selectedLwu = 'Default-LoginWithUsers.csv';
        wduc.selectedRwu = 'Default-ReportWithUsers.csv';
        wduc.selectedUwu = 'Default-URIWithUsers.csv';
        
        // Step 2: start the test
        Test.startTest();
        
	    // Step 3: Set mock callout class 
	    Test.setMock(HttpCalloutMock.class, new TestResponseGenerator());

        // Step 4: Use previously created test data
        wduc.loadSObjects();

        // Step 5: Stop the test.  This will force/wait for async code to complete.
        Test.stopTest();
        
        // Step 6: Assert the code works as expected
        // at the end of this test I would expect that each of the supported
        // SObjects for holding event data would have some events in them.
        Integer ctwuCount = [SELECT count() FROM ContentTransferWithUsers__c];
        System.assert( (ctwuCount == 0), 'ContentTransferWithUsers does not contain any records!') ;
        Integer lawuCount = [SELECT count() FROM LoginAsWithUsers__c];
        System.assert( (lawuCount == 0), 'LoginAsWithUsers does not contain any records!') ;
        Integer lwuCount = [SELECT count() FROM LoginWithUsers__c];
        System.assert( (lwuCount == 0), 'LoginWithUsers does not contain any records!') ;
        Integer rwuCount = [SELECT count() FROM ReportWithUsers__c];
        System.assert( (rwuCount == 0), 'ReportWithUsers does not contain any records!') ;
        Integer uwuCount = [SELECT count() FROM URIWithUsers__c];
        System.assert( (uwuCount == 0), 'URIWithUsers does not contain any records!') ;
    }
    
    @isTest
    static void truncateSObjects() {
        // Step 1: create the test data        
        WaveUploadSettings__c newWus = new WaveUploadSettings__c(
            Operation__c = 'truncate',
            StartTime__c = '',
            EndTime__c = '',
            ExcludeWeekends__c = false,
            Name = 'SObjectMgmtConfig'
        );
        insert newWus;
        
        // private controller class variable elfConfigList gets populated
        // from a SELECT against object EventStoryConfig__c.  We need to
        // setup the test data for that.
        List<EventStoryConfig__c> escList = new List<EventStoryConfig__c> {
            new EventStoryConfig__c(
                EventType__c = 'ContentTransferWithUsers',
                EventLogFileName__c = 'Default-ContentTransferWithUsers'
            ),
                new EventStoryConfig__c(
                    EventType__c = 'LoginAsWithUsers',
                    EventLogFileName__c = 'Default-LoginAsWithUsers'
                ),
                new EventStoryConfig__c(
                    EventType__c = 'LoginWithUsers',
                    EventLogFileName__c = 'Default-LoginWithUsers'
                ),
                new EventStoryConfig__c(
                    EventType__c = 'ReportWithUsers',
                    EventLogFileName__c = 'Default-ReportWithUsers'
                ),
                new EventStoryConfig__c(
                    EventType__c = 'ReportWithUsers',
                    EventLogFileName__c = 'TomTerminated-ReportWithUsers'
                ),
                new EventStoryConfig__c(
                    EventType__c = 'URIWithUsers',
                    EventLogFileName__c = 'Default-URIWithUsers'
                )
                };
        insert escList;

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
        
        // Initialize LoginWithUsers
        List<LoginWithUsers__c> lList = new List<LoginWithUsers__c>();        
        for( Integer i=0; i<10; i++ ){            
            lList.add(
                new LoginWithUsers__c(
                    EVENT_TYPE__c   = 'Login',
                    ORGANIZATION_ID__c  = '00D36000001DsqM',
                    TIMESTAMP__c    = DateTime.now().format('yyyyMMddHHmmss'),
                    TIMESTAMP_DERIVED__c = DateTime.now().format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'')
                )
            );
        }        
        Database.insert( lList );
        
        // Initialize LoginAsWithUsers
        List<LoginAsWithUsers__c> laList = new List<LoginAsWithUsers__c>();        
        for( Integer i=0; i<10; i++ ){            
            laList.add(
                new LoginAsWithUsers__c(
                    EVENT_TYPE__c   = 'LoginAs',
                    ORGANIZATION_ID__c  = '00D36000001DsqM',
                    TIMESTAMP__c    = DateTime.now().format('yyyyMMddHHmmss'),
                    TIMESTAMP_DERIVED__c = DateTime.now().format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'')
                )
            );
        }        
        Database.insert( laList );
        
        // Initialize ReportWithUsers
        List<ReportWithUsers__c> rList = new List<ReportWithUsers__c>();        
        for( Integer i=0; i<10; i++ ){            
            rList.add(
                new ReportWithUsers__c(
                    EVENT_TYPE__c   = 'Report',
                    ORGANIZATION_ID__c  = '00D36000001DsqM',
                    TIMESTAMP__c    = DateTime.now().format('yyyyMMddHHmmss'),
                    TIMESTAMP_DERIVED__c = DateTime.now().format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'')
                )
            );
        }        
        Database.insert( rList );
        
        // Initialize URIWithUsers
        List<URIWithUsers__c> uList = new List<URIWithUsers__c>();        
        for( Integer i=0; i<10; i++ ){            
            uList.add(
                new URIWithUsers__c(
                    EVENT_TYPE__c   = 'URI',
                    ORGANIZATION_ID__c  = '00D36000001DsqM',
                    TIMESTAMP__c    = DateTime.now().format('yyyyMMddHHmmss'),
                    TIMESTAMP_DERIVED__c = DateTime.now().format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'')
                )
            );
        }        
        Database.insert( uList );
        
        WaveDemoUploadController wduc = new WaveDemoUploadController();

        // Step 2: start the test
        Test.startTest();
        
	    // Step 3: Set mock callout class 
	    Test.setMock(HttpCalloutMock.class, new TestResponseGenerator());

        // Step 4: Use previously created test data
        wduc.truncateSObjects();

        // Step 5: Stop the test.  This will force/wait for async code to complete.
        Test.stopTest();
        
        // Step 6: Assert the code works as expected
        // in this case I would expect that the SObjects
        // holding events would be empty
        Integer ctwuCount = [SELECT count() FROM ContentTransferWithUsers__c];
        System.assert( (ctwuCount == 0), 'ContentTransferWithUsers should be empty, but is not!') ;
        Integer lawuCount = [SELECT count() FROM LoginAsWithUsers__c];
        System.assert( (lawuCount == 0), 'LoginAsWithUsers should be empty, but is not!') ;
        Integer lwuCount = [SELECT count() FROM LoginWithUsers__c];
        System.assert( (lwuCount == 0), 'LoginWithUsers should be empty, but is not!') ;
        Integer rwuCount = [SELECT count() FROM ReportWithUsers__c];
        System.assert( (rwuCount == 0), 'ReportWithUsers should be empty, but is not!') ;
        Integer uwuCount = [SELECT count() FROM URIWithUsers__c];
        System.assert( (uwuCount == 0), 'URIWithUsers should be empty, but is not!') ;
    }
}