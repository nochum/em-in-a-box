public class WaveDemoUploadController {
    private List<EventStoryConfig__c> elfConfigList;
    
    public String startDateTime { get; set; }
    public String endDateTime { get; set; }
    public Boolean excludeWeekends { get; set; }
    
    // ContentTransferWithUsers option list
    public String selectedCtwu { get; set; }
    public List<SelectOption> ctwuList { get; set; }
    
    // LoginWithUsers option list
    public String selectedLwu { get; set; }
    public List<SelectOption> lwuList { get; set; }
    
    // LoginAsWithUsers option list
    public String selectedLawu { get; set; }
    public List<SelectOption> lawuList { get; set; }
    
    // ReportWithUsers option list
    public String selectedRwu { get; set; }
    public List<SelectOption> rwuList { get; set; }
    
    // URIWithUsers option list
    public String selectedUwu { get; set; }
    public List<SelectOption> uwuList { get; set; }
    
    // class constructor
    public WaveDemoUploadController() {
        elfConfigList = new List<EventStoryConfig__c>([SELECT EventType__c, EventLogFileName__c FROM EventStoryConfig__c]);
        
        ctwuList = new List<SelectOption> {new SelectOption('None', '--None--')};
        lwuList = new List<SelectOption> {new SelectOption('None', '--None--')};
        lawuList = new List<SelectOption> {new SelectOption('None', '--None--')};
        rwuList = new List<SelectOption> {new SelectOption('None', '--None--')};
        uwuList = new List<SelectOption> {new SelectOption('None', '--None--')};

        for (EventStoryConfig__c elf : elfConfigList) {
            if (elf.EventType__c.equals('ContentTransferWithUsers'))
                ctwuList.add(new SelectOption(elf.EventLogFileName__c, elf.EventLogFileName__c));
            else if (elf.EventType__c.equals('LoginWithUsers'))
                lwuList.add(new SelectOption(elf.EventLogFileName__c, elf.EventLogFileName__c));
            else if (elf.EventType__c.equals('LoginAsWithUsers'))
                lawuList.add(new SelectOption(elf.EventLogFileName__c, elf.EventLogFileName__c));
            else if (elf.EventType__c.equals('ReportWithUsers'))
                rwuList.add(new SelectOption(elf.EventLogFileName__c, elf.EventLogFileName__c));
            else if (elf.EventType__c.equals('URIWithUsers'))
                uwuList.add(new SelectOption(elf.EventLogFileName__c, elf.EventLogFileName__c));
        }
    }
    
    public PageReference loadWave() {
        Integer settingCount = [SELECT count() FROM WaveUploadSettings__c WHERE Name = 'SObjectMgmtConfig'];
        if (settingCount == 0) {
            WaveUploadSettings__c newWus = new WaveUploadSettings__c(
                Operation__c = 'load',
                StartTime__c = this.startDateTime,
                EndTime__c = this.endDateTime,
                ExcludeWeekends__c = this.excludeWeekends,
                Name = 'SObjectMgmtConfig'
            );
            insert newWus;
        } else {
            WaveUploadSettings__c wus = [SELECT Id, Operation__c, StartTime__c, EndTime__c, ExcludeWeekends__c
                                         FROM WaveUploadSettings__c
                                         WHERE Name = 'SObjectMgmtConfig'];
            wus.Operation__c = 'load';
            wus.StartTime__c = this.startDateTime;
            wus.EndTime__c = this.endDateTime;
            wus.ExcludeWeekends__c = this.excludeWeekends;
            update wus;
        }
        
        for (EventStoryConfig__c elfSetting : elfConfigList) {
            Type t = Type.forName(elfSetting.EventType__c);
            EventLogFile elf = (EventLogFile) t.newInstance();
            Database.executeBatch( elf, 200 );
        }

        return null;
    }
    
    public PageReference loadSObjects() {
        if (!selectedCtwu.equals('None'))
            System.enqueueJob(new WaveDemoLoadSobjects('ContentTransferWithUsers', 
                                                       selectedCtwu,
                                                       UserInfo.getSessionId()));
        if (!selectedLawu.equals('None'))
            System.enqueueJob(new WaveDemoLoadSobjects('LoginAsWithUsers', 
                                                       selectedLawu,
                                                       UserInfo.getSessionId()));
        if (!selectedLwu.equals('None'))
            System.enqueueJob(new WaveDemoLoadSobjects('LoginWithUsers', 
                                                       selectedLwu,
                                                       UserInfo.getSessionId()));
        if (!selectedRwu.equals('None'))
            System.enqueueJob(new WaveDemoLoadSobjects('ReportWithUsers', 
                                                       selectedRwu,
                                                       UserInfo.getSessionId()));
        if (!selectedUwu.equals('None'))
            System.enqueueJob(new WaveDemoLoadSobjects('URIWithUsers', 
                                                       selectedUwu,
                                                       UserInfo.getSessionId()));

        return null;
    }
    
    
    public PageReference truncateSObjects() {
        Integer settingCount = [SELECT count() FROM WaveUploadSettings__c WHERE Name = 'SObjectMgmtConfig'];
        if (settingCount == 0) {
            WaveUploadSettings__c newWus = new WaveUploadSettings__c(
                Operation__c = 'truncate',
                Name = 'SObjectMgmtConfig'
            );
            insert newWus;
        } else {
            WaveUploadSettings__c wus = [SELECT Id, Operation__c
                                         FROM WaveUploadSettings__c
                                         WHERE Name = 'SObjectMgmtConfig'];
            wus.Operation__c = 'truncate';
            update wus;
        }
        
        for (EventStoryConfig__c elfSetting : elfConfigList) {
            Type t = Type.forName(elfSetting.EventType__c);
            EventLogFile elf = (EventLogFile) t.newInstance();
            Database.executeBatch( elf, 2000 );
        }

        return null;
    }
}