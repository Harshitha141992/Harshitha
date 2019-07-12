Public with sharing class checkAllcolumnDemocontroller {

Public List<wrapperclass> wrapList {get;set;}

Public boolean checked{get;set;}

  Public checkAllcolumnDemocontroller(){

  checked = false;

  }

   

  Public void selectallnone(){

    if(!checked)

      checked = true;

    else

      checked = false;
System.debug('checked'+checked);
 }

   

  Public List<wrapperclass> getWrapperList(){

   wrapList = New List<wrapperclass>();

   for(Account acc:[Select name,accountnumber,id,annualrevenue,description from account limit 5]){

      if(!checked)

       wrapList.add(New wrapperclass(acc,false)); 

     else

     wrapList.add(New wrapperclass(acc,true));   

   } 

   return wrapList; 

  }

   

  Public class wrapperclass{

   Public account accRec{get;set;}

   Public boolean checkFlag{get;set;}

    

   Public wrapperclass (account acc,boolean flag){

    accRec = acc;

    checkFlag = flag;

   }

  } 

}