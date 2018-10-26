@isTest
private class TestVerifyDate
{
	@isTest static void testWithin30Days() {
		Date date1 = date.newInstance(2018,01,01);
		Date date2 = date.newInstance(2018,01,05);
		Date endMonthDate1 = date.newInstance(2018,01,31);
        Date result = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(date2, result);
    }

	@isTest static void testWithout30Days() {
		Date date1 = date.newInstance(2018,01,01);
		Date date2 = date.newInstance(2018,12,01);
		Date endMonthDate1 = date.newInstance(2018,01,31);
        Date result = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(endMonthDate1, result);
    }

}