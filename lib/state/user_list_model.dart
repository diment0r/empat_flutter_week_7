import 'package:empat_flutter_week_7/state/user_model.dart';
import 'package:flutter/material.dart';

class UserListModel extends ChangeNotifier {
  final List<UserModel> _users = [];

  UserListModel.fromJson(Map<String, dynamic> json) {
    for (int i = 0; i < json['per_page']; i++) {
      _users.add(UserModel(
        id: json['data'][i]['id'],
        email: json['data'][i]['email'],
        firstName: json['data'][i]['first_name'],
        lastName: json['data'][i]['last_name'],
        avatarAsset: json['data'][i]['avatar'],
      ));
    }
    notifyListeners();
  }

  UserListModel() {
    notifyListeners();
  }

  List<UserModel> get users => _users;
}
