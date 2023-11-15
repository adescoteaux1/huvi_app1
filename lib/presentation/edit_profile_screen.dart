import 'package:flutter/material.dart';
import 'package:huvi_app1/core/app_export.dart';
import 'package:huvi_app1/presentation/profile_vone_screen/profile_vone_screen.dart';
import 'package:huvi_app1/widgets/custom_checkbox_button.dart';
import 'package:huvi_app1/widgets/custom_drop_down.dart';
import 'package:huvi_app1/widgets/custom_elevated_button.dart';
import 'package:huvi_app1/widgets/custom_text_form_field.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameEditTextController = TextEditingController();

  TextEditingController ageEditTextController = TextEditingController();

  List<String> dropdownItemList = [
    "Brown",
    "Blue",
    "Green",
    "Other",
  ];

  List<String> dropdownItemList1 = [
    "Light",
    "Medium",
    "Dark",
  ];

  bool container = false;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: 395.h,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfileStack(context),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 23.v,
                    width: 145.h,
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgPencil,
                          height: 15.v,
                          width: 18.h,
                          alignment: Alignment.centerLeft,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 132.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.h,
                              vertical: 1.v,
                            ),
                            decoration: AppDecoration.fillTeal.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10,
                            ),
                            child: Text(
                              "Change Picture",
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 9.v),
                Padding(
                  padding: EdgeInsets.only(left: 23.h),
                  child: Text(
                    "Name:",
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                SizedBox(height: 9.v),
                _buildNameEditText(context),
                SizedBox(height: 10.v),
                Padding(
                  padding: EdgeInsets.only(left: 26.h),
                  child: Text(
                    "Age:",
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                SizedBox(height: 10.v),
                _buildAgeEditText(context),
                SizedBox(height: 20.v),
                Padding(
                  padding: EdgeInsets.only(left: 23.h),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 1.v),
                        child: Text(
                          "Eye Color:",
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 104.h),
                        child: Text(
                          "Skin Tone: ",
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 7.v),
                _buildDropdownRow(context),
                SizedBox(height: 25.v),
                Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 160.v,
                        width: 205.h,
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 44.h,
                                  top: 35.v,
                                ),
                                child: Text(
                                  "Burns Easily",
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 46.h,
                                  bottom: 62.v,
                                ),
                                child: Text(
                                  "Sensitive",
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 44.h,
                                  bottom: 17.v,
                                ),
                                child: Text(
                                  "Acne-prone",
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.h),
                                child: Text(
                                  "Skin Characteristics:",
                                  style: theme.textTheme.titleMedium,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                height: 54.v,
                                width: 52.h,
                                margin: EdgeInsets.only(top: 17.v),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14.h,
                                  vertical: 15.v,
                                ),
                                decoration: AppDecoration.outlinePrimary,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 18.adaptSize,
                                        width: 18.adaptSize,
                                        decoration: BoxDecoration(
                                          color: appTheme.teal400,
                                          borderRadius: BorderRadius.circular(
                                            2.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                    CustomImageView(
                                      svgPath:
                                          ImageConstant.imgIconsCheckSmall,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize,
                                      alignment: Alignment.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            CustomImageView(
                              svgPath: ImageConstant.imgCheckboxes,
                              height: 54.v,
                              width: 52.h,
                              alignment: Alignment.bottomLeft,
                              margin: EdgeInsets.only(bottom: 46.v),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                height: 54.v,
                                width: 52.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14.h,
                                  vertical: 15.v,
                                ),
                                decoration: AppDecoration.outlinePrimary,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 18.adaptSize,
                                        width: 18.adaptSize,
                                        decoration: BoxDecoration(
                                          color: appTheme.teal400,
                                          borderRadius: BorderRadius.circular(
                                            2.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                    CustomImageView(
                                      svgPath:
                                          ImageConstant.imgIconsCheckSmall,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize,
                                      alignment: Alignment.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            CustomImageView(
                              svgPath: ImageConstant.imgCheckboxes,
                              height: 54.v,
                              width: 51.h,
                              alignment: Alignment.topRight,
                              margin: EdgeInsets.only(top: 17.v),
                            ),
                            CustomImageView(
                              svgPath: ImageConstant.imgCheckboxes,
                              height: 54.v,
                              width: 51.h,
                              alignment: Alignment.bottomRight,
                              margin: EdgeInsets.only(bottom: 46.v),
                            ),
                            CustomImageView(
                              svgPath: ImageConstant.imgCheckboxes,
                              height: 54.v,
                              width: 51.h,
                              alignment: Alignment.bottomRight,
                              margin: EdgeInsets.only(bottom: 2.v),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 32.v,
                          bottom: 16.v,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mature",
                              style: theme.textTheme.bodyLarge,
                            ),
                            SizedBox(height: 26.v),
                            Padding(
                              padding: EdgeInsets.only(left: 4.h),
                              child: Text(
                                "Oily",
                                style: theme.textTheme.bodyLarge,
                              ),
                            ),
                            SizedBox(height: 25.v),
                            Padding(
                              padding: EdgeInsets.only(left: 4.h),
                              child: Text(
                                "Dry",
                                style: theme.textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 19.v),
                _buildEditProfileRow(context),
                SizedBox(height: 1403.v),
                CustomImageView(
                  imagePath: ImageConstant.imgProfilepicjennifer1x395,
                  height: 1.v,
                  width: 395.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEditProfileButton(BuildContext context) {
    return Expanded(
      child: CustomElevatedButton(
        text: "EDIT PROFILE",
        margin: EdgeInsets.only(
          left: 19.h,
          bottom: 103.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildProfileStack(BuildContext context) {
    return SizedBox(
      height: 190.v,
      width: 395.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 47.v),
              padding: EdgeInsets.symmetric(horizontal: 27.h),
              decoration: AppDecoration.fillYellow,

              child: Padding(padding: EdgeInsets.only(top: 15.v), child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgArrowRight,
                    height: 20.v,
                    width: 24.h,
                    margin: EdgeInsets.only(bottom: 115.v),
                  ),
                  _buildEditProfileButton(context),
                ],),
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgProfilepicjennifer,
            height: 150.v,
            width: 142.h,
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(top: 10.v),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNameEditText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 23.h),
      child: CustomTextFormField(
        width: 248.h,
        controller: nameEditTextController,
      ),
    );
  }

  /// Section Widget
  Widget _buildAgeEditText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 23.h),
      child: CustomTextFormField(
        width: 84.h,
        controller: ageEditTextController,
        textInputAction: TextInputAction.done,
      ),
    );
  }

  /// Section Widget
  Widget _buildDropdownRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 23.h,
        right: 39.h,
      ),
      child: Row(
        children: [
          CustomDropDown(
            width: 130.h,
            icon: Container(
              margin: EdgeInsets.fromLTRB(17.h, 17.v, 15.h, 17.v),
              child: CustomImageView(
                svgPath: ImageConstant.imgArrowdown,
                height: 8.v,
                width: 16.h,
              ),
            ),
            hintText: "Select Eye Color",
            items: dropdownItemList,
            onChanged: (value) {},
          ),
          Padding(
            padding: EdgeInsets.only(left: 35.h),
            child: CustomDropDown(
              width: 130.h,
              icon: Container(
                margin: EdgeInsets.fromLTRB(12.h, 17.v, 5.h, 17.v),
                child: CustomImageView(
                  svgPath: ImageConstant.imgArrowdown,
                  height: 8.v,
                  width: 16.h,
                ),
              ),
              hintText: "Select Skin Tone",
              items: dropdownItemList1,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSaveButton(BuildContext context) {
    return CustomElevatedButton(
      height: 39.v,
      width: 75.h,
      text: "Save",
      margin: EdgeInsets.only(top: 59.v),
      buttonStyle: CustomButtonStyles.fillTeal,
      buttonTextStyle: theme.textTheme.titleSmall!,
      onTap: () {
        // Replace 'YourRouteNameHere' with the actual route name to navigate to the login screen.
        
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ProfileVoneScreen()),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildEditProfileRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 12.h,
        right: 27.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 100.v,
            width: 135.h,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 29.v,
                      right: 10.h,
                      left: 7.h
                    ),
                    child: Text(
                      "Sunscreen",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 17.v, right: 5.h),
                    child: Text(
                      "Moisturizer",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 100.v,
                    width: 85.h,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: SizedBox(
                            height: 20.v,
                            width: 100.h,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Skin Care:",
                                    style: theme.textTheme.titleMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            padding: EdgeInsets.all(12.h),
                            decoration: AppDecoration.outlinePrimary,
                            child: CustomCheckboxButton(
                              width: 30.h,
                              value: container,
                              isRightCheck: true,
                              onChange: (value) {
                                container = value;
                              },
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            height: 48.adaptSize,
                            width: 48.adaptSize,
                            margin: EdgeInsets.only(top: 16.v, left: 12.h),
                            padding: EdgeInsets.all(12.h),
                            decoration: AppDecoration.outlinePrimary,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 18.adaptSize,
                                    width: 22.adaptSize,
                                    decoration: BoxDecoration(
                                      color: appTheme.teal400,
                                      borderRadius: BorderRadius.circular(
                                        2.h,
                                      ),
                                    ),
                                  ),
                                ),
                                CustomImageView(
                                  svgPath: ImageConstant.imgIconsCheckSmall,
                                  height: 24.adaptSize,
                                  width: 22.adaptSize,
                                  alignment: Alignment.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildSaveButton(context),
        ],
      ),
    );
  }
}

onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }