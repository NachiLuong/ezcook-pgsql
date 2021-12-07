package com.ezcook.services.impls;

import com.ezcook.services.ICommonService;

import java.sql.Timestamp;
import java.util.Calendar;

public class CommonService implements ICommonService {

    @Override
    public String formatTime(Timestamp timestamp) {
        long time = timestamp.getTime();
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(time);
        int month = cal.get(Calendar.MONTH);
        String monthStr = "";
        switch (month) {
            case 1: {
                monthStr = "January";
                break;
            }
            case 2: {
                monthStr = "February";
                break;
            }
            case 3: {
                monthStr = "March";
                break;
            }
            case 4: {
                monthStr = "April";
                break;
            }
            case 5: {
                monthStr = "May";
                break;
            }
            case 6: {
                monthStr = "June";
                break;
            }
            case 7: {
                monthStr = "July";
                break;
            }
            case 8: {
                monthStr = "August";
                break;
            }
            case 9: {
                monthStr = "September";
                break;
            }
            case 10: {
                monthStr = "October";
                break;
            }
            case 11: {
                monthStr = "November";
                break;
            }
            case 12: {
                monthStr = "December";
                break;
            }
        }
        return monthStr + " " + cal.get(Calendar.DATE) + ", " + (cal.get(Calendar.YEAR));
    }
}
