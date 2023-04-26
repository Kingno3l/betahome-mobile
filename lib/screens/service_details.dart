import 'package:beta_home/elements/bottom_sheet.dart';
import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/helper/utils.dart';
import 'package:beta_home/models/data.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/screens/sign_in.dart';
import 'package:beta_home/widgets/botom_sheet.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceDetails extends StatefulWidget {
  final dynamic service;
  const ServiceDetails({Key? key, required this.service}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ServiceDetails();
}

class _ServiceDetails extends State<ServiceDetails> {
  List _providers = [];
  String _requestingProviderId = '';
    var item;

  @override
  void initState() {
    super.initState();
    getProviders();
  }

  Future getProviders() async {
    try {
      final resp = await ServerHelper.get(
          '${UrlHelper.service}/${widget.service['_id']}/providers');
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        if (json.status == 'success') {
          setState(() {
            _providers = json.data;
          });
        } else {
          Utils.showToast(json.msg);
        }
      } else {
        Utils.showToast('Connection error.');
      }
    } catch (e) {
      Utils.showToast('An error occured.');
    }
  }

  void _onRequest(dynamic provider) async {
    Navigator.pop(context);
    setState(() {
      _requestingProviderId = provider['_id'];
    });
    try {
      final resp = await ServerHelper.post(
          '${UrlHelper.service}/request/provider', {
        'service_id': widget.service['_id'],
        'provider_id': provider['_id']
      });
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: Text(json.msg),
          ),
        );
        if (json.status == 'success') {}
      } else {
        Utils.showToast('Connection error.');
      }
    } catch (e) {
      Utils.showToast('An error occured.');
    }
    setState(() {
      _requestingProviderId = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final dynamic service = widget.service;

    return Scaffold(
      appBar: ScreenBar.build(context, service['name']),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: _providers
                  .map(
                    (item) => Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                        color: Color(
                          int.parse(service['color']),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image(
                                width: 90,
                                height: 90,
                                fit: BoxFit.fill,
                                image: NetworkImage(item['profile_pic'] ??
                                    '${UrlHelper.file}?key=${service['cover_pic']}'),//check later
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${item['first_name']} ${item['last_name']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  // const Text(
                                  //   "item['description']",
                                  //   maxLines: 4,
                                  //   overflow: TextOverflow.fade,
                                  //   style: TextStyle(fontSize: 12),
                                  // ),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.star_outlined,
                                        color: Color(0xffFFDA58),
                                        size: 19,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        '4.9',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  // width: 18,
                                  // height: 18,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Consumer<DataModel>(
                                    builder: (context, data, child) {
                                      return InkWell(
                                        onTap: _requestingProviderId ==
                                                item['_id']
                                            ? null
                                            : () {
                                                data.profile == null
                                                    ? Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const SignIn(),
                                                        ),
                                                      )
                                                    : showModalBottomSheet(
                                                        shape:
                                                            BotomSheet.shape(),
                                                        context: context,
                                                        builder: (context) =>
                                                            BotomShet
                                                                .requestProvider(
                                                          context,
                                                          item,
                                                          _onRequest,
                                                        ),
                                                      );
                                              },
                                        child: Text(
                                          _requestingProviderId == item['_id']
                                              ? 'REQUESTING'
                                              : "REQUEST",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
