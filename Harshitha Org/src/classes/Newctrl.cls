public with sharing class Newctrl {
 public Contact con {
  get;
  set;
 }
 public List < Contact > conlist {
   get;
   set;
  }
  // create a list of strings to hold the conditions
 List < string > conditions = new List < string > ();
 private integer totalRecs = 0;
 private integer OffsetSize = 0;
 private integer LimitSize = 4;

 public Newctrl() {
  system.debug('==>Newctrl==>');
  con = new Contact();
  //accountList  = new List<Account>();
 }

 public void search() {
  System.debug('Inside Search method');
  totalRecs = 0;
  OffsetSize = 0;
  if (conlist != null && conlist.size() > 0)
   conlist = null;

  searchcontacts();
  conditions.clear();
 }

 public void searchcontacts() {

  System.debug('Totalords is ==>' + totalRecs);
  System.debug('OffsetSize==>' + OffsetSize);

  if (conlist != null && !conlist.isEmpty()) {
   conlist.clear();
  }
  String strQuery = 'SELECT Id,FirstName,LastName,Email,MailingState,MailingStreet,Birthdate,phone,MailingCity,MailingPostalcode,Address__c from Contact';

  if (con.FirstName != null && con.FirstName != '') {
   conditions.add('FirstName = \'' + con.FirstName + '\'');
  }



  if (con.LastName != null && con.LastName != '') {
   conditions.add('LastName = \'' + con.LastName + '\'');
  }

  if (con.phone != null && con.Phone != '') {
   conditions.add('Phone = \'' + con.Phone + '\'');
  }


  if (con.Email != null && con.Email != '') {
   conditions.add('Email = \'' + con.Email + '\'');

  }
     
 if (con.MailingState != null && con.MailingState != '') {
   conditions.add('MailingState = \'' + con.MailingState + '\'');

  }
     
if (con.MailingCity != null && con.MailingCity != '') {
   conditions.add('MailingCity = \'' + con.MailingCity + '\'');

  }
     
 if (con.Birthdate!= null) {
   conditions.add('Birthdate = \'' + con.Birthdate + '\'');

  }


  if (conditions.size() > 0) {
   strQuery += '  WHERE ' + conditions[0];
   for (Integer i = 1; i < conditions.size(); i++)
    strQuery += '  AND ' + conditions[i];
  }
  if (totalRecs != null && totalRecs == 0) {
   system.debug('strQuery' + strQuery);
   List < Contact > contemp = Database.query(strQuery);
   totalRecs = (contemp != null && contemp.size() > 0) ? contemp.size() : 0;
  }

  system.debug('strQuery' + strQuery);
  // add sort and limits at the end  
  strQuery += ' ORDER BY Name  ASC, CreatedDate DESC LIMIT :LimitSize OFFSET :OffsetSize';

     if(strQuery.contains('WHERE')) {
  conlist = Database.query(strQuery);
     }

  //conditions.clear();
  //return accountList.size();
 }


 public void FirstPage() {
  OffsetSize = 0;
  searchcontacts();
 }
 public void previous() {
  OffsetSize = (OffsetSize - LimitSize);
  searchcontacts();
 }
 public void next() {
  OffsetSize = OffsetSize + LimitSize;
  searchcontacts();
 }
 public void LastPage() {
  OffsetSize = totalrecs - math.mod(totalRecs, LimitSize);
  searchcontacts();
 }
 public boolean getprev() {

  if (OffsetSize == 0) {

   return true;
  } else {

   return false;
  }
 }
 public boolean getnxt() {
  if ((OffsetSize + LimitSize) > totalRecs) {

   return true;
  } else {

   return false;
  }
 }
}