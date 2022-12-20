import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Earnings extends StatefulWidget {
  const Earnings({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EarningsState();
}

class _EarningsState extends State<Earnings> {
  List _items = [];

  @override
  void initState() {
    super.initState();
    getOrders();
  }

  Future getOrders() async {
    try {
      final resp = await ServerHelper.get(UrlHelper.orders);
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        if (json.status == 'success') {
          setState(() {
            _items = json.data;
          });
        } else {
          Fluttertoast.showToast(msg: json.msg, toastLength: Toast.LENGTH_LONG);
        }
      } else {
        Fluttertoast.showToast(
            msg: 'Connection error.', toastLength: Toast.LENGTH_LONG);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error.', toastLength: Toast.LENGTH_LONG);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenBar.build(context, 'My Earnings'),
      body: RefreshIndicator(
        onRefresh: getOrders,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
                color: Color(0xFFFFF6D6),
              ),
              child: Column(
                children: [
                  const Text('Money balance'),
                  const Text(
                    'N 200,000',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => {},
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 14,
                          ),
                          backgroundColor: const Color(0xFF273357),
                        ),
                        child: const Text(
                          'Breakdown',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      TextButton(
                        onPressed: () => {},
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 14,
                          ),
                          backgroundColor: const Color(0xFF14B08B),
                        ),
                        child: const Text(
                          'Withdraw',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: const Text(
                'My Referred',
                textAlign: TextAlign.left,
              ),
            ),
            Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      color: Color(0xFFF4F5F9),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          const Text('BetaHome'),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            '100',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () => {},
                            child: const Text(
                              'See all',
                              style: TextStyle(
                                color: Color(0xFF14B08B),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      color: Color(0xFFF4F5F9),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          const Text('BetaHelp'),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            '50',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () => {},
                            child: const Text(
                              'See all',
                              style: TextStyle(
                                color: Color(0xFF14B08B),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
