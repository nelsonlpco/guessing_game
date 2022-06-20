import 'dart:async';

import 'package:guessing_game/bloc/card_state.dart';
import 'package:guessing_game/bloc/domain/entities/card_entity.dart';
import 'package:guessing_game/bloc/domain/events/next_event.dart';
import 'package:guessing_game/bloc/domain/events/save_and_try_again.dart';
import 'package:guessing_game/bloc/domain/events/say_no_event.dart';
import 'package:guessing_game/bloc/domain/events/say_yes_event.dart';
import 'package:guessing_game/bloc/domain/events/set_caracteristic_event.dart';
import 'package:guessing_game/bloc/domain/events/try_again_event.dart';

import 'block.dart';
import 'domain/events/event.dart';
import 'domain/events/start_event.dart';

class CardsBloc implements Bloc {
  final CardState state = CardState();
  final StreamController<Event> _input = StreamController();
  final StreamController<List<CardEntity>> _output =
      StreamController<List<CardEntity>>.broadcast();

  Sink<Event> get inputCard => _input.sink;
  Stream<List<CardEntity>> get outputCard => _output.stream;

  CardsBloc() {
    _input.stream.listen(_onEvent);
    _output.add(state.cards);
  }

  void _onEvent(Event event) {
    switch (event.runtimeType) {
      case StartEvent:
        state.startGame();
        _output.add(state.cards);
        print(state.tree.heightOfTree(state.tree.hoot));
        break;
      case NextEvent:
        state.getCurrentCard();
        _output.add(state.cards);
        break;
      case SayNoEvent:
        state.sayNo();
        _output.add(state.cards);
        break;
      case SayYesEvent:
        state.sayYes();
        _output.add(state.cards);
        break;
      case TryAgainEvent:
        state.startGame();
        _output.add(state.cards);
        break;
      case SetCaracteristicEvent:
        state.addNewCaracteristic();
        _output.add(state.cards);
        break;
      case SaveAndTryAgain:
        state.saveAndTryAgin();
        print(state.tree.heightOfTree(state.tree.hoot));
        _output.add(state.cards);
    }
  }

  @override
  void dispose() {
    _input.close();
    _output.close();
  }
}
