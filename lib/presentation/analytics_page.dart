import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:huvi_app1/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({Key? key})
      : super(
          key: key,
        );

  @override
  AnalyticsPageState createState() => AnalyticsPageState();

  static _buildPlaylist(BuildContext context) {
    return _buildPlaylist(context);
  }
}

class AnalyticsPageState extends State<AnalyticsPage>
    with AutomaticKeepAliveClientMixin<AnalyticsPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 34.v),
              child: Column(
                children: [
                  SizedBox(height: 21.v),
                  _buildPlaylist(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPlaylist(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18.h),
      child: Column(
        children: [
          Divider(
            color: theme.colorScheme.onError,
            indent: 4.h,
          ),
          SizedBox(height: 20.v),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              height: 231.v,
              width: 347.h,
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "6hr",
                          style: theme.textTheme.bodySmall,
                        ),
                        SizedBox(height: 19.v),
                        Text(
                          "5hr",
                          style: theme.textTheme.bodySmall,
                        ),
                        SizedBox(height: 19.v),
                        Text(
                          "4hr",
                          style: theme.textTheme.bodySmall,
                        ),
                        SizedBox(height: 18.v),
                        Text(
                          "3hr",
                          style: theme.textTheme.bodySmall,
                        ),
                        SizedBox(height: 19.v),
                        Text(
                          "2hr",
                          style: theme.textTheme.bodySmall,
                        ),
                        SizedBox(height: 18.v),
                        Text(
                          "1hr",
                          style: theme.textTheme.bodySmall,
                        ),
                        SizedBox(height: 19.v),
                        Text(
                          "0",
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 327.h,
                      margin: EdgeInsets.only(
                        left: 20.h,
                        top: 6.v,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 7.h),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: fs.Svg(
                            ImageConstant.imgGroup37,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Spacer(
                            flex: 34,
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgBar12,
                            height: 171.v,
                            width: 21.h,
                            margin: EdgeInsets.only(top: 51.v),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgBar12,
                            height: 63.v,
                            width: 21.h,
                            margin: EdgeInsets.only(
                              left: 28.h,
                              top: 160.v,
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgBar12,
                            height: 31.v,
                            width: 21.h,
                            margin: EdgeInsets.only(
                              left: 29.h,
                              top: 192.v,
                            ),
                          ),
                          Spacer(
                            flex: 65,
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgBar12,
                            height: 182.v,
                            width: 21.h,
                            margin: EdgeInsets.only(top: 41.v),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgBar12DeepOrangeA100,
                    height: 210.v,
                    width: 21.h,
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(right: 94.h),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgBar12,
                    height: 101.v,
                    width: 21.h,
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(right: 52.h),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgBar12,
                    height: 132.v,
                    width: 21.h,
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(left: 39.h),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15.v),
          Padding(
            padding: EdgeInsets.only(
              left: 46.h,
              right: 44.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "M".toUpperCase(),
                  style: CustomTextStyles.bodySmall11_1,
                ),
                Spacer(
                  flex: 19,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "T".toUpperCase(),
                        style: CustomTextStyles.bodySmall11,
                      ),
                      TextSpan(
                        text: "u",
                        style: CustomTextStyles.bodySmall11,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
                Spacer(
                  flex: 20,
                ),
                Text(
                  "W".toUpperCase(),
                  style: CustomTextStyles.bodySmall11_1,
                ),
                Spacer(
                  flex: 21,
                ),
                Text(
                  "Th",
                  style: CustomTextStyles.bodySmall11_1,
                ),
                Spacer(
                  flex: 21,
                ),
                Text(
                  "F".toUpperCase(),
                  style: CustomTextStyles.bodySmall11_1,
                ),
                Spacer(
                  flex: 17,
                ),
                Text(
                  "Sa",
                  style: CustomTextStyles.bodySmall11_1,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.h),
                  child: Text(
                    "Su",
                    style: CustomTextStyles.bodySmall11_1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
