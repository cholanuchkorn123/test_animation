import 'dart:math';

import 'package:flutter/material.dart';

class Rotatetest extends StatefulWidget {
  const Rotatetest({super.key});

  @override
  State<Rotatetest> createState() => _RotatetestState();
}

class _RotatetestState extends State<Rotatetest>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..repeat();
    _animation = Tween<double>(begin: 0, end: 2*pi).animate(_controller!);
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
        animation: _animation!,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.5,
          color: Colors.redAccent,
          child: Icon(Icons.sign_language_rounded),
        ),
        builder: (context, child) {
          return Transform.rotate(
            angle: _animation!.value,
            child: child,
          );
        },
      )),
    );
  }
}
