import 'package:sms/sms.dart';
import 'package:intl/intl.dart';

class Method {
  SmsQuery query = new SmsQuery();
  List messages = new List();

  String creditedString = "Credited to your Ac";
  String debitedString = "is debited for Rs.";


  double creditedBalnce = 0;
  double debitedBalnce = 0;
  double avldBalnce = 0;

  //Read all messages
  fetchSMS() async {
    try {
      messages = await query.getAllSms;
      for (var i = 0; i < messages.length; i++) {
        if ((messages[i].body).toString().contains(creditedString)) {
          RegExp regExp = new RegExp(r"\b\d+\.\d+\b");
          String result = (regExp.firstMatch(messages[i].body).group(0));

          var myDouble = double.parse(result);
          creditedBalnce = creditedBalnce + myDouble;

          RegExp dateregExp = new RegExp(r"\b\d+\-\d+\b-\b\d+");
          String dateResult =
              (dateregExp.firstMatch(messages[i].body).group(0));

          DateTime creditedDate = DateFormat("yyyy-MM-dd").parse(dateResult);
          print("creditedDate");
          print(creditedDate);
           
        } else if ((messages[i].body).toString().contains(debitedString)) {
          RegExp regExp = new RegExp(r"\b\d+\.\d+\b");
          String result = regExp.firstMatch(messages[i].body).group(0);

          var myDouble = double.parse(result);
          debitedBalnce = debitedBalnce + myDouble;

          RegExp dateregExp = new RegExp(r"\b\d+\-\d+\b-\b\d+");
          String dateResult =
              (dateregExp.firstMatch(messages[i].body).group(0));

          DateTime debiteddDate = DateFormat("yyyy-MM-dd").parse(dateResult);
          print("debiteddDate");
          print(debiteddDate);
        }
        avldBalnce = creditedBalnce - debitedBalnce;
      }
    } catch (e) {
      print("error occure");
      print(e.toString());
    } 
  }

  
}
