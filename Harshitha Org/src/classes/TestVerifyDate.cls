@isTest
private class TestVerifyDate {

    @isTest static void Withinthirtydays() {
        Date date1 = Date.newInstance(2006, 11, 2);
        Date date2 = Date.newInstance(2006, 11, 22);
        Date seconddate =VerifyDate.CheckDates(date1,date2);
        System.assertEquals(date2, seconddate);
    }
    
    @isTest static void Notwithinthirtydays() {
        Date date1 = Date.newInstance(2006, 11, 2);
        Date date2 = Date.newInstance(2006, 12, 10);
        Date Firstdate = VerifyDate.CheckDates(date1,date2);
        System.assertEquals(Firstdate,date1);
    }

}