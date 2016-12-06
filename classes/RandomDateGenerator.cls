public class RandomDateGenerator {
    
    public static List<DateTime> getDates(String startDateTime, String endDateTime, Integer count, Boolean excludeWeekends) {
        List<DateTime> dateList = null;
        String dayOfWeek = null;
        
        if (count != null && count > 0) {
            dateList = new List<DateTime>();
            while (dateList.size() < count) {
                DateTime newDate = getIndividualDate(startDateTime, endDateTime);
                
                if (excludeWeekends)
                    dayOfWeek = newDate.format('EEEE');
                
                if ( !excludeWeekends || 
                    (!dayOfWeek.equalsIgnoreCase('Saturday') && !dayOfWeek.equalsIgnoreCase('Sunday')) )
                    dateList.add(newDate);
            }
        }
        return dateList;
    }

    public static DateTime getDate(String startDateTime, String endDateTime, Boolean excludeWeekends) {
        DateTime newDate = getIndividualDate(startDateTime, endDateTime);
        if (excludeWeekends) {
            String dayOfWeek = newDate.format('EEEE');
            while (dayOfWeek.equals('Saturday') || dayOfWeek.equals('Sunday')) {
                newDate = getIndividualDate(startDateTime, endDateTime);
                dayOfWeek = newDate.format('EEEE');
            }
        }
        return newDate;
    }
    
    private static DateTime getIndividualDate(String startDateTime, String endDateTime) {
        Long startLong = DateTime.valueOf(startDateTime).getTime();
        Long endLong = DateTime.valueOf(endDateTime).getTime();
        Long diff = endLong - startLong + 1;
        DateTime rand = DateTime.newInstance(startLong + (Long)(Math.random() * diff));
        
        return rand;
    }
}