import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenBar.build(context, "Notifications"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 18,
                        ),
                      ),
                      Positioned(
                        left: 5,
                        child: Container(
                          width: 7,
                          height: 7,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffFF0000),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Lex Murphy requested on of your services"),
                      const Text(
                        "Plumbering",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xffFDD958),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Accept",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                side: BorderSide(color: Colors.grey)),
                            onPressed: () {},
                            child: const Text(
                              "Reject",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "Today at 15:42 PM",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1.5,
              color: Colors.grey.shade300,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 18,
                        ),
                      ),
                      Positioned(
                        left: 5,
                        child: Container(
                          width: 7,
                          height: 7,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffFF0000),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Lex Murphy requested on of your services"),
                      Text(
                        "Plumbering",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Today at 15:42 PM",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1.5,
              color: Colors.grey.shade300,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 18,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Trending",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text("Your post is getting lots of views"),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Yesterday at 15:42 PM",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1.5,
              color: Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }
}
