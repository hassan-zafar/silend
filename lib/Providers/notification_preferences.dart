import 'package:flutter/material.dart';
import 'package:silend/Models/preferencesFile.dart';

class NotificationSetProvider with ChangeNotifier {
  NotificationPreferences notificationPreferences = NotificationPreferences();
  bool _setNotification = true;
  bool get notificationSet => _setNotification;

  set notificationSet(bool value) {
    _setNotification = value;
    notificationPreferences.setNotification(value);
    notifyListeners();
  }
}
