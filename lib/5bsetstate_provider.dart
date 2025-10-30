import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ColorProvider(),
      child: StateManagementDemo(),
    ),
  );
}

class StateManagementDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management Examples',
      home: Scaffold(
        appBar: AppBar(title: Text("setState & Provider Examples")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ThemeChanger(),     // setState Example
            Divider(thickness: 2, height: 40),
            FavoriteColorApp(), // Provider Example
          ],
        ),
      ),
    );
  }
}

// ---------- Using setState ----------
class ThemeChanger extends StatefulWidget {
  @override
  _ThemeChangerState createState() => _ThemeChangerState();
}

class _ThemeChangerState extends State<ThemeChanger> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isDark ? Colors.black : Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            isDark ? "Dark Mode 🌙" : "Light Mode ☀️",
            style: TextStyle(
              fontSize: 20,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          Switch(
            value: isDark,
            onChanged: (value) {
              setState(() {
                isDark = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

// ---------- Using Provider ----------
class ColorProvider extends ChangeNotifier {
  Color _selectedColor = Colors.blue;
  Color get selectedColor => _selectedColor;

  void changeColor(Color color) {
    _selectedColor = color;
    notifyListeners();
  }
}

class FavoriteColorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorProvider>(context);

    return Column(
      children: [
        Text(
          "Favorite Color Selector 🎨",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        Container(
          width: 100,
          height: 100,
          color: colorProvider.selectedColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            colorButton(Colors.red, context),
            colorButton(Colors.green, context),
            colorButton(Colors.blue, context),
          ],
        ),
      ],
    );
  }

  Widget colorButton(Color color, BuildContext context) {
    return IconButton(
      icon: Icon(Icons.circle, color: color, size: 30),
      onPressed: () {
        Provider.of<ColorProvider>(context, listen: false).changeColor(color);
      },
    );
  }
}
