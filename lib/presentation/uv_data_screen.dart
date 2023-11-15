import 'package:flutter/material.dart';
import 'package:huvi_app1/core/app_export.dart';
import 'package:huvi_app1/widgets/app_bar/appbar_subtitle.dart';
import 'package:huvi_app1/widgets/app_bar/appbar_trailing_dropdown.dart';
import 'package:huvi_app1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:huvi_app1/widgets/app_bar/custom_app_bar.dart';
import 'package:huvi_app1/theme/custom_text_style.dart';
import '../theme/theme_helper.dart';
import '../widgets/app_bar/appbar_image.dart';
import '../widgets/custom_image_view.dart';

class UvDataScreen extends StatelessWidget {
  UvDataScreen({Key? key})
      : super(
          key: key,
        );

  List<String> dropdownItemList = [
    "Daily",
    "Weekly",
    "Monthly",
  ];

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
              child: SizedBox(
          width: 747.h,
          child: Column(
            children: [
              _buildTextAndLine(context),
              Divider(
                color: theme.colorScheme.onPrimaryContainer,
              ),
              SizedBox(height: 70.v),
              _buildGraph(context),
              SizedBox(height: 20.v),
            ],
          ),
        ),
      ),)
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 68.v,
      title: AppbarSubtitle(
        text: "UV Index Data Overview",
        margin: EdgeInsets.only(left: 1.h),
        
      ),
      actions: [
        AppbarTrailingDropdown(
          margin: EdgeInsets.only(
            left: 5.h,
            top: 23.v,
            right: 5.h,
          ),
          hintText: "\rSort By: Monthly",
          items: dropdownItemList,
          onTap: (value) {},
        ),
        AppbarImage(
          svgPath: ImageConstant.imgOverflowMenu,
          margin: EdgeInsets.only(
            left: 5.h,
            top: 23.v,
            right: 1.h,
          ),
        ),
      ],
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildTextAndLine(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillGray50,
      child: Column(
        children: [
          Divider(
            color: theme.colorScheme.onPrimaryContainer,
          ),
          SizedBox(height: 19.v),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                left: 5.h,
                right: 10.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.v),
                    child: Column(
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgIconAndText,
                          height: 22.v,
                          width: 14.h,
                        ),
                        SizedBox(height: 7.v),
                        Text(
                          "7.4",
                          style: theme.textTheme.titleLarge,
                        ),
                        SizedBox(height: 8.v),
                        Text(
                          "Peak UV",
                          style: CustomTextStyles.titleSmallArchivoBluegray700,
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 30,
                  ),
                  SizedBox(
                    height: 79.v,
                    child: VerticalDivider(
                      width: 1.h,
                      thickness: 1.v,
                      color: theme.colorScheme.onPrimaryContainer,
                      indent: 10.h,
                      endIndent: 9.h,
                    ),
                  ),
                  Spacer(
                    flex: 26,
                  ),
                  Column(
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgMaterialSymbol,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                      ),
                      SizedBox(height: 7.v),
                      Text(
                        "4.2",
                        style: theme.textTheme.titleLarge,
                      ),
                      SizedBox(height: 10.v),
                      Text(
                        "Average UV",
                        style: CustomTextStyles.titleSmallArchivoBluegray700,
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 26,
                  ),
                  SizedBox(
                    height: 79.v,
                    child: VerticalDivider(
                      width: 1.h,
                      thickness: 1.v,
                      color: theme.colorScheme.onPrimaryContainer,
                      indent: 10.h,
                      endIndent: 9.h,
                    ),
                  ),
                  Spacer(
                    flex: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 17.v,
                      bottom: 14.v,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "3m 40sec  ",
                          style: theme.textTheme.titleLarge,
                        ),
                        SizedBox(height: 10.v),
                        Text(
                          "Avg. Reading Duration",
                          style: CustomTextStyles.titleSmallArchivoBluegray700,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 19.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildGraph(BuildContext context) {
    return SizedBox(
      height: 255.v,
      width: 627.h,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "10",
                      style:
                          CustomTextStyles.bodySmallArchivoOnPrimaryContainer,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 7.v,
                          bottom: 6.v,
                        ),
                        child: Divider(
                          indent: 14.h,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 46.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "8",
                      style:
                          CustomTextStyles.bodySmallArchivoOnPrimaryContainer,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 7.v,
                          bottom: 6.v,
                        ),
                        child: Divider(
                          indent: 13.h,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 46.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "6",
                      style:
                          CustomTextStyles.bodySmallArchivoOnPrimaryContainer,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 7.v,
                          bottom: 6.v,
                        ),
                        child: Divider(
                          indent: 15.h,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 45.v),
                _buildOne(
                  context,
                  userName: "4",
                ),
                SizedBox(height: 40.v),
                _buildOne(
                  context,
                  userName: "0",
                ),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgVectorGroup,
            height: 150.v,
            width: 595.h,
            alignment: Alignment.bottomRight,
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildOne(
    BuildContext context, {
    required String userName,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          userName,
          style: CustomTextStyles.bodySmallArchivoOnPrimaryContainer.copyWith(
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              top: 7.v,
              bottom: 6.v,
            ),
            child: Divider(
              indent: 20.h,
            ),
          ),
        ),
      ],
    );
  }
}
