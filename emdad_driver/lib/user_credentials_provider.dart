import 'package:flutter/material.dart';

class UserCredentialsProvider extends ChangeNotifier {
  String? serverUrl;
  String? database;
  String? username;
  String? password;

  void setCredentials(String serverUrl, String database, String username, String password) {
    this.serverUrl = serverUrl;
    this.database = database;
    this.username = username;
    this.password = password;
    notifyListeners();
  }
}
