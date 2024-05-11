package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DateUtils {

    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

    public String formatoYearMonthDay(Date date) {
        return sdf.format(date);
    }
    
    public Date convertirStringADate(String date){
        try {
            System.out.println("Fecha que llega a convertir: " + date);
            String fechaCorrecta = date.replace("-", "/");
            System.out.println("Fecha modificada: " + fechaCorrecta);
            return sdf.parse(fechaCorrecta);
        } catch (ParseException ex) {
            Logger.getLogger(DateUtils.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

}
