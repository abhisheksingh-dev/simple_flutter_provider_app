import 'package:flutter/material.dart';
import 'package:simple_provider_app/const.dart';

class UserStatusProvider with ChangeNotifier {
  UserStatus _status = UserStatus.idle;
  UserStatus get status => _status;

  changeUserStatus({required bool isLoogedIn}) {
    if (isLoogedIn) {
      _status = UserStatus.loggedIn;
    } else {
      _status = UserStatus.idle;
    }
    notifyListeners();
  }
}
