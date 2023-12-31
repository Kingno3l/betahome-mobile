import 'dart:convert';

import 'package:beta_home/helper/keys.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/helper/utils.dart';
import 'package:beta_home/models/data.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> put(String url, Object data) async {
    try {
      SharedPreferences pref = await _pref;
      final resp = await Dio().put(
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
        rethrow;
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
        rethrow;
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
        if (json.status == 'success') {
          _pref.then((SharedPreferences pref) {
            final profile = const JsonEncoder().convert(json.data);
            pref.setString(Keys.PROFILE, profile);

            Provider.of<DataModel>(context, listen: false).profile = json.data;
            Navigator.pushAndRemoveUntil(context, route!, ((route) => false));
          });
        } else {
          Utils.showToast(json.msg);
        }
      } else {
        Utils.showToast('Connection error.');
      }
    } catch (e) {
      Utils.showToast('An error occured');
    }
  }

  static Future logout(context) async {
    SharedPreferences pref = await _pref;
    if (await pref.remove(Keys.PROFILE) //&& await pref.remove(Keys.TOKEN)
        ) {
      final provider = Provider.of<DataModel>(context, listen: false).profile =
          pref.getString(Keys.PROFILE);
      return provider == null;
    }
  }
}
