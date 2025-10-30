import 'package:flutter/material.dart';

void main() {
  runApp(const MultiAnimationApp());
}

class MultiAnimationApp extends StatelessWidget {
  const MultiAnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnimationDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({super.key});

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 3))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fadeAnimation =
    Tween<double>(begin: 0.2, end: 1.0).animate(_controller);
    final slideAnimation = Tween<Offset>(
        begin: const Offset(0, 0.5), end: const Offset(0, -0.1))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    final rotateAnimation = Tween<double>(begin: 0, end: 2 * 3.14)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    return Scaffold(
      appBar: AppBar(title: const Text('Different Animation Types')),
      body: Center(
        child: FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: RotationTransition(
              turns: rotateAnimation,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.star, color: Colors.white, size: 50),
              ),
            ),
          ),
        ),
      ),
    );
  }
}