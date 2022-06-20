import 'dart:math';

import 'package:flutter/material.dart';
import 'package:guessing_game/components/body.dart';
import 'package:guessing_game/components/card_title.dart';
import 'package:guessing_game/components/footer.dart';

import '../constants.dart';

class CardGame extends StatefulWidget {
  final String title;
  final String text;
  final List<Widget>? childrenFooter;
  final Widget? textField;

  const CardGame(
    this.title,
    this.text, {
    Key? key,
    this.childrenFooter,
    this.textField,
  }) : super(key: key);

  @override
  State<CardGame> createState() => _CardGameState();
}

class _CardGameState extends State<CardGame>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late Animation<double> opacity;
  late Animation<double> moveX;
  late Animation<double> moveY;
  late Animation<double> rotate;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    var c = CurvedAnimation(parent: controller, curve: Curves.bounceOut);

    var x = Random().nextDouble() * 20;
    x = x % 2 == 0 ? x * -1 : x;
    moveX = Tween<double>(begin: 0, end: x).animate(c)
      ..addListener(() {
        setState(() {});
      });
    moveY = Tween<double>(begin: -300, end: 0).animate(c)
      ..addListener(() {
        setState(() {});
      });
    rotate =
        Tween<double>(begin: 0, end: Random().nextDouble() * 4 / 50).animate(c)
          ..addListener(() {
            setState(() {});
          });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotate.value,
      child: Transform.translate(
        offset: Offset(moveX.value, moveY.value),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(-1, 1),
                blurRadius: 5,
              ),
            ],
            color: kPrimaryColor,
          ),
          width: 260,
          height: 340,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CardTitle(
                title: widget.title,
              ),
              const Divider(),
              Body(
                text: widget.text,
                child: widget.textField,
              ),
              Footer(
                children: widget.childrenFooter ?? [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
