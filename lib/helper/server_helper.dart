import 'package:beta_home/helper/keys.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

class ServerHelper {
  static Future<Map<String, dynamic>> post(String url, Object data) async {
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
        return {'status': resp.statusCode, 'data': resp.data};
      } else {
        return {'status': resp.statusCode};
      }
    } on DioError catch (e) {
      if (e.response != null) {
        return {'status': e.response?.statusCode};
      } else {
        throw (e.message);
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> get(String url) async {
    try {
      SharedPreferences pref = await _pref;
      final resp = await Dio().get(
        url,
        options: Options(
          headers: {'Authorization': 'Bearer ${pref.getString(Keys.TOKEN)}'},
        ),
      );
      if (resp.statusCode == 200) {
        return {'status': resp.statusCode, 'data': resp.data};
      } else {
        return {'status': resp.statusCode};
      }
    } on DioError catch (e) {
      if (e.response != null) {
        return {'status': e.response?.statusCode};
      } else {
        throw (e.message);
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future getProfile(context, {MaterialPageRoute? route}) async {
    try {
      final resp = await ServerHelper.get(UrlHelper.profile);
      if (resp['status'] == 200 || resp['status'] == 401) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        print(resp['data']);
        if (json.status() == 'success') {
          _pref.then((SharedPreferences pref) {
            pref.setString(Keys.PROFILE, json.data());
            if (route != null) {
              Navigator.push(context, route);
            }
          });
        } else {
          Fluttertoast.showToast(
              msg: json.msg(), toastLength: Toast.LENGTH_LONG);
        }
      } else {
        Fluttertoast.showToast(
            msg: 'Connection error.', toastLength: Toast.LENGTH_LONG);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), toastLength: Toast.LENGTH_LONG);
    }
  }
}
