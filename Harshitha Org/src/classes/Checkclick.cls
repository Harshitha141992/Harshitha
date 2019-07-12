public class Checkclick {
    
    Public boolean three{get;set;}
    Public Contact con {get;set;}
    
    
    public Checkclick(ApexPages.StandardController stdController){
        three=false;
        con=new Contact();
        //three=false;
       //contact con = (contact) stdcontroller.getrecord();
       // this.con=[select SUP_manual_do_not_solicit__c,SUP_manual_do_not_mail__c,SUP_manual_do_not_email__c,SUP_manual_do_not_call__c from contact];
        
    }
    
    Public PageReference checkChanged(){
        
        if(!con.SUP_manual_do_not_solicit__c){
            
            three=true;
           
        }
        else{
            
            three=false;
        }
        System.debug('con.SUP_manual_do_not_solicit__c'+con.SUP_manual_do_not_solicit__c );
   System.debug('three' +three);
        
return null;
        
        
    }
}