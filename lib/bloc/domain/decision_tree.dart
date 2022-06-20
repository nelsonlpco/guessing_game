import 'package:guessing_game/bloc/domain/card_factory.dart';
import 'package:guessing_game/bloc/domain/entities/game_node_entity.dart';

import 'entities/card_entity.dart';
import 'dart:math';

class DecisionTree {
  late GameNodeEntity _root;
  late GameNodeEntity _currentLeaf;

  DecisionTree(CardEntity rootCard) {
    _root = GameNodeEntity(rootCard);
    startTree();
  }

  void startTree() {
    _currentLeaf = _root;
  }

  get hoot => _root;

  get hit => _currentLeaf.right == null;
  get fail => _currentLeaf.left == null;

  CardEntity get currentLeaf => _currentLeaf.card;

  void sayYes() {
    _currentLeaf = hit ? _currentLeaf : _currentLeaf.right!;
  }

  void sayNo() {
    _currentLeaf = fail ? _currentLeaf : _currentLeaf.left!;
  }

  void addQuestion(String question) {
    var card = CardFactory.make(CardType.yesNo, question);
    _currentLeaf.left = GameNodeEntity(card);
  }

  void addAnimal(String message) {
    var card = CardFactory.make(CardType.yesNo, message);
    _currentLeaf.right = GameNodeEntity(card);
  }

  int heightOfTree(GameNodeEntity tree) {
    // if (tree == null)
    //   return 0;
    // else {
    //   return max(heightOfTree(tree.left!), heightOfTree(tree.right!)) + 1;
    // }
    return 0;
  }
}
