import 'package:flutter/material.dart';

class Refcomp extends StatelessWidget {
  const Refcomp({super.key});

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
                      'Registered BetaHelp,',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 15,
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Completed Registration",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 15,
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Incompleted Registration",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(color: Color(0x45ADADAD)),
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQhB-L61eBUvtIxmdO5u9bC46yca3ytYY1z8FJulfHdUe4m4CCEFYC0Dx2lmdWFLCetNM&usqp=CAU",
                        height: 100,
                        width: 70,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: Column(
                          children: const <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Text("Adebayo Akinfenwa",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13)),
                            ),
                            SizedBox(
                              height: 28,
                            ),
                            Text(
                              "Carpenter",
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        // ignore: prefer_const_constructors
                        margin: EdgeInsets.only(left: 25),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            Container(
                              child: const Text(
                                "22/07/2022 10:11",
                                style: TextStyle(fontSize: 9),
                              ),
                            ),
                          ],
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
