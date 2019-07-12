@istest

private class TestRestrictContactByName {
    
    @isTest static void testinsert(){
       Contact cc = new Contact(LastName='INVALIDNAME',FirstName='Error');
        
        
        Test.startTest();
        try{
           insert cc;
        }
            Catch(Exception e){
            Test.stopTest();
            }
   
            } 

}