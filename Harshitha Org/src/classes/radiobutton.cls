public class radiobutton{
list<Account> myAccountsList = new List<Account>();

public radiobutton(){

myAccountsList = [ select id,name from account];
}
public List<SelectOption> getItems() {
  List<SelectOption> options = new List<SelectOption>(); 
  for (Account a : myAccountsList) {
    options.add(new SelectOption(a.Id, a.Name));
  }

  return options; 
}
}