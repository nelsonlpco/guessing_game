import 'package:flutter/material.dart';
import 'package:guessing_game/bloc/card_bloc.dart';
import 'package:guessing_game/bloc/domain/entities/button_entity.dart';
import 'package:guessing_game/bloc/domain/entities/card_entity.dart';
import 'package:guessing_game/components/button.dart';
import 'package:guessing_game/components/card_game.dart';
import 'package:guessing_game/components/comment_text_field.dart';

import '../bloc/domain/events/start_event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final CardsBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = CardsBloc();
    bloc.inputCard.add(StartEvent());
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CardEntity>>(
      stream: bloc.outputCard,
      builder: (context, snapshot) {
        var cards = snapshot.data ?? [];

        return Scaffold(
          body: Center(
            child: Stack(
              children: _makeCards(cards),
            ),
          ),
        );
      },
    );
  }

  List<CardGame> _makeCards(List<CardEntity> data) => data
      .map(
        (card) => CardGame(
          card.title,
          card.text,
          key: Key(card.id),
          textField: card.hasTextField == true
              ? CommentTextField(
                  onChangeText: card.onChangeText!,
                )
              : null,
          childrenFooter:
              card.buttons != null ? _makeButtons(card.buttons!) : [],
        ),
      )
      .toList();

  List<Button> _makeButtons(List<ButtonEntity> data) => data
      .map(
        (btn) => Button(
          label: btn.title,
          press: () {
            bloc.inputCard.add(btn.event);
          },
        ),
      )
      .toList();
}
