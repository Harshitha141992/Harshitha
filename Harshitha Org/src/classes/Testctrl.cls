public class Testctrl {
    public list<Account> acctlist {get;set;}
    public Map<String, Boolean> attdmap{get;set;}
     
    public Testctrl(){
        this.attdmap = new Map<String, Boolean>();
        this.acctlist = [SELECT Id, Name FROM Account];
        for(Account atu23 : acctlist){
        attdmap.put(atu23.Name,False);
        }          
    }
    public void submit(){
        system.debug('************maps*****************'+attdmap);
    }

}