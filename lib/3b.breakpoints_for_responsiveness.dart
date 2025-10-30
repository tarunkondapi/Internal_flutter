import 'package:flutter/material.dart';

void main() => runApp(MediaQueryApp());

class MediaQueryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediaQuery & Breakpoints',
      home: Scaffold(
        appBar: AppBar(title: Text('Responsive Layout using Breakpoints')),
        body: ResponsiveBody(),
      ),
    );
  }
}

class ResponsiveBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Define breakpoints
    String deviceType;
    if (width < 600) {
      deviceType = "Mobile";
    } else if (width < 1200) {
      deviceType = "Tablet";
    } else {
      deviceType = "Desktop";
    }

    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        color: Colors.tealAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              deviceType == "Mobile"
                  ? Icons.phone_android
                  : deviceType == "Tablet"
                  ? Icons.tablet
                  : Icons.desktop_windows,
              size: 80,
              color: Colors.blueAccent,
            ),
            SizedBox(height: 20),
            Text(
              "Current Device: $deviceType",
              style: TextStyle(
                fontSize: width < 600 ? 18 : 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
