import 'package:encrypt_shared_preferences/provider.dart';

class TokenHandler {
  static Future<void> saveToken(String key, String value) async {
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String?> getToken(String key) async {
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
