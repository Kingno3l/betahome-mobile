import 'package:beta_home/elements/bottom_sheet.dart';
import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/data.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/screens/sign_in.dart';
import 'package:beta_home/screens/sign_up.dart';
import 'package:beta_home/widgets/botom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class BetaHelp extends StatefulWidget {
  const BetaHelp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BetaHelpState();
}

class _BetaHelpState extends State<BetaHelp> {
  List _services = [];
  List? _banks;
  Map _params = {
    'step': 1,
    'vMethod': 'BVN',
    'serviceID': '',
    'bank': null,
    'account': null,
    'isVerifying': false,
  };

  @override
  void initState() {
    super.initState();
    getServices();
    getBanks();
  }

  Future getServices() async {
    try {
      final resp = await ServerHelper.get(UrlHelper.services);
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        if (json.status == 'success') {
          setState(() {
            _services = json.data;
          });
        }
      }
    } catch (e) {}
  }

  Future getBanks() async {
    try {
      final resp = await ServerHelper.get('${UrlHelper.bank}/list');
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        if (json.status == 'success') {
          setState(() {
            _banks = json.data;
          });
        }
      }
    } catch (e) {}
  }

  void _setState(Map state) {
    Navigator.pop(context);
    setState(() {
      _params = {..._params, ...state};
    });
    showBottomSheet();
  }

  void showBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: BotomSheet.shape(),
      context: context,
      builder: (context) => BotomShet.verifyBetaHelp(
          context, _banks?? [], _services, _params, _setState, () {}),
    );
  }

  Future _joinNow() async {
    try {
      final resp = await ServerHelper.get(UrlHelper.joinBetaHelp);
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        Fluttertoast.showToast(msg: json.msg, toastLength: Toast.LENGTH_LONG);
        if (json.status == 'success') {
          // setState(() {
          //   _items = json.data;
          // });
          if (!mounted) return;
          ServerHelper.getProfile(context);
        }
      } else {
        Fluttertoast.showToast(
            msg: 'Connection error.', toastLength: Toast.LENGTH_LONG);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'An error occured', toastLength: Toast.LENGTH_LONG);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(builder: (context, data, child) {
      return Scaffold(
        body: Center(
          child: data.profile != null && data.profile!.is_beta_help
              ? const Text('You are in')
              : Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      width: 250,
                      child: Text(
                        'Are you an Artisan or a business person? Join our Beta Help and showcase your products and services in our market place.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (data.profile != null &&
                        !data.profile!
                            .is_beta_help) ... //Logged in but not yet a BetaHelp
                      [
                      TextButton(
                        onPressed: () => showBottomSheet(),
                        // () => _joinNow(),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 14,
                          ),
                          backgroundColor: const Color(0xFFFFDA58),
                        ),
                        child: const Text(
                          'Join now',
                          style: TextStyle(
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ] else ...[
                      TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()),
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 14,
                          ),
                          backgroundColor: const Color(0xFFFFDA58),
                        ),
                        child: const Text(
                          'Join now',
                          style: TextStyle(
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('Already a member?'),
                      TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn()),
                        ),
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            color: Color(0xFFFFDA58),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
        ),
      );
    });
  }
}
