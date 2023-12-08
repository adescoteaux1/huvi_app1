import 'package:flutter/material.dart';
import 'package:huvi_app1/core/app_export.dart';
import 'package:huvi_app1/core/utils/constants.dart';
import 'package:huvi_app1/main.dart';
//import 'e:huvi_app1/core/profile/profile.dart';
import 'package:huvi_app1/presentation/profile_vone_screen/profile_vone_screen.dart';
import 'package:huvi_app1/widgets/checkboxGroup.dart';
import 'package:huvi_app1/widgets/custom_checkbox_button.dart';
import 'package:huvi_app1/widgets/custom_drop_down.dart';
import 'package:huvi_app1/widgets/custom_elevated_button.dart';
import 'package:huvi_app1/widgets/custom_text_form_field.dart';

class EditProfileScreen extends StatefulWidget {
  //final ProfileProvider profileProvider;
  
  EditProfileScreen({
    Key? key,
    //required this.profileProvider,
  })
      : super(
          key: key,
        );

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

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

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final List<String> selectedEyeColor = [];
  final List<String> selectedSkinTone = [];
  List<String> selectedSkinCharacteristics = [];
  List<String> selectedSkinCare = [];

  @override
  void initState() {
    super.initState();

    // Get the user's profile data from Supabase
    supabase.from('users').select().single().then((response) {
      if (response.status == 200) {
        // Set the user's profile data in the state
        nameController.text = response.data['name'];
        ageController.text = response.data['age'].toString();
        selectedEyeColor.add(response.data['eye_color']);
        selectedSkinTone.add(response.data['skin_tone']);
        selectedSkinCharacteristics.addAll(response.data['skin_characteristics']);
        selectedSkinCare.addAll(response.data['skin_care']);
      }
    });
  }

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
                            Row(
                              children: [
                                Column(children: [
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
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(left: 15.h, top: 30.v),
                                                    child: CheckboxGroup(
                                                      options: ['Sunscreen', 'Moisturizer', 'Serum', 'Mask', 'Cleanser', 'Toner'],
                                                      selected: selectedSkinCare,
                                                      onSelected: (selectedValues) {
                                                        setState(() {
                                                          selectedSkinCare = selectedValues;
                                                        });
                                                      },
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
                                ),
                              ]),SizedBox(width: 100.v),
                                Column(children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Skin Characteristics:",
                                    style: theme.textTheme.titleMedium,
                                  ),
                                ),
                                SizedBox(height: 8.h), // Add space between the text and checkbox group
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 15.h),
                                    child: CheckboxGroup(
                                      options: ['Burns Easily', 'Mature', 'Sensitive', 'Oily', 'Acne-prone', 'Dry'],
                                      selected: selectedSkinCharacteristics,
                                      onSelected: (selectedValues) {
                                        setState(() {
                                          selectedSkinCharacteristics = selectedValues;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                              )
                              ]
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
        controller: nameController,
      ),
    );
  }

  /// Section Widget
  Widget _buildAgeEditText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 23.h),
      child: CustomTextFormField(
        width: 84.h,
        controller: ageController,
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
            value: selectedEyeColor.isNotEmpty ? selectedEyeColor[0] : null,
            onChanged: (value) {
              setState(() {
                    selectedEyeColor.clear();
                    selectedEyeColor.add(value!);
                  });
            },
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
              value: selectedSkinTone.isNotEmpty ? selectedSkinTone[0] : null,
              onChanged: (value) {
                setState(() {
                    selectedSkinTone.clear();
                    selectedSkinTone.add(value!);
                  });
              },
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
        () async {
          // Update the user's profile data in Supabase
          final response = await supabase.from('users').update({
            'name': nameController.text,
            'age': int.parse(ageController.text),
            'eye_color': selectedEyeColor.isNotEmpty ? selectedEyeColor[0] : null,
            'skin_tone': selectedSkinTone.isNotEmpty ? selectedSkinTone[0] : null,
            'skin_characteristics': selectedSkinCharacteristics,
            'skin_care': selectedSkinCare,
          }).match({ 'user_id': userID }).single();

          if (response.status == 200) {
            // Show a success message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Profile updated successfully!'),
              ),
            );
          } else {
            // Show an error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error updating profile!'),
              ),
            );
          }
        };
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