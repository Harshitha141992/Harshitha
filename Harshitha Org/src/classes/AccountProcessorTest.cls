@IsTest
public class AccountProcessorTest {
    Public static Testmethod void TestcountprocessorTest(){
        Account a = new Account();
        a.name =  'Hhhhhsfgfh';
        Insert a;
        
        Contact cont = new Contact();
        cont.FirstName = 'harshini';
        cont.LastName = 'Benakanahalli';
        cont.AccountId = a.Id;
        Insert cont;
        
        set<Id> setAccId =new set<Id>();
        setAccId.add(a.Id);
        
        Test.startTest();
        AccountProcessor.countContacts(setAccId);
        Test.stopTest();
        
        Account Acc = [SELECT Number_of_Contacts__c FROM Account where Id = :a.Id Limit 1];
        System.assertEquals(Integer.valueof(Acc.Number_of_Contacts__c),1);
        
    }

}