import 'card_entity.dart';

class GameNodeEntity {
  final CardEntity card;
  late GameNodeEntity? left;
  late GameNodeEntity? right;

  GameNodeEntity(this.card) {
    left = null;
    right = null;
  }

  void addQuestionCard(CardEntity card) {
    left = GameNodeEntity(card);
  }

  void addResponseCard(CardEntity card) {
    right = GameNodeEntity(card);
  }
}
