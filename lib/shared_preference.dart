import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('authToken', token);      // the token is saved
}

Future<String?> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('authToken');       //  the token iis retrieved
}
