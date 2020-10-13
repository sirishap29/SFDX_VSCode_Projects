public class DemoDataTypeMethods {
    
    /* String Methods
     * string str='';
string str1=null;
string str2='  ';
string str3='Salesforce Development';
/*str3=str3.toUpperCase();*/
string str4='Welcome to Salesforce World';
string str5='123';
/*str4=str4.toLowerCase();
system.debug(string.isBlank(str));
system.debug(string.isBlank(str1));
system.debug(string.isBlank(str2));
system.debug(string.isBlank(str3));
system.debug(string.isNotBlank(str));
system.debug(string.isNotBlank(str1));
system.debug(string.isNotBlank(str2));
system.debug(string.isNotBlank(str3));
system.debug(str3);
system.debug(str4);
system.debug(str3.substring(11));
system.debug(str4.substring(8));
system.debug(str3.substring(11,22));
system.debug(str4.substring(8,22));
system.debug(str3.length());
system.debug(str4.length());
system.debug(str3.left(11));
system.debug(str3.leftPad(3));
system.debug(str4.right(11));
system.debug(str4.rightPad(4));
system.debug(str3.replace('Development','World'));
system.debug(str4.replace('Welcome to',''));
system.debug(str3.isNumeric());
system.debug(str5.isNumeric());*/
    

/* Date Methods
 * date dt=date.today();
date dt1=date.newInstance(1986, 10, 29);
integer int1=dt1.day();
integer year=dt1.year();
integer month=dt1.month();
date dt2=date.newInstance(2020, 08, 19);
date newDay=dt.addDays(20);
date newMonth=dt.addMonths(5);
date newYear=dt.addYears(2);
integer int2=dt2.dayOfYear();
date dt3=date.newInstance(2020, 10, 29);
string formatString=dt3.format();
integer int3=dt2.daysBetween(dt3);
system.debug(dt);
system.debug(dt1);
system.debug(dt2);
system.debug(int1);
system.debug(year);
system.debug(month);
system.debug(int2);
system.debug(newDay);
system.debug(newMonth);
system.debug(newYear);
system.debug(int3);
system.debug(formatString); 

 * 
 */
    
  /*  DateTime Methods
   * DateTime dt=DateTime.now();
DateTime dtInst=DateTime.newInstance(1999, 10, 29, 4, 5, 55);
Integer int1=dtInst.day();
Integer int2=dtInst.year();
Integer int3=dtInst.month();
Integer int4=dtInst.hour();
Integer int5=dtInst.minuteGmt();
Date d1=Date.newInstance(2006, 02, 26);
Time t1=Time.newInstance(10, 40, 50, 50);
DateTime d1t1=DateTime.newInstance(d1, t1);
DateTime d1t2=d1t1.addDays(8);
DateTime d1t3=d1t1.addYears(4);
DateTime d1t4=d1t1.addMonths(4);
DateTime d1t5=d1t1.addHours(10);
DateTime d1t6=d1t1.addMinutes(20);
DateTime d1t7=d1t1.addSeconds(20);
system.debug(dt);
system.debug(dtInst);
system.debug(d1t1);
system.debug(int1);
system.debug(int2);
system.debug(int3);
system.debug(int4);
system.debug(int5);
system.debug(d1t2);
system.debug(d1t3);
system.debug(d1t4);
system.debug(d1t5);
system.debug(d1t6);
system.debug(d1t7);
   * 
   * 
   * integer i1=20,i2=40;
     integer i3=math.max(i1,i2);
     integer i4=math.min(i1,i2);
     integer i5=math.abs(-i1);
     decimal dec1=20.20,dec2=42.22;
     decimal i6=math.abs(dec1);
     system.debug(i3);
     system.debug(i4);
     system.debug(i5);
     system.debug(i6);
   * */

}