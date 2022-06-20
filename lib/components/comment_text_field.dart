import 'package:flutter/material.dart';

import '../constants.dart';

class CommentTextField extends StatelessWidget {
  const CommentTextField({
    Key? key,
    required this.onChangeText,
  }) : super(key: key);

  final void Function(String text) onChangeText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Form(
          child: TextFormField(
            onChanged: (t) {
              onChangeText(t);
            },
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            decoration: const InputDecoration(
              hintText: "Resposta",
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.add_comment),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
