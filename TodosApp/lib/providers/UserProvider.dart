import 'package:TodosApp/models/user.dart';
import 'package:TodosApp/providers/BaseProvider.dart';


class UserProvider extends BaseProvider {
  String _username;
  User _user;

  String get username => _username;
   User get user => _user;

   void setName(String n) {
    _username = n;
    notifyListeners();
  }

  void setUser(User u) {
    _user = u;
    notifyListeners();
  }
}
