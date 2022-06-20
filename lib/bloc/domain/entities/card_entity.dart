import 'button_entity.dart';

class CardEntity {
  final String id;
  final String title;
  final String text;
  final bool? hasTextField;
  late void Function(String e)? onChangeText;
  late List<ButtonEntity>? buttons;

  CardEntity({
    this.hasTextField,
    required this.title,
    required this.id,
    required this.text,
    this.onChangeText,
    this.buttons,
  });
}
