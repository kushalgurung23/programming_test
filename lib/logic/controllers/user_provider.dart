import 'package:flutter/cupertino.dart';
import 'package:programming_test/data/models/user.dart';
import 'package:programming_test/data/repositories/user_repo.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    getUserRepoData();
  }

  List<User> users = [];
  List<User> get userList => List.from(users);

  void getUserRepoData() async {
    users = await UserRepo().getUserDetails();
    notifyListeners();
  }

}
