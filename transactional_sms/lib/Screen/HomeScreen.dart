import 'package:flutter/material.dart';
import 'package:transactional_sms/Model/Methods.dart';
import 'package:pie_chart/pie_chart.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Method _method = Method();
  Map<String, double> dataMap = new Map();

  double a, b, c;

  @override
  void initState() {
    _method.fetchSMS();
    super.initState();
    showData();
  }

  showData() async {
    dataMap.putIfAbsent("Credited", () => _method.creditedBalnce);
    dataMap.putIfAbsent("Debited", () => _method.debitedBalnce);
    dataMap.putIfAbsent("Availabel", () => _method.avldBalnce);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: ListView(
          children: [
            Text("Credited Balnce: ${_method.creditedBalnce}"),
            Text("Debited Balnce: ${_method.debitedBalnce}"),
            Text("Availabe Balnce: ${_method.avldBalnce.ceilToDouble()}"),
            PieChart(
              dataMap: dataMap,
              chartType: ChartType.disc,
            )
          ],
        ),
      ),
    );
  }
}
