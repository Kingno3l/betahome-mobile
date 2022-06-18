import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _tabIndex = 0;
  static final List _data = [
    {
      'package_name': 'Beta Basic',
      'items': [
        {
          'title': '2-Sitter chairs',
          'description': 'Select the best furniture for your apartment',
          'picture':
              'https://cdn.vox-cdn.com/thumbor/teCEQIxlj9RbCj6P_vlwMopAptQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/11545893/House_Calls_Brooklyn_Zames_Williams_living_room_2_Matthew_Williams.jpg'
        },
        {
          'title': 'Single Sitter chair',
          'description': 'Select the best furniture for your apartment',
          'picture':
              'https://ksassets.timeincuk.net/wp/uploads/sites/56/2021/07/Dining-room.jpg'
        },
      ]
    }
  ];

  void _onTabSelected(index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: true,
        toolbarHeight: 120,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xffD9D9D9), width: 1.5),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () => _onTabSelected(0),
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            backgroundColor: _tabIndex == 0
                                ? const Color(0xffFFF6D6)
                                : const Color(0xffFAFAFA)),
                        child: const Text(
                          'BetaHome Furniture',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Color(0xff2F2E41), fontSize: 12),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () => _onTabSelected(1),
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            backgroundColor: _tabIndex == 1
                                ? const Color(0xffFFF6D6)
                                : const Color(0xffFAFAFA)),
                        child: const Text(
                          'BetaOffice Furniture',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Color(0xff2F2E41), fontSize: 12),
                        ),
                      )),
                ],
              ),
            ),
            _tabIndex == 0 ? BetaHome() : BetaOffice(),
          ]),
    );
  }
}

class BetaHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Beta Home');
  }
}

class BetaOffice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Beta Office');
  }
}
