public class AccountHandler {
    public static Account insertNewAccount(String accname){
        Account a = new Account();
        a.Name = accname;
        
        try{
            insert a;}
        Catch(Exception e){
            return null;
        }
         return a;   
        }
    }