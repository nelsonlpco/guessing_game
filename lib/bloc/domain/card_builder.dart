import 'package:guessing_game/bloc/domain/entities/button_entity.dart';
import 'package:uuid/uuid.dart';

import 'entities/card_entity.dart';
import 'events/event.dart';

class CardBuilder {
  late String id = const Uuid().v4();
  late String? title;
  late String? text;
  late bool hasField = false;
  late void Function(String e)? onChangeText;
  late List<ButtonEntity> buttons = [];
  Event? textEvent;

  CardBuilder() {
    onChangeText = null;
  }

  CardBuilder withId(String value) {
    id = value;
    return this;
  }

  CardBuilder withTitle(String value) {
    title = value;
    return this;
  }

  CardBuilder withText(String value) {
    text = value;
    return this;
  }

  CardBuilder withFieldEvent(void Function(String e) onChangeText) {
    hasField = true;
    this.onChangeText = onChangeText;
    return this;
  }

  CardBuilder withTextField() {
    hasField = true;
    return this;
  }

  CardBuilder addButton(ButtonEntity value) {
    buttons.add(value);
    return this;
  }

  CardEntity build() {
    return CardEntity(
      id: id,
      title: title ?? "",
      text: text ?? "",
      hasTextField: hasField,
      buttons: buttons,
      onChangeText: onChangeText,
    );
  }
}
