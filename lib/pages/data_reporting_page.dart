import 'package:flutter/material.dart';
import 'package:phi_app/components/my_colors.dart';

class DataReportingPage extends StatefulWidget {
  const DataReportingPage({super.key});

  @override
  State<DataReportingPage> createState() => _DataReportingPageState();
}

class _DataReportingPageState extends State<DataReportingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: MyColors.mainColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Data Reporting',
          style: TextStyle(
            color: MyColors.mainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text('Data Reporting Content'),
        ),
      ),
    );
  }
}
