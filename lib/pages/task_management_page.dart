import 'package:flutter/material.dart';
import 'package:phi_app/components/my_colors.dart';

class TaskManagementPage extends StatefulWidget {
  const TaskManagementPage({super.key});

  @override
  State<TaskManagementPage> createState() => _TaskManagementPageState();
}

class _TaskManagementPageState extends State<TaskManagementPage> {
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
          'Task Management',
          style: TextStyle(
            color: MyColors.mainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text('Task Management Content'),
        ),
      ),
    );
  }
}
