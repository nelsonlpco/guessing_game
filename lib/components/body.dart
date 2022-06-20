import 'package:flutter/material.dart';
import 'package:guessing_game/components/comment_text_field.dart';

class Body extends StatelessWidget {
  final String text;
  final Widget? child;

  const Body({
    Key? key,
    required this.text,
    this.child,
  }) : super(key: key);

  get kPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
