import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/helper/utils.dart';
import 'package:beta_home/models/data.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Payment extends StatefulWidget {
  final String amount;
  const Payment({Key? key, required this.amount}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String? _email;
  String? _amount;
  Map? _data;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _email = Provider.of<DataModel>(context, listen: false).profile?.email;
    _amount = widget.amount;
    _init();
  }

  Future _init() async {
    try {
      final resp = await ServerHelper.post('${UrlHelper.payment}/initialize',
          {'email': _email, 'amount': _amount});
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        if (json.status == 'success') {
          setState(() {
            _data = json.data;
          });
        } else {
          Utils.showToast(json.msg);
          goBack();
        }
      } else {
        Utils.showToast('Connection error.');
        goBack();
      }
    } catch (e) {
      Utils.showToast('An error occured');
      goBack();
    }
  }

  void goBack({String? status}) {
    // Navigator.of(context).pop();
    Navigator.pop(context, status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenBar.build(context, 'Payment'),
      body: _data == null
          ? const Center(
              child: Text('Initializing...'),
            )
          : WebView(
              initialUrl: _data!['authorization_url'],
              javascriptMode: JavascriptMode.unrestricted,
              userAgent: 'Flutter;Webview',
              navigationDelegate: (navigation) {
                if (navigation.url.startsWith(_data!['callback_url'])) {
                  //Transaction was successful
                  //You can verify transaction here
                  goBack(status: 'success');
                }
                return NavigationDecision.navigate;
              },
            ),
    );
  }
}
