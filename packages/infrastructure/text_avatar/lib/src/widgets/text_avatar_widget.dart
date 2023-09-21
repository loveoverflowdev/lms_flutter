import 'package:flutter/material.dart';
import '../constants/enums.dart';
import '../constants/colors.dart';

class TextAvatarWidget extends StatelessWidget {
  final Shape shape;
  late final double _size;
  late final String _text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool? upperCase;

  TextAvatarWidget({
    super.key,
    required String? text,
    this.shape = Shape.rectangle,
    final double? size,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 20,
    this.upperCase = false,
  }) {
    _size = (size == null || size < 32.0) ? 48.0 : size;
    text = text?.trim();
    _text = text?.isNotEmpty == true ? text! : 'EMPTY';
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _colorBackgroundConfigWithText(_text);
    return Material(
      shape: _buildTextType(),
      color: backgroundColor,
      child: SizedBox(
        height: _size,
        width: _size,
        child: Center(
          child: Text(
            _textConfiguration(_text),
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }

  Color _colorBackgroundConfigWithText(String text) {
    final index = (text[0].codeUnits.first) % (colorList.length);
    final color = colorList[index];
    return color;
  }

  String _textConfiguration(String text) {
    final String displayText;
    final List<String> splittedText = text.split(' ')
      ..removeWhere((e) => e.isEmpty);
    if (splittedText.length >= 2) {
      displayText = splittedText[0][0] + splittedText[1][0];
    } else {
      if (text.length >= 2) {
        displayText = text.substring(0, 2);
      } else {
        displayText = text.substring(0, 1);
      }
    }
    return displayText.toUpperCase();
  }

  RoundedRectangleBorder _buildTextType() {
    switch (shape) {
      case Shape.rectangle:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        );
      case Shape.circular:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_size / 2),
        );
      case Shape.none:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        );
      default:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_size / 2),
        );
    }
  }
}
