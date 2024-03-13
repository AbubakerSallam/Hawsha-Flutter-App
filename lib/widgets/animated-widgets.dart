// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';

class AnimatedWidgets extends StatefulWidget {
  final Widget child;
  final int delay;

  const AnimatedWidgets({super.key, required this.child, required this.delay});

  @override
  AnimatedWidgetsState createState() => AnimatedWidgetsState();
}

class AnimatedWidgetsState extends State<AnimatedWidgets>
    with TickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero)
            .animate(curve);

    Timer(Duration(milliseconds: widget.delay), () {
      _animController.forward();
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animController,
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
    );
  }
}
