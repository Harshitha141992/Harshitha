public class RandomContactFactory {
    
    Public static List<Contact> generateRandomContacts(Integer concon, string lastnamecon){
        List<Contact> con = new List<Contact>();
    for(Integer i=0; i<concon; i++)
    {
        lastnamecon= 'Test'+i;
        Contact a=new Contact(FirstName=lastnamecon,LastName=lastnamecon); 
          con.add(a); 
            }
        return con;
    }
}