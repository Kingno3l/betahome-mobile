import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class RegisteredBetaHelpScreen extends StatefulWidget {
  const RegisteredBetaHelpScreen({super.key});

  @override
  State<RegisteredBetaHelpScreen> createState() =>
      _RegisteredBetaHelpScreenState();
}

class _RegisteredBetaHelpScreenState extends State<RegisteredBetaHelpScreen> {
  bool sort_ascending = false;
  TextEditingController startDateInput = TextEditingController();
  TextEditingController endDateInput = TextEditingController();
  bool rotate = false;

  @override
  void initState() {
    startDateInput.text = ""; //set the initial value of text field
    endDateInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenBar.build(context, "Registered Beta Help"),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        sort_ascending = !sort_ascending;
                        rotate = !rotate;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: RotatedBox(
                        quarterTurns: rotate ? 2 : 0,
                        child: SvgPicture.asset(
                          './lib/assets/svgs/sort_up.svg',
                          width: 30,
                        ),
                      ),
                    ),
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
                    //  TextButton.icon(
                    //   onPressed: null,
                    //   style: TextButton.styleFrom(
                    //       padding: const EdgeInsets.all(12),
                    //       // shape: RoundedRectangleBorder(borderRadius: ),
                    //       alignment: Alignment.centerLeft,
                    //       backgroundColor: const Color(0xffF4F4F4)),
                    //   icon: const Icon(
                    //     Icons.calendar_month_rounded,
                    //     size: 18,
                    //   ),
                    //   label: const Text('End'),
                    // ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("lib/assets/svgs/correct.svg"),
                  const SizedBox(
                    width: 2,
                  ),
                  const Text(
                    "Completed registration",
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SvgPicture.asset("lib/assets/svgs/cancel.svg"),
                  const SizedBox(
                    width: 2,
                  ),
                  const Text(
                    "Incompleted registration",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
              Expanded(
                  child: ListView(
                reverse: sort_ascending,
                children: const [
                  RegistrationCard(
                    name: "Akinfenwa Taofeek",
                    summary: "Carpenter",
                    status: true,
                    date: "22/07/2022",
                    time: "10:11",
                  ),
                  RegistrationCard(
                    name: "Beta Classic",
                    summary: "N800,000",
                    status: false,
                    date: "19/07/2022",
                    time: "10:11",
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class RegistrationCard extends StatelessWidget {
  final String name;
  final String summary;
  final bool status;
  final String date;
  final String time;
  const RegistrationCard({
    required this.name,
    required this.summary,
    required this.status,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xfff4f5f9),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/assets/imgs/furniture1.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),
                    status
                        ? SvgPicture.asset("lib/assets/svgs/correct.svg")
                        : SvgPicture.asset("lib/assets/svgs/cancel.svg"),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      summary,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Text("$date $time")
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
