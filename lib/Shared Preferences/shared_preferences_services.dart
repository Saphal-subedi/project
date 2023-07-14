import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  static Future setdata(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('indicator value', value);
  }

  Future<bool> getdata() async {
    final prefs = await SharedPreferences.getInstance();
    final repeat = prefs.getBool('indicator value');
    return repeat ?? false;
  }
}
