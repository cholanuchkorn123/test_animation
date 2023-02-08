import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Sizeuptest extends StatefulWidget {
  const Sizeuptest({super.key});

  @override
  State<Sizeuptest> createState() => _SizeuptestState();
}

class _SizeuptestState extends State<Sizeuptest>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _sizeanimation;
  Animation<BorderRadius>? _radiusanimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..repeat();
    final curvesanimation =
        CurvedAnimation(parent: _controller!, curve: Curves.easeInOut);
    _sizeanimation = Tween(begin: 50.0, end: 250.0).animate(curvesanimation);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: AnimatedBuilder(
        animation: _controller!,
        builder: (context, child) {
          return Container(
            width: _sizeanimation!.value,height: _sizeanimation!.value,decoration: BoxDecoration(color: Colors.green),
          );
        },
      )),
    );
  }
}
