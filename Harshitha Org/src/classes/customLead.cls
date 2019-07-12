global class customLead
{
 public Students__c objStudents{get;set;}
   
    webservice static void coversion(string student) 
    { 
    Students__c objStudents=new Students__c();
     
         objStudents=[SELECT ID,Name FROM Students__c WHERE id=:student];
          
         Account objAcc=new Account();
         objAcc.Name=objStudents.Name;
         Insert objAcc;
          
         contact Objcon=new contact();
         Objcon.Lastname=objStudents.Name;
         Insert Objcon;
          
         
         Opportunity objOpp= new Opportunity();
         objOpp.Name=objStudents.Name;
         objOpp.StageName='Active';
         objOpp.CloseDate=System.Today();
 
         Insert objOpp;
    }
}