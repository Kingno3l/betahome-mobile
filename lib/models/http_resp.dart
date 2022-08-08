class HttpResp {
  String _status;
  String _msg;
  dynamic _data;

  HttpResp(this._status, this._msg, this._data);

  factory HttpResp.fromJson(dynamic json) {
    return HttpResp(json['status'], json['msg'], json['data']);
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
}
