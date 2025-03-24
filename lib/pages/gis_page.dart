import 'package:flutter/material.dart';
import 'package:phi_app/components/my_colors.dart';

class GISPage extends StatefulWidget {
  const GISPage({super.key});

  @override
  State<GISPage> createState() => _GISPageState();
}

class _GISPageState extends State<GISPage> {
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
          'Geographic Information System',
          style: TextStyle(
            color: MyColors.mainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text('Geographic Information System Content'),
        ),
      ),
    );
  }
} 