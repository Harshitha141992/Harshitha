@Istest(SeeAllData=true)
public class AccountManagerTest {
    @IsTest
    public static void testaccountmanager() {
        Id recordId = createTestRecord();
        RestRequest request = new RestRequest();
        request.requestUri = 'https://salesforce.com/services/apexrest/Accounts/contacts' +recordId;
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account returnedAcc = AccountManager.getAccount();
        System.assert('Test' == returnedAcc.Name);
        System.assert(1 == returnedAcc.contacts.size());
    }
    
  Public static Id createTestRecord(){
        Account acc = new Account(Name = 'Test');
        insert acc;
        Contact con = new Contact(FirstName = 'Test', LastName = 'Test');
        con.AccountId = acc.Id;
        insert con;
        return acc.Id;
    }
}