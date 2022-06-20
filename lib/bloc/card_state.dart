import 'package:guessing_game/bloc/domain/card_factory.dart';
import 'package:guessing_game/bloc/domain/entities/button_entity.dart';
import 'package:guessing_game/bloc/domain/entities/card_entity.dart';
import 'package:guessing_game/bloc/domain/events/save_and_try_again.dart';
import 'package:guessing_game/bloc/domain/events/set_caracteristic_event.dart';

import 'domain/decision_tree.dart';

class CardState {
  late DecisionTree tree;
  late List<CardEntity> cards;
  late String caracteristic;
  late String animal;

  CardState() {
    buildGame();
    startGame();
  }

  void startGame() {
    caracteristic = "";
    animal = "";
    var startCard =
        CardFactory.make(CardType.next, "Vou adivinhar seu animal favorito!");
    cards = [startCard];
    tree.startTree();
  }

  void buildGame() {
    var rootCard = CardFactory.make(CardType.yesNo, "O animal é terrestre? ");
    tree = DecisionTree(rootCard);
    tree.addAnimal("o animal é um(a) gato");
    tree.addQuestion("O animal é aquatico?");
    tree.sayNo();
    tree.addAnimal("O animal é um(a) golfinho");
  }

  void getCurrentCard() {
    cards.add(tree.currentLeaf);
  }

  void sayYes() {
    if (tree.hit) {
      cards.add(CardFactory.make(CardType.winner, ""));
    } else {
      tree.sayYes();
      cards.add(tree.currentLeaf);
    }
  }

  void sayNo() {
    if (tree.fail) {
      addNewAnimal();
    } else {
      tree.sayNo();
      cards.add(tree.currentLeaf);
    }
  }

  void addNewAnimal() {
    var card =
        CardFactory.make(CardType.question, "Qual o seu animal favorito?");
    card.onChangeText = (e) {
      animal = e;
    };
    card.buttons = [
      (ButtonEntity(title: "Próximo", event: SetCaracteristicEvent()))
    ];
    cards.add(card);
  }

  void addNewCaracteristic() {
    var card = CardFactory.make(
        CardType.question, "informe uma caracteristica do(a) $animal!");
    card.onChangeText = (e) {
      caracteristic = e;
    };
    card.buttons = [
      (ButtonEntity(title: "Tentar de novo", event: SaveAndTryAgain())),
    ];
    cards.add(card);
  }

  void saveAndTryAgin() {
    tree.addQuestion("O animal é $caracteristic?");
    tree.sayNo();
    tree.addAnimal("O animal é um(a) $animal");
    startGame();
  }
}
