import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateless vs Stateful Widgets',
      home: Scaffold(
        appBar: AppBar(title: Text("Stateless & Stateful Example")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StaticMessageWidget(),  // Stateless example
            SizedBox(height: 30),
            LightBulbWidget(),      // Stateful example
          ],
        ),
      ),
    );
  }
}

// ---------- Stateless Widget ----------
class StaticMessageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Welcome to Flutter Lab 👋",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// ---------- Stateful Widget ----------
class LightBulbWidget extends StatefulWidget {
  @override
  _LightBulbWidgetState createState() => _LightBulbWidgetState();
}

class _LightBulbWidgetState extends State<LightBulbWidget> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          isOn ? Icons.lightbulb : Icons.lightbulb_outline,
          color: isOn ? Colors.amber : Colors.grey,
          size: 100,
        ),
        Text(
          isOn ? "Light is ON 💡" : "Light is OFF 💤",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              isOn = !isOn; // Toggle the light
            });
          },
          child: Text(isOn ? "Turn OFF" : "Turn ON"),
        ),
      ],
    );
  }
}
