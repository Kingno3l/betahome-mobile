import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            // Text(
            //   "Introduction\n",
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            // Text(
            //   "The Website\n",
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            Text(
              "  • Who We Are\n",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
                """As a Nigerian-based furniture manufacturing company, our commitment lies in advocating reforestation, eco-friendly practices, and support for local artisans. BetaHome.ng is a service-based platform that creates environmentally conscious contemporary furniture helping individuals or corporate organizations decorate their homes or offices, providing state-of-the-art comfortable homes/offices, a place for comfort, rest, and relaxation.\n """),
            Text(
                """We offer all of these services with a well-crafted and organized installment plan, a 90-day payment schedule that meets the needs and preferences of every person or corporate entity. The furniture produced by BetaHome.ng is made by skilled artisans who have received modern technical training.\n"""),
            Text(
                """We offer tidy offices, spotless living spaces, new furniture and fittings at reasonable prices, interior decorations like sculptures and paintings, as well as facelifts and general rebranding. Our goal is to provide clients with high-quality, affordably priced furniture that adheres to contemporary design standards while also having a positive influence on the environment.\n"""),
            Text(
                "Home is frequently chosen as the preferred location to escape the daily commotion. Emphasizing changes and advancements in architectural design, custom living, and interior design will raise everyone's standard of living and business operations.\n"),
            Text(
                "90% of the raw materials required to meet our client’s daily needs are sourced locally, using locally accessible resources like reclaimed wood, bamboo, and recycled plastics. This supports local craftsmen by giving them a platform to showcase their abilities and promote their work. The effectiveness of our efforts is demonstrated by our popularity among environmentally conscious consumers in Nigeria and elsewhere. Only on special orders or a request from clients who want raw materials supplied from outside to meet their particular demand, the company has also won praise for its contribution to sustainable growth in the furniture sector locally.\n"),
            Text(
                "Our app is a very user-friendly platform for our potential client/users and is available for download on the app store. Once the app is downloaded to a device, there are multiple sign-up options including phone number, email, social media handle, or SMS. Equipped with modern technology as the foundation of the products and services we offer, every piece of information user provide on the platform is highly secured on our server.\n"),
            Text(
                "Users must carefully review all of our products, terms & conditions, and choose the package that best meets their needs because each one has a different service functionality.\n\n"),
            Text(
              "Our Services ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
                "Services provided to users or members of the platform turn the app into a one-of-a-kind service center for every person with a technologically enabled real-time opportunity to provide services and subsequently make money.\n\n"),
            Text(
              "About the Platform",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
                "  • We have developed a robust platform that is dedicated to giving every service-oriented individual and every deserving Nigerian who can provide a service with a way to make a living; our platform is a service-powered community that offers a variety of opportunities for every member and supports local artisans by giving them a platform to showcase their abilities and promote their work on the platform."),
                 Row(
              children: [
                Text("For more information,"),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 0,
                    ),
                    fixedSize: Size(20, 10)
                  ),
                  onPressed: () {
                    launchUrl(Uri.parse("http://www.betahome.ng/about-us"));
                  },
                  child: Text(
                    "click here",
                    style: TextStyle(
                      color: Color.fromARGB(255, 90, 149, 251),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
