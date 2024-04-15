import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  final int _id;
  final String _email;
  final String _firstName;
  final String _lastName;
  final String _avatarAsset;

  UserModel({
    required int id,
    required String email,
    required String firstName,
    required String lastName,
    required String avatarAsset,
  })  : _id = id,
        _email = email,
        _firstName = firstName,
        _lastName = lastName,
        _avatarAsset = avatarAsset;

  int get id => _id;
  String get email => _email;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get avatarAsset => _avatarAsset;
}
