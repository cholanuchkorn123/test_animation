import 'package:flutter/material.dart';

import 'package:test_animation/animatelist/listanimatedmodal.dart';

import 'animatelist/listitem.dart';

class Animatelistest extends StatefulWidget {
  const Animatelistest({super.key});

  @override
  State<Animatelistest> createState() => _AnimatelistestState();
}

class _AnimatelistestState extends State<Animatelistest> {
  List<Listanimated> items = listitem;
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test-Animatedlist'),
      ),
      body: AnimatedList(
        key: _key,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) {
          return listitemwidget(context, index, animation);
        },
      ),
    );
  }

  Widget listitemwidget(BuildContext context, index, animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        margin: EdgeInsets.all(5),
        color: Colors.blueGrey.shade200,
        child: GestureDetector(
          onTap: () {
            removeitem(index);
          },
          child: ListTile(
            contentPadding: EdgeInsets.all(16),
            title: Text(items[index].title.toString()),
          ),
        ),
      ),
    );
  }

  void removeitem(int index) {
    items.removeAt(index);
    _key.currentState?.removeItem(index,
        (context, animation) => listitemwidget(context, index, animation),
        duration: Duration(milliseconds: 200));
  }
}
