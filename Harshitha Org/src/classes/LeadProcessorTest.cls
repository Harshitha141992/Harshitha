@isTest
public class LeadProcessorTest {

    @testSetup()
    public static void test1() {
        List<Lead> lllll = new List<Lead>();
            for (Integer i=0;i<200;i++) {
            Lead l = new lead();
            l.LastName = 'name'+i;
            l.Company = 'company';
            l.Status = 'First';   
            l.LeadSource = 'hhhhh';
            lllll.add(l);
            
        }
        insert lllll;
 }

        Public static testmethod void test() {  
        Test.startTest();
        LeadProcessor lpa = new LeadProcessor();
        Id batchId = Database.executeBatch(lpa);
        Test.stopTest();
        System.assertEquals(200, [select count() from Lead where LeadSource = 'hhhhh']);
    }
    

        
    
}