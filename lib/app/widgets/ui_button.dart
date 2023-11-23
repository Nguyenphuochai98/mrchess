import 'package:flutter/material.dart';
import 'package:mrchess/app/widgets/ui_text.dart';

import '../constant/dimens_manager.dart';
import '../utils/app_colors.dart';

class UIButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final String title;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final bool loading;
  final bool enabled;
  final double? radius;

  const UIButton({
    Key? key,
    this.onPressed,
    required this.title,
    this.padding = EdgeInsets.zero,
    this.titleStyle,
    this.backgroundColor,
    this.loading = false,
    this.enabled = true,
    this.radius = 15
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextButton(
        onPressed: (enabled == true) ? onPressed : null,
        style: TextButton.styleFrom(
          backgroundColor: onPressed != null
              ? (backgroundColor ?? UIColors.colorButton)
                  .withOpacity((enabled == true) ? 1.0 : 0.25)
              : UIColors.defaultColorButton,
          fixedSize: Size(double.infinity, DimensManager.dimens.setHeight(48)),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(DimensManager.dimens.setRadius(radius!)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            (loading)
                ? SizedBox(
                    child: const CircularProgressIndicator(strokeWidth: 2.0),
                    height: DimensManager.dimens.setHeight(32),
                    width: DimensManager.dimens.setHeight(32),
                  )
                : Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: UIText(
                          title,
                          style: TextStyle(
                            fontSize: DimensManager.dimens.setSp(17),
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ).merge(titleStyle),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
