public class wrapperselector {
    
    Public boolean checked {get;set;}
    Public List<wrapperclass> wrapList {get;set;}
    public wrapperselector(ApexPages.StandardController stdController){
        
        checked=false;
        
    }
    
     Public void selectallnone(){

    if(!checked)

      checked = true;

    else

      checked = false;

 }

    Public List<wrapperclass> getWrapperList(){

   wrapList = New List<wrapperclass>();

   for(Contact con:[Select Contact.SUP_manual_do_not_call__c,Contact.SUP_manual_do_not_email__c,Contact.SUP_manual_do_not_mail__c,Contact.SUP_manual_do_not_solicit__c from Contact]){

      if(Boolean.valueOf(Contact.SUP_manual_do_not_solicit__c)==false)

       wrapList.add(New wrapperclass(con,false)); 

     else

     wrapList.add(New wrapperclass(con,true));   

   } 

   return wrapList; 

  }
    Public class wrapperclass{

   Public Contact accRec{get;set;}

   Public boolean checkFlag{get;set;}

    

   Public wrapperclass(Contact con,boolean flag){

    accRec = con;

    checkFlag = flag;

   }

  } 

}