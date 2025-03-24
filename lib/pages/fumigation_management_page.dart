import 'package:flutter/material.dart';
import 'package:phi_app/components/my_colors.dart';

class FumigationManagementPage extends StatefulWidget {
  const FumigationManagementPage({super.key});

  @override
  State<FumigationManagementPage> createState() =>
      _FumigationManagementPageState();
}

class _FumigationManagementPageState extends State<FumigationManagementPage> {
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
          'Fumigation Management',
          style: TextStyle(
            color: MyColors.mainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text('Fumigation Management Content'),
        ),
      ),
    );
  }
}
