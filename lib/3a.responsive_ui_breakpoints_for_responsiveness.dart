import 'package:flutter/material.dart';

void main() => runApp(ResponsiveApp());

class ResponsiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive UI Example',
      home: Scaffold(
        appBar: AppBar(title: Text('Responsive UI')),
        body: ResponsiveLayout(),
      ),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        width: screenWidth * 0.8, // 80% of screen width
        height: screenHeight * 0.3, // 30% of screen height
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            'Responsive Box\nWidth: ${screenWidth.toStringAsFixed(0)} px',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth < 400 ? 14 : 22, // font size adjusts
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
