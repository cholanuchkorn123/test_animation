import 'package:flutter/material.dart';

class Animatecrossimg extends StatefulWidget {
  const Animatecrossimg({super.key});

  @override
  State<Animatecrossimg> createState() => _AnimatecrossimgState();
}

class _AnimatecrossimgState extends State<Animatecrossimg> {
  bool test = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () {
              setState(() {
                test = !test;
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.4,
              child: AnimatedCrossFade(
                firstChild: Image.network(
                    'https://www.thesprucepets.com/thmb/I1NflT-_BAWY3ir-_nSXlLGVkdM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/twenty20_f84c633e-705e-4bf8-a724-00cdea750d8d-590b51893df78c92837b18d6.jpg'),
                secondChild: Image.network(
                    'https://cdn.pixabay.com/photo/2014/09/19/21/47/chihuahua-453063__480.jpg'),
                duration: Duration(milliseconds: 600),
                crossFadeState:
                    test ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              ),
            )),
      ),
    );
  }
}
