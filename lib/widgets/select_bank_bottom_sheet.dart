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
  List<dynamic> foundBanks = [];

  Future getBanks() async {
    try {
      final resp = await ServerHelper.get('${UrlHelper.bank}/list');
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        if (json.status == 'success') {
          setState(() {
            banks = json.data;
            foundBanks = banks;
          });
        }
      }
    } catch (e) {}
  }

  @override
  void initState() {
    getBanks();
    super.initState();
  }

  void updateList(String value) {
    List<dynamic> results = [];
    if (value.isEmpty) {
      results = foundBanks;
    } else {
      results = foundBanks
          .where((element) =>
              element["name"].toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      foundBanks = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          //heading
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
                    onChanged: (value) => updateList(value),
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
          //body
          foundBanks.isNotEmpty
              ? Expanded(
                  child: Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Container(
                          padding: EdgeInsets.all(8),
                          color: Colors.white,
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                for (int i = 0; i < foundBanks.length; i++)
                                  bank(
                                    name: foundBanks[i]['name'],
                                    code: foundBanks[i]['code'],
                                  ),
                              ],
                            ),
                          )),
                    ),
                  ),
                )
              : Expanded(
                child: Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.white,
                    child: Center(child: CircularProgressIndicator())),
              ),
        ],
      ),
    );
  }
}



// ListView.builder(
//                           itemCount: foundBanks.length,
//                           physics: BouncingScrollPhysics(),
//                           itemBuilder: (BuildContext context, int index) {
//                             return bank(
//                               name: foundBanks[index]['name'],
//                               code: foundBanks[index]['code'],
//                             );
//                           },
//                         ),