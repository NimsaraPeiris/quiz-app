import 'package:flutter/material.dart';
import 'package:phi_app/pages/task_management_page.dart';
import 'package:phi_app/pages/analytics_dashboard_page.dart';
import 'package:phi_app/pages/data_reporting_page.dart';
import 'package:phi_app/pages/fumigation_management_page.dart';
import 'package:phi_app/pages/gis_page.dart';

class HomePageList extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const HomePageList({super.key, required this.items});

  void _navigateToPage(BuildContext context, String title) {
    Widget page;
    switch (title) {
      case "Task Management":
        page = const TaskManagementPage();
        break;
      case "Analytics Dashboard":
        page = const AnalyticsDashboardPage();
        break;
      case "Data Reporting":
        page = const DataReportingPage();
        break;
      case "Fumigation Management":
        page = const FumigationManagementPage();
        break;
      case "Geographic Information System":
        page = const GISPage();
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          color: const Color.fromARGB(255, 225, 240, 255),
          elevation: 0,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(
            height: 80,
            child: Center(
              child: ListTile(
                leading: Icon(items[index]['icon'],
                    size: 34, color: Colors.blue),
                title: Text(
                  items[index]['title'],
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(Icons.arrow_forward_ios,
                    size: 16, color: Colors.blue),
                onTap: () {
                  _navigateToPage(context, items[index]['title']);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
