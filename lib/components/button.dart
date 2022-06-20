import 'package:flutter/cupertino.dart';

import '../constants.dart';

class Button extends StatelessWidget {
  final String label;
  final Function press;

  const Button({
    Key? key,
    required this.label,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => press(),
        child: Container(
          alignment: const Alignment(0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: kPrimaryColorDark,
          ),
          height: 35,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                label,
                style: TextStyle(color: kPrimaryColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
