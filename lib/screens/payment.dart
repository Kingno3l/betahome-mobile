import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:beta_home/helper/consts.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack_payment/flutter_paystack_payment.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  // final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  // final plugin = PaystackPayment();

  @override
  void initState() {
    // plugin.initialize(publicKey: Consts.PAYSTACK_PUB_KEY);
    // _init();
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  String _getReference() {
    var platform = (Platform.isIOS) ? 'ios' : 'android';
    final thisDate = DateTime.now().millisecondsSinceEpoch;
    return '${platform}_$thisDate';
  }

  // void _init() async {
  //   Charge charge = Charge()
  //     ..amount = 1000 * 100
  //     ..reference = _getReference()
  //     ..email = 'monadesola@gmail.com';
  //   CheckoutResponse response = await plugin.checkout(
  //     context,
  //     method: CheckoutMethod.card,
  //     charge: charge,
  //   );
  // }
  final String _email = 'monadesola@gmail.com';
  final double _amount = 100;

  @override
  Widget build(BuildContext context) {
    const String html = '''
      <!DOCTYPE html>
      <html lang="en">
        <head>
          <meta charset="utf-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
        </head>
        
        <body>
            <form >
                <script src="https://js.paystack.co/v2/inline.js"></script>
            </form>
            <script>
              function payWithPaystack(){
                const paystack = new PaystackPop();
                paystack.newTransaction({
                    key:'pk_test_ac78618b35cdd7f0e2bd922307dd0bb9c3130ec4',
                    email:'monadesola@gmail.com',
                    amount:1000,
                    currency:'GHS',
                    onSuccess: (response) => {
                      window.FlutterWebView.postMessage(response.reference)
                    },
                    onCancel: () => {
                      window.FlutterWebView.postMessage(-1)
                    }
                });
              }
              payWithPaystack();
            </script>
        </body>
    </html>
    ''';

    return Scaffold(
      appBar: ScreenBar.build(context, 'Payment'),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        userAgent: 'Flutter;Webview',
        javascriptChannels: <JavascriptChannel>{
          _toasterJavascriptChannel(context),
        },
        // initialUrl: Uri.dataFromString(
        //   strHTML,
        //   mimeType: 'text/html',
        //   encoding: Encoding.getByName('utf-8'),
        // ).toString(),
        onWebViewCreated: (WebViewController webViewController) async {
          await webViewController.clearCache();
          webViewController.loadUrl(Uri.dataFromString(
            html,
            mimeType: 'text/html',
            encoding: Encoding.getByName('utf-8'),
          ).toString());
        },
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'FlutterWebView',
      onMessageReceived: (JavascriptMessage message) {
        Navigator.pop(context, message.message);
      },
    );
  }
}
