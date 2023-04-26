import 'package:beta_home/models/data.dart';
import 'package:beta_home/widgets/join_sales_workforce_bottom_sheet.dart';
import 'package:beta_home/screens/registered_beta_help.dart';
import 'package:beta_home/widgets/dot.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SalesWorkForceScreen extends StatefulWidget {
  const SalesWorkForceScreen({super.key});

  @override
  State<SalesWorkForceScreen> createState() => _SalesWorkForceScreenState();
}

class _SalesWorkForceScreenState extends State<SalesWorkForceScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Consumer<DataModel>(
        builder: (context, data, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Welcome, ${data.profile != null ? data.profile!.first_name : 'Guest'} ',
                      style: const TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        const Icon(
                          Icons.notifications,
                          size: 31,
                          color: Color(0xff000000),
                        ),
                        Positioned(top: 4, right: 6, child: Dot()),
                      ],
                    ),
                  ],
                ),
                const Text(
                  "Thank you for your service",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                    color: const Color(0xfffff6d6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(children: [
                      const Text(
                        'Money Balance',
                        style: TextStyle(fontSize: 21),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'N15,000.00',
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xff223357)),
                              child: const Text(
                                "Breakdown",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 27),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xff50b18b)),
                              child: const Text(
                                "Withdraw",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Stats",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          color: Color(0xFFF4F5F9),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              const Text('Completed BetaHome'),
                              const SizedBox(
                                height: 16,
                              ),
                              const Text(
                                '100',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextButton(
                                onPressed: () => {},
                                child: const Text(
                                  'See all BetaHome',
                                  style: TextStyle(
                                    color: Color(0xFF14B08B),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // showModalBottomSheet(
                        //     isScrollControlled: true,
                        //     enableDrag: true,
                        //     context: context,
                        //     builder: (context) {
                        //       return Wrap(
                        //           children: [const JoinSalesWorkforceBottomSheet()]);
                        //     });
                      },
                      child: Flexible(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.all(16.0),
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0)),
                            color: Color(0xFFF4F5F9),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                const Text('Registered BetaHelp'),
                                const SizedBox(
                                  height: 16,
                                ),
                                const Text(
                                  '50',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisteredBetaHelpScreen())),
                                  },
                                  child: const Text(
                                    'See all BetaHelp',
                                    style: TextStyle(
                                      color: Color(0xFF14B08B),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}




              // onTap: () {
              //           showModalBottomSheet(
              //               isScrollControlled: true,
              //               enableDrag: true,
              //               context: context,
              //               builder: (context) {
              //                 return Wrap(
              //                     children: [const JoinSalesWorkforce()]);
              //               });
              //         },