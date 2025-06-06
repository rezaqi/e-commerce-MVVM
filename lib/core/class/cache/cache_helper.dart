import 'package:e_commerce/config/routs/routs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences get prefs {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized");
    }
    return _prefs!;
  }

  static Future<bool> saveToken(String token) async {
    return await _prefs!.setString('token', token);
  }

  static String? getToken() {
    return _prefs!.getString('token');
  }

  static Future<bool> clearToken() async {
    return await _prefs!.remove('token');
  }

  static Future<void> saveLogin(
    String name,
    String email,
  ) async {
    await _prefs!.setString("name", name);
    await _prefs!.setString("email", email);
  }

  static Future<void> clearuser() async {
    await _prefs!.remove("name");
    await _prefs!.remove("email");
  }

  static Future<bool> saveStepPage(String step) {
    return _prefs!.setString("step", step);
  }

  static String stepPage() {
    String page = prefs.getString("step") ?? '';
    if (page == "2") {
      return Routes.home;
    }
    return Routes.login;
  }

  static Future<bool> clearStepPage() async {
    return await _prefs!.remove("step");
  }
}
