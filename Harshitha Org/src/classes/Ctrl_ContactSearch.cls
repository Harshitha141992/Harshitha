public with sharing class Ctrl_ContactSearch {
 public List < Contact > contacts {
  get;
  set;
 }
 public String firstname {
  get;
  set;
 }
 public String lastname {
  get;
  set;
 }
 public String mailingState {
  get;
  set;
 }
 public String phone {
  get;
  set;
 }
 public String Email {
  get;
  set;
 }
 public Date birthdate {
  get;
  set;
 }
 public String mailingcity {
  get;
  set;
 }
 public String id {
  get;
  set;
 }
 public String WundermannId {
  get;
  set;
 }
 public String mailingPostalcode {
  get;
  set;
 }
 public String mailingstreet {
  get;
  set;
 }
 public String Address {
  get;
  set;
 }
 Public String contactID {
  get;
  set;
 }
 private integer totalRecs = 0;
 private integer OffsetSize = 0;
 private integer LimitSize = 5;



 public Ctrl_ContactSearch() {
  totalRecs = 0;
  OffsetSize = 0;
 }
 public PageReference searchContacts() {

  validateInputFields();
  boolean exists = false;
  String query = 'SELECT Id,FirstName,LastName,Email,MailingState,MailingStreet,Birthdate,WundermannId__c,phone,MailingCity,MailingPostalcode,Address__c from Contact where';
  if (!String.isBlank(firstname)) {
   exists = true;
   query = query + ' FirstName=:firstname or';
  } 

  if (!String.isBlank(lastname)) {
   exists = true;
   query = query + ' LastName=:lastname or';
  } 
     
  if (!String.isBlank(mailingstate)) {
   exists = true;
   query = query + ' MailingState=:mailingstate or';
  }
  if (!String.isBlank(mailingcity)) {
   exists = true;
   query = query + ' MailingCity=:mailingcity or';
  }
  if (!String.isBlank(phone)) {
   exists = true;
   query = query + ' Phone=:phone or';
  }

  if (!String.isBlank(mailingPostalCode)) {
   exists = true;
   query = query + ' MailingPostalcode=:mailingpostalcode or';
  }

  if (!String.isBlank(mailingstreet)) {
   exists = true;
   query = query + ' mailingstreet LIKE \'%' + String.escapeSingleQuotes(mailingstreet) + '%\' or';
  }

  if (!String.isBlank(Email)) {
   exists = true;
   query = query + ' Email=:Email or';
  }

  if (!String.isBlank(id)) {
   exists = true;
   query = query + ' id=:id or';
  }

  if (!String.isBlank(WundermannId)) {
   exists = true;
   query = query + ' WundermannId__c=:WundermannId or';
  }

  if (birthdate != null) {
   exists = true;
   query = query + ' BirthDate=:birthdate';
  }
  if (exists) {
   if (query.endsWithIgnoreCase('or')) {
    query = query.left(query.length() - 2);
   }
   List < Contact > contacttemp = new List < Contact > ();
   contacttemp = Database.query(query);
   totalRecs = (contacttemp != null && contacttemp.size() > 0) ? contacttemp.size() : 0;

   query += ' ORDER BY Name  ASC, CreatedDate DESC LIMIT :LimitSize OFFSET :OffsetSize';
   if (query.containsIgnorecase('WHERE')) {
    contacts = Database.query(query);
   }
   System.debug('query:' + query);
   /*contacts = Database.query(query); */


  } else {
   contacts = new List < Contact > ();
  }
  return null;
 }

 private void validateInputFields() {
  System.debug('Validate input fields - Enter');
  if (String.isBlank(firstname) || String.isBlank(lastname)) {
   ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, 'First name and last name required');
   ApexPages.addMessage(msg);
   return;
  }
  if (!String.isBlank(firstname) && !String.isBlank(lastname)) {
   checkOneOtherAttribute();
  }
  System.debug('Validate input fields - Exit');
 }

 private void checkOneOtherAttribute() {
     System.debug('CheckOneOtherAttribute method - Enter');
  if (String.isBlank(mailingstate) && String.isBlank(mailingcity) && 
      String.isBlank(Phone) && String.isBlank(mailingstreet) && 
      String.isBlank(mailingpostalcode) && String.isBlank(Email) && Birthdate == null) {
   ApexPages.Message msgs = new ApexPages.Message(ApexPages.Severity.ERROR, 'One more input field is required');
   ApexPages.addMessage(msgs);
     System.debug('CheckOneOtherAttribute method - Exit');
   return;
  }
 }

















 public PageReference click()

 {

  //contacts=[SELECT Id,FirstName,LastName,Email,Birthdate,Salesforce_Id1__c,WundermannId__c,phone,Address__c from Contact];
  PageReference redirect = new PageReference('/apex/tenet3?id=' + contactID);

  //string myParam = apexpages.currentpage().getparameters().get('myParam');



  // pass the selected asset ID to the new page
  //Contact.FirstName=UserInfo.getUserId();

  return redirect;


 }
 public void FirstPage() {
  OffsetSize = 0;
  system.debug('OffsetSize' + OffsetSize);
  searchContacts();
 }

 public void LastPage() {
  OffsetSize = totalRecs - math.mod(totalRecs, LimitSize);
  system.debug('OffsetSize' + OffsetSize);
  searchContacts();
 }


 public void previous() {
  OffsetSize = (OffsetSize - LimitSize);
  system.debug('ooooo' + OffsetSize);
  searchContacts();
 }
 public void next() {
  OffsetSize = OffsetSize + LimitSize;
  system.debug('ooooo2' + OffsetSize);
  searchContacts();
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
 public Integer getPageNumber() {
  return OffsetSize / LimitSize + 1;
 }

 public Integer getTotalPages() {
  if (math.mod(totalRecs, LimitSize) > 0) {
   return totalRecs / LimitSize + 1;
  } else {
   return (totalRecs / LimitSize);
  }

 }

}