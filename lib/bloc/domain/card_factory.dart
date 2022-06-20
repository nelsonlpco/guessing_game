import 'package:guessing_game/bloc/domain/card_builder.dart';
import 'package:guessing_game/bloc/domain/entities/button_entity.dart';
import 'package:guessing_game/bloc/domain/entities/card_entity.dart';
import 'package:guessing_game/bloc/domain/events/next_event.dart';
import 'package:guessing_game/bloc/domain/events/say_no_event.dart';
import 'package:guessing_game/bloc/domain/events/say_yes_event.dart';
import 'package:guessing_game/bloc/domain/events/try_again_event.dart';

enum CardType {
  question,
  next,
  yesNo,
  winner,
}

class CardFactory {
  static CardEntity make(CardType type, String message) {
    switch (type) {
      case CardType.question:
        return CardBuilder()
            .withTitle("Adivinho")
            .withText(message)
            .withTextField()
            .build();
      case CardType.yesNo:
        return CardBuilder()
            .withTitle("Adivinho")
            .withText(message)
            .addButton(ButtonEntity(title: "Não", event: SayNoEvent()))
            .addButton(ButtonEntity(title: "Sim", event: SayYesEvent()))
            .build();
      case CardType.next:
        return CardBuilder()
            .withTitle("Adivinho")
            .withText(message)
            .addButton(ButtonEntity(title: "Próximo", event: NextEvent()))
            .build();
      case CardType.winner:
        return CardBuilder()
            .withTitle("Adivinho")
            .withText("Acertei novamente :D!")
            .addButton(
                ButtonEntity(title: "Tentar de novo", event: TryAgainEvent()))
            .build();
    }
  }
}
