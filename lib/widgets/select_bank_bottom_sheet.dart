import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/widgets/bank.dart';
import 'package:flutter/material.dart';

class SelectBankBottomSheet extends StatefulWidget {
  const SelectBankBottomSheet({super.key});

  @override
  State<SelectBankBottomSheet> createState() => _SelectBankBottomSheetState();
}

class _SelectBankBottomSheetState extends State<SelectBankBottomSheet> {
  List banks = [];
  String _query = '';

  @override
  void initState() {
    super.initState();
    getBanks();
  }

  Future getBanks() async {
    try {
      final resp = await ServerHelper.get('${UrlHelper.bank}/list');
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        if (json.status == 'success') {
          setState(() {
            banks = json.data;
          });
        }
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.93,
      builder: (context, scrollController) => ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
            ),
            child: Column(
              children: [
                const Divider(
                  thickness: 4,
                  indent: 150,
                  endIndent: 150,
                  color: Color(0xFFBBBBBB),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Select Bank",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: TextField(
                    cursorColor: Colors.black,
                    maxLines: 1,
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Search Bank Name',
                        hintStyle: const TextStyle(color: Color(0xffAEAEAE)),
                        // border: InputBorder.none,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: const Color(0xffEDEDED),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 18,
                          color: Color(0xffAEAEAE),
                        )),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            color: Colors.white,
            height: 555,
            child: ListView.builder(
              itemCount: banks.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return bank(
                  name: banks[index]['name'],
                  code: banks[index]['code'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
