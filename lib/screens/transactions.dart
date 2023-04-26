import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/models/transaction_item.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:beta_home/widgets/transaction_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:collection/collection.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  List _items = [];
  bool sort_ascending = false;
  TextEditingController startDateInput = TextEditingController();
  TextEditingController endDateInput = TextEditingController();
  bool rotate = false;

  @override
  void initState() {
    startDateInput.text = ""; //set the initial value of text field
    endDateInput.text = "";
    super.initState();
    getTransactions();
  }

  Future getTransactions() async {
    try {
      final resp = await ServerHelper.get(UrlHelper.transactions);
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
      Fluttertoast.showToast(
          msg: 'An error occured.', toastLength: Toast.LENGTH_LONG);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenBar.build(context, 'Transactions'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      sort_ascending = !sort_ascending;
                      rotate = !rotate;
                    });
                  },
                  child: RotatedBox(
                    quarterTurns: rotate ? 2 : 0,
                    child: SvgPicture.asset(
                        './lib/assets/icons/svgs/sort_ascending.svg'),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextField(
                    controller: startDateInput,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2100));

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        setState(() {
                          startDateInput.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {}
                    },
                    cursorHeight: 0,
                    cursorWidth: 0,
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(40)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(40)),
                      filled: true,
                      fillColor: Color(0xffF4F4F4),
                      hintText: "Start",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.calendar_month_rounded,
                          size: 18, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                const Text(
                  'to',
                  style: TextStyle(),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextField(
                    controller: endDateInput,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2100));

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        setState(() {
                          endDateInput.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {}
                    },
                    cursorHeight: 0,
                    cursorWidth: 0,
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(40)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(40)),
                      filled: true,
                      fillColor: Color(0xffF4F4F4),
                      hintText: "End",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.calendar_month_rounded,
                          size: 18, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            reverse: sort_ascending,
            padding: const EdgeInsets.all(10),
            children: [
              const Text(
                'July',
                style: TextStyle(
                  color: Color(0xff696969),
                ),
              ),
              ..._items
                  .mapIndexed(
                    (index, item) =>
                        transactionRow(TransactionItem.fromJson(item)),
                  )
                  .toList()
            ],
          )),
        ],
      ),
    );
  }
}
