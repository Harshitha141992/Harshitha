@isTest
private class DailyLeadProcessorTest {

    
    public static String CRON_EXP = '0 0 1 * * ?';

    static testmethod void testScheduledJob() {

        // Create some out of date Lead records
        List<Lead> leads = new List<Lead>();
       for (Integer i = 0; i < 200; i++) {
			leads.add(new Lead(LastName='Dreamforce'+i, Company='Test1 Inc.', Status='Open - Not Contacted'));
		}
            
       
        insert leads;
        
       
       
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());         
       Test.stopTest();
        
       
    }
}