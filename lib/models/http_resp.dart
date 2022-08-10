class HttpResp {
  String _status;
  String _msg;
  dynamic _data;
  dynamic _token;

  HttpResp(this._status, this._msg, this._data, this._token);

  factory HttpResp.fromJson(dynamic json) {
    return HttpResp(json['status'], json['msg'], json['data'], json['token']);
  }

  String status() {
    return _status;
  }

  String msg() {
    return _msg;
  }

  dynamic data() {
    return _data;
  }

  dynamic token() {
    return _token;
  }
}
