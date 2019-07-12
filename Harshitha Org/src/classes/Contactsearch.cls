public with sharing class Contactsearch
{
    public string soql {get;set;} 
    public List<Contact> contacts {get;set;}
    public String firstname { get; set; }
    public String lastname { get; set; }
    public String phone { get; set; }
    public String Email { get; set; }
    
    
    public Contactsearch() {
   
    
  }
    
    
    public PageReference runSearch() {

    
        
     
        
     if(String.isBlank(firstName) && String.isBlank(lastName) && String.isBlank(Phone) && String.isBlank(Email))
     {
         //contacts = new List<Contact>();
         
         return null;
         
     }
        
        else{
           soql = 'select firstname, lastname, Email, Phone from contact Where firstname!=null';
       {
        if (!firstName.equals(''))
      soql += ' and firstname LIKE \'%' +String.escapeSingleQuotes(firstName)+ '%\'';
           
        
       
        if (!lastName.equals(''))
      soql += ' and lastname LIKE \'%' +String.escapeSingleQuotes(lastName)+ '%\'';
           
        
       if (!Phone.equals(''))
      soql += ' and Phone LIKE \'%' +String.escapeSingleQuotes(Phone)+ '%\'';
          
       
        if (!Email.equals(''))
      soql += ' and Email LIKE \'%' +String.escapeSingleQuotes(Email)+ '%\'';
     contacts = Database.query(soql);
            System.debug('soql:'+ soql);
                      return null;  

       }      
        }
  
 }
 public PageReference click()
 {
      PageReference redirect = new PageReference('/apex/tenet3'); 

    // pass the selected asset ID to the new page
    
    return redirect;
     
     
 }
    
    
}