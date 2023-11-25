import 'package:flutter/material.dart';

import '../constant/constants.dart';
import '../constant/dimens_manager.dart';

class UIRichText extends StatelessWidget {
  const UIRichText({Key? key, required this.text, this.size = 15, this.color})
      : super(key: key);
  final String text;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text + ' ',
        style: TextStyle(
          fontFamily: Fonts.nunito,
          fontWeight: FontWeight.bold,
          fontSize: DimensManager.dimens.setSp(size),
          color: color ?? Colors.white,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'đ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough,
              fontSize: DimensManager.dimens.setSp(size),
              color: color ?? Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
