import 'package:beta_home/helper/keys.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

class ServerHelper {
  static Future post(String url, Object data) async {
    try {
      SharedPreferences pref = await _pref;
      final resp = await Dio().post(
        url,
        data: data,
        options: Options(
          headers: {'Authorization': 'Bearer ${pref.getString(Keys.TOKEN)}'},
        ),
      );
      if (resp.statusCode == 200) {
        HttpResp json = HttpResp.fromJson(resp.data);
        return {'status': resp.statusCode, 'json': json};
      } else {
        return {'status': resp.statusCode};
      }
    } on DioError catch (e) {
      if (e.response != null) {
        return {'status': e.response?.statusCode};
      } else {
        throw(e.message);
      }
    } catch (e) {
      rethrow;
    }
  }
}
