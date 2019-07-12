global class LeadProcessor implements 
    Database.Batchable<sObject>, Database.Stateful {
        
    global Integer count = 0;
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID, LeadSource FROM Lead');
    }

    global void execute(Database.BatchableContext bc, List<Lead> lst){
        // process each batch of records
        List<Lead> lst_new = new List<Lead>();
        for (Lead l: lst) {
           
                l.LeadSource = 'Dreamforce';
                lst_new.add(l);
                count = count+1;
                
            }
        
        update lst_new;
    }    

    global void finish(Database.BatchableContext bc){
        System.debug('count = ' + count);
        
        
    }    
    }