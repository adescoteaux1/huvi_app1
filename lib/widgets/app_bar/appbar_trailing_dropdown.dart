import 'package:flutter/material.dart';
import 'package:huvi_app1/core/app_export.dart';
import 'package:huvi_app1/widgets/custom_drop_down.dart';

// ignore: must_be_immutable
class AppbarTrailingDropdown extends StatelessWidget {
  AppbarTrailingDropdown({
    Key? key,
    required this.hintText,
    required this.items,
    required this.onTap,
    this.margin,
  }) : super(
          key: key,
        );

  String? hintText;

  List<String> items;

  Function(String) onTap;

  EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: CustomDropDown(
        width: 161.h,
        icon: Container(
          margin: EdgeInsets.only(left: 8.h),
          child: CustomImageView(
            svgPath: ImageConstant.imgArrowdownPrimary,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
        ),
        hintText: "\rSort By: Monthly",
        items: items,
        onChanged: (value) {
          onTap(value!);
        },
      ),
    );
  }
}
