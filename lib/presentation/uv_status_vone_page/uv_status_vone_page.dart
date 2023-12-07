import 'dart:convert';

import 'package:huvi_app1/core/app_export.dart';
import 'package:huvi_app1/core/models/weather_models.dart';
import 'package:huvi_app1/core/utils/constants.dart';
import 'package:huvi_app1/presentation/recommendation_vone_screen/recommendation_vone_screen.dart';
import 'package:huvi_app1/widgets/clock_widget.dart';
import 'package:huvi_app1/widgets/custom_bottom_bar.dart';
import 'package:huvi_app1/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:huvi_app1/widgets/location.dart';
import 'package:huvi_app1/widgets/severity_gague.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:lottie/lottie.dart';


import '../../core/services/weather_service.dart';

class UvStatusVonePage extends StatefulWidget {
  UvStatusVonePage({Key? key}) : super(key: key);

  @override
  State<UvStatusVonePage> createState() => _UvStatusVonePageState();
}

class _UvStatusVonePageState extends State<UvStatusVonePage> {
  
  AppConstants constants = AppConstants();
  final _weatherService = WeatherService('2cab5c5e69ebafa5c4a0557e156831a2');
  Weather? _weather;

  Future<void> loadJsonAsset() async { 
  final String jsonString = await rootBundle.loadString('assets/cloud.json'); 
  final data = jsonDecode(jsonString); 
  print(data); 
}

  _fetchWeather() async {
    //gett current city
    String cityName = await _weatherService.getCurrentCity();
    print(cityName);
    //get weather for city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    constants = AppConstants();

    _fetchWeather();
    loadJsonAsset();
  }
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray50,
            body: SingleChildScrollView(
              child: Container(
                width: 410.h,
                decoration: AppDecoration.fillGray50,
                child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 19.h, vertical: 8.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgArrowleft,
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                              margin: EdgeInsets.only(left: 2.h),
                              onTap: () {
                                onTapImgArrowleftone(context);
                              }),
                          Padding(
                              padding: EdgeInsets.only(left: 61.h, top: 5.v),
                              child: Row(children: [
                                /*CustomImageView(
                                    svgPath: ImageConstant.imgSun,
                                    height: 49.adaptSize,
                                    width: 49.adaptSize),*/
                                Container(child: Lottie.asset('assets/cloud.json'),
                                height: 75.v,)
                                ,
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 11.h, top: 10.v),
                                    child: Text(//'47°F',
                                    constants.temperature + '°F',
                                        style: CustomTextStyles
                                            .headlineLargeBlack90001)),
                                    Padding(
                                    padding:
                                        EdgeInsets.only(left: 11.h, top: 10.v),
                                    child: Text('Cloudy',
                                    //constants.condition,
                                        style: CustomTextStyles
                                            .headlineLargeBlack90001))
                              ])),
                            
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: 40.h, top: 9.v, right: 40.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40.h, vertical: 50.v),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              ImageConstant.imgGroup4),
                                          fit: BoxFit.cover)),
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          left: 1.h, bottom: 7.v),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 44.h, vertical: 15.v),
                                      decoration: AppDecoration.gradientYellowToYellow.copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .roundedBorder74),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            SizedBox(height: 7.v),
                                            Text(uvIndex.toString(),
                                                style: CustomTextStyles
                                                    .interBlack90001)
                                          ])))),
                          Container(
                              height: 110.v,
                              width: 354.h,
                              margin: EdgeInsets.only(left: 2.h, top: 9.v),
                              child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 94.h),
                                            child: Text("UV LEVEL",
                                                style: CustomTextStyles
                                                    .headlineLargeYellow900))),
                                    Padding(
                                            padding:
                                                EdgeInsets.only(top: 15.v),
                                            child: SeverityGauge(severity: uvIndex/10)),
                                  ])),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 10.h, top: 10.v, right: 66.h),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomImageView(
                                        svgPath: ImageConstant.imgClock,
                                        height: 40.adaptSize,
                                        width: 40.adaptSize,
                                        margin: EdgeInsets.only(bottom: 9.v)),
                                    Expanded(
                                        child: Container(
                                            width: 216.h,
                                            margin: EdgeInsets.only(
                                                left: 14.h, top: 3.v),
                                            child: Text(
                                                "You have 30 minutes left of safe sun time!",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: CustomTextStyles
                                                    .titleMediumBluegray600
                                                    .copyWith(height: 1.44))))
                                  ])),
                          Padding(
                              padding: EdgeInsets.only(left: 75.h, top: 17.v),
                              child: Row(children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgLocationmarker,
                                    height: 36.adaptSize,
                                    width: 36.adaptSize,
                                    margin: EdgeInsets.only(
                                        top: 20.v, bottom: 27.v)),
                                Column(children: [
                                  Container(
                                    width: 195.h,
                                    margin: EdgeInsets.only(left: 5.h),
                                    child: ClockWidget(),
                                  ),
                                  Container(
                                      width: 164.h,
                                      margin: EdgeInsets.only(left: 5.h),
                                      child: //LocationWidget(),
                                          Text(
                                        //'Boston',
                                        constants.city,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 24),
                                      ))
                                ]),
                              ])),
                          CustomElevatedButton(
                            text: "See Recommendations",
                            margin: EdgeInsets.fromLTRB(6.h, 5.v, 5.h, 8.v),
                            buttonStyle: CustomButtonStyles.outlineBlack,
                            alignment: Alignment.center,
                            onTap: () {
                              // Replace 'YourRouteNameHere' with the actual route name to navigate to the login screen.
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RecommendationVoneScreen()),
                              );
                            },
                          )
                        ]))),
                        //bottomNavigationBar: CustomBottomBar(
          //),
                        )
        ),
    );
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapImgArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
