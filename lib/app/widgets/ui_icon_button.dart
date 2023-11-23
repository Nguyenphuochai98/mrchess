import 'package:flutter/material.dart';

import '../constant/dimens_manager.dart';

class UIIconButton extends StatelessWidget {
  final double? size;
  final Widget child;
  final VoidCallback? onPressed;

  const UIIconButton({
    Key? key,
    this.size,
    this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular((size ?? DimensManager.dimens.setRadius(48)) / 2),
        child: Container(
          child: child,
          height: size ?? DimensManager.dimens.setRadius(48),
          width: size ?? DimensManager.dimens.setRadius(48),
          alignment: Alignment.center,
        ),
        onTap: onPressed,
      ),
    );
  }
}
