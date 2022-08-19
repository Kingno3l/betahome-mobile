class HttpResp {
  Object resp;
  String _status;
  String _msg;
  dynamic _data;
  dynamic _token;

  HttpResp(this.resp, this._status, this._msg, this._data, this._token);

  factory HttpResp.fromJson(dynamic json) {
    return HttpResp(
        json, json['status'], json['msg'], json['data'], json['token']);
  }

  get status => _status;

  get msg => _msg;

  get data => _data;

  get token => _token;
}
