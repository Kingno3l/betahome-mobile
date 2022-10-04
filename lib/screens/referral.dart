import 'package:flutter/material.dart';
import 'package:beta_home/screens/referral_history.dart';

class Referral extends StatelessWidget {
  const Referral({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 253, 247, 168),
          shadowColor: Colors.transparent,
          foregroundColor: Colors.black,
          title: Center(
            child: Row(
              children: <Widget>[
                Column(
                  children: const <Widget>[
                    Text(
                      'Welcome User,',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Thank you for your Service",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: const <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              onPressed: null,
            )
          ]),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(color: Color(0xFFFFFECA)),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  const Text("Money Balance"),
                  const Text(
                    "N15,000",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black),
                        child: const Text(
                          "Breakdown",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.lightGreen),
                        child: const Text(
                          "Withdraw",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, top: 0),
              child: const Text("Stats"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(5.0),
                  height: 145,
                  width: 144.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFEBEBEB),
                  ),
                  child: Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "Completed Betahome",
                          style:
                              TextStyle(color: Color(0xFF575757), fontSize: 14),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "30",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 50),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Refcomp()),
                            );
                          },
                          child: const Text(
                            "See all BetaHome",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  height: 145,
                  width: 144.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFEBEBEB),
                  ),
                  child: Column(
                    children: <Widget>[
                      const Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Registered Betahelp",
                            style: TextStyle(
                                color: Color(0xFF575757), fontSize: 14),
                          )),
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "30",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 50),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Refcomp()),
                            );
                          },
                          child: const Text(
                            "See all BetaHelp",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                    ],
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
