import 'package:flutter/cupertino.dart';

class TextView extends StatelessWidget {
  const TextView(
      {Key? key,
      required String text,
      required TextStyle? textStyle,
      bool isEllipsis = false,
      TextAlign? align})
      : _text = text,
        _textStyle = textStyle,
        _align = align,
        _isEllipsis = isEllipsis,
        super(key: key);

  final String _text;
  final TextStyle? _textStyle;
  final TextAlign? _align;
  final bool _isEllipsis;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      overflow: _isEllipsis ? TextOverflow.ellipsis : null,
      softWrap: true,
      style: _textStyle,
      textHeightBehavior:
          const TextHeightBehavior(applyHeightToFirstAscent: false),
      textAlign: _align ?? TextAlign.center,
    );
  }
}
