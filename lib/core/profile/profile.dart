import 'package:flutter/material.dart';

class Profile {
  final String name;
  final int age;
  final String eyeColor;
  final String skinTone;
  final List<SkinCharacteristic> skinCharacteristics;
  final List<SkinCare> skinCare;

  Profile({
    required this.name,
    required this.age,
    required this.eyeColor,
    required this.skinTone,
    required this.skinCharacteristics,
    required this.skinCare,
  });
}

enum SkinCharacteristic {
  BurnsEasily,
  Mature,
  Sensitive,
  Oily,
  AcneProne,
  Dry,
}

enum SkinCare {
  Sunscreen,
  Moisturizer,
}

class
 
ProfileProvider
 
extends
 
ChangeNotifier
 
{
  Profile? _profile;

  Profile? get profile => _profile;

  void setProfile(Profile profile) {
    _profile = profile;
    notifyListeners();
  }
}