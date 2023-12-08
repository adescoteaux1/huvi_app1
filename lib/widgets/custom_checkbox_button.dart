import 'package:flutter/material.dart';
import 'package:huvi_app1/core/app_export.dart';

class CustomCheckboxButton extends StatelessWidget {
  CustomCheckboxButton({
    Key? key,
    required this.onChange,
    this.decoration,
    this.alignment,
    this.isRightCheck,
    this.iconSize,
    this.value,
    this.text,
    this.width,
    this.padding,
    this.textStyle,
    this.textAlignment,
    this.isExpandedText = false,
    this.checkColor,
  }) : super(
          key: key,
        );

  final BoxDecoration? decoration;

  final Alignment? alignment;

  final bool? isRightCheck;

  final double? iconSize;

  bool? value;

  final Function(bool) onChange;

  final String? text;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final TextStyle? textStyle;

  final TextAlign? textAlignment;

  final bool isExpandedText;

  final Color? checkColor;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildCheckBoxWidget,
          )
        : buildCheckBoxWidget;
  }

  Widget get buildCheckBoxWidget => InkWell(
        onTap: () {
          value = !(value!);
          onChange(value!);
        },
        child: Container(
          decoration: decoration,
          width: width,
          child: Row(
        children: [
          Padding(
            child: checkboxWidget,
            padding: EdgeInsets.only(right: 8),
          ),
          isExpandedText ? Expanded(child: textWidget) : textWidget,
        ],
      ),
        ),
      );
  Widget get textWidget => Text(
        text ?? "",
        textAlign: textAlignment ?? TextAlign.center,
        style: textStyle,
      );
  Widget get checkboxWidget => SizedBox(
        height: iconSize ?? 18.h,
        width: iconSize ?? 18.h,
        child: Checkbox(
          visualDensity: VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          value: value ?? false,
          checkColor: appTheme.teal400,
          onChanged: (value) {
            onChange(value!);
          },
        ),
      );
}
