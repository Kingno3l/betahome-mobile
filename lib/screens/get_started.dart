import 'package:beta_home/helper/keys.dart';
import 'package:flutter/material.dart';

import 'package:beta_home/screens/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  List<SliderModel> slides = [];
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    slides = getSlides();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: //CustomScrollView(scrollDirection: Axis.vertical, slivers: [
          // SliverFillRemaining(
          //   SingleChildScrollView(
          // // hasScrollBody: true,
          // child:
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                    child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (value) {
                          setState(() {
                            currentIndex = value;
                          });
                        },
                        itemCount: slides.length,
                        itemBuilder: (context, index) {
                          return Slider(model: slides[index]);
                        })),
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 12),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        slides.length, (index) => buildDot(index, context)),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                height: 60,
                // margin: EdgeInsets.all(40),
                margin: const EdgeInsets.symmetric(vertical: 30),
                // width: double.infinity,
                width: 160,
                // color: const Color(0xFFFFDA58),
                decoration: const BoxDecoration(
                    color: Color(0xFFFFDA58),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(6.0),
                        bottomRight: Radius.circular(6.0))),
                child: TextButton(
                    onPressed: () {
                      // if (currentIndex == slides.length - 1) {
                      _pref.then((SharedPreferences pref) {
                        pref.setBool(Keys.IS_GET_STARTED, true);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Dashboard(),
                          ),
                        );
                      });

                      // }
                      // _controller?.nextPage(
                      //     duration: const Duration(milliseconds: 100),
                      //     curve: Curves.bounceIn);
                    },
                    child: Text(
                        currentIndex == slides.length - 1
                            ? 'Get Started'
                            : 'Get Started',
                        style: const TextStyle(color: Color(0xFF000000)))),
              ),
              Container(
                  transform: Matrix4.translationValues(-25.0, 0.0, 0.0),
                  child: Row(
                    children: const [
                      Image(
                        image: AssetImage('./lib/assets/imgs/arrow-right.png'),
                        height: 8,
                        // width: 60,
                      ),
                      SizedBox(width: 2),
                      Image(
                        image: AssetImage('./lib/assets/imgs/arrow-head.png'),
                        height: 10,
                      ),
                      SizedBox(width: 2),
                      Image(
                        image: AssetImage('./lib/assets/imgs/arrow-head.png'),
                        height: 10,
                      ),
                    ],
                  )),
            ],
          )
        ],
      ),
      // )
      // ])
      // ),
    );
  }

  Container buildDot(index, context) {
    return Container(
      height: 5,
      width: currentIndex == index ? 16 : 5,
      margin: const EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(20),
          color: Color(currentIndex == index ? 0xFF000000 : 0xffC4C4C4)),
    );
  }
}

class Slider extends StatelessWidget {
  SliderModel model;

  Slider({required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image.asset(
        //   './lib/assets/imgs/onboard-1.png',
        //   height: 300,
        //   fit: BoxF
        // ),
        Image(
          image: AssetImage(model.getImgUri()),
          alignment: Alignment.center,
          height: 300,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Container(
          padding: const EdgeInsets.only(top: 12, right: 20, left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text.rich(TextSpan(
              //     style: const TextStyle(
              //         fontSize: 30, fontWeight: FontWeight.w600),
              //     children: [
              //       TextSpan(text: model.getTitle()),
              //       TextSpan(text: model.getTitle2()),
              //       TextSpan(text: model.getTitle3()),
              //     ])),
              Text(model.getTitle(), style: const TextStyle(fontSize: 25)),
              Row(
                children: [
                  Text(model.getTitle2(), style: const TextStyle(fontSize: 25)),
                  Text(' ${model.getTitle3()}',
                      style: const TextStyle(
                          fontSize: 25, color: Color(0xFFFFDA58))),
                ],
              ),
              Text(model.getTitle4(), style: const TextStyle(fontSize: 25)),
              const SizedBox(height: 12),
              Text(model.getSubTitle(),
                  style: const TextStyle(color: Color(0xff8E8E8E)))
            ],
          ),
        )
      ],
    );
  }
}

class SliderModel {
  String title, title2, title3, title4, subTitle, imgUri;

  SliderModel(
      {required this.title,
      required this.title2,
      required this.title3,
      required this.title4,
      required this.subTitle,
      required this.imgUri});

  String getTitle() {
    return title;
  }

  String getTitle2() {
    return title2;
  }

  String getTitle3() {
    return title3;
  }

  String getTitle4() {
    return title4;
  }

  String getSubTitle() {
    return subTitle;
  }

  String getImgUri() {
    return imgUri;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = [];

  slides.add(SliderModel(
      title: 'Choose',
      title2: 'Your',
      title3: 'Elegant',
      title4: 'Interiors',
      subTitle: 'Luxury interiors collection with premium quality',
      imgUri: './lib/assets/imgs/onboard-1.png'));

  slides.add(SliderModel(
      title: 'Select',
      title2: 'Your',
      title3: 'Payment',
      title4: 'Plan',
      subTitle: 'A 90 days well-tailored Installmental payment',
      imgUri: './lib/assets/imgs/onboard-2.png'));

  slides.add(SliderModel(
      title: 'Pay & Enjoy',
      title2: 'Your',
      title3: 'New',
      title4: 'Interior',
      subTitle: 'Enjoy your new interior after paying 80% upfront',
      imgUri: './lib/assets/imgs/onboard-1.png'));

  return slides;
}
