import 'package:flutter/material.dart';

class Animatealign extends StatefulWidget {
  const Animatealign({super.key});

  @override
  State<Animatealign> createState() => _AnimatealignState();
}

class _AnimatealignState extends State<Animatealign> {
  bool test = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            test = !test;
          });
        },
        child: Center(
          child: Container(
              color: Colors.amber,
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.3,
              child: AnimatedAlign(
                alignment: test ? Alignment.bottomLeft : Alignment.topRight,
                duration: Duration(milliseconds: 500),
                curve: Curves.bounceOut,
                child: Icon(Icons.hdr_auto),
              )),
        ),
      ),
    );
  }
}
