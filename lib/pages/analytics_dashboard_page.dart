import 'package:flutter/material.dart';
import 'package:phi_app/components/my_colors.dart';

class AnalyticsDashboardPage extends StatefulWidget {
  const AnalyticsDashboardPage({super.key});

  @override
  State<AnalyticsDashboardPage> createState() => _AnalyticsDashboardPageState();
}

class _AnalyticsDashboardPageState extends State<AnalyticsDashboardPage> {
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
          'Analytics Dashboard',
          style: TextStyle(
            color: MyColors.mainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text('Analytics Dashboard Content'),
        ),
      ),
    );
  }
}
