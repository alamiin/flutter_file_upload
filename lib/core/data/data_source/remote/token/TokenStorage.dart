
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/constants.dart';

class TokenStorage {
  final SharedPreferences prefs;

  TokenStorage(this.prefs);

  String? getAccessToken() => prefs.getString(accessToken);
  String? getRefreshToken() => prefs.getString(refreshToken);
}
