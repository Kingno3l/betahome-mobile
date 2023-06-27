import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class FAQ extends StatelessWidget {
  const FAQ({super.key});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
                """BetaHome.ng is a mobile application that offers a payment plan in installments to let you buy high-quality furniture and other living room items including artwork, wall painting, and more. BetaHelp lets you identify and employ reputable service providers for all your needs. The platform features thousands of reputable, trustworthy, and skilled specialists who strive to improve people's lives by attending to their requirements promptly and at the comfort of their home.\n"""),
            const Text(
              "Is BetaHome.ng Free?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
                'Downloading the BetaHome.ng mobile app and creating an account are both completely free. However, you will be required to pay for each good and service that is provided to you over the platform. You have the option to choose anyone who fits your price range and budget from the wide range of product and service providers that are available.\n'),
            const Text(
              'Is It Better To buy BetaHome.ng Furniture Or from regular furniture vendor?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
                """Purchasing furniture from BetaHome.ng is often far cheaper than purchasing it from a regular furniture vendor. BetaHome.ng doesn't just sell furniture; they also sell value by assisting in the creation of an eco-friendly, livable environment in your home or place of business, as well as through adding value to the surroundings with modern artwork, paintings, and pictures that fit your budget, thereby promoting prominent art and cultures both within and outside the Lagos metropolis.\n\nBecause home is where the heart goes, purchasing furniture from BetaHome.ng will provide you with value that will bring you comfort and enjoyment in a warm and welcoming environment you can call home.\n\nWith our side project called "Buy One! Plant One! Go-Green initiatives" that will be launched and aired on our online radio station, purchasing your furniture from BetaHome.ng automatically helps create awareness about deforestation and its impacts on the eco-system, how it affects our everyday lives as humans. Since 90% of the raw materials for our everyday household items, such as chairs, tables, beds, kitchen cabinets, and wardrobes, are provided by the woods and timber industry. For each BetaHome.ng product purchased, one percent of the proceeds are donated to a radio program that promotes ethical business practices in the wood and timber sector, effective reforestation mechanization, and training for local industry actors. Benefits to health for all parties involved, including local timber farmers who supply the raw materials and customers who buy BetaHome.ng furniture as a byproduct.\n\nTo be honest, finding a furniture store that accepts installment payments is difficult.\n"""),
            const Text(
              'How do I purchase BetaHome.ng products?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
                """When you register to buy any of the products offered on the BetaHome.ng platform, you have the option of paying in full up front or using an installment payment plan of your choice.\n"""),

            const Text(
              'How Does It Work?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
                """1. Choose the Product Package You Prefer:\n2. Sign the sales contract\n3. Select a payment plan\n4. Pay in instalments\n5. Select a shipping date.\n6. BetaHome.ng agents deliver the order and assemble it (between 5–10 working days).\n"""),
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
                    launchUrl(Uri.parse("http://www.betahome.ng/faq"));
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
// Text(
//               "How do I make payment for BetaHome.ng Products?",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Text(
//                 """Every BetaHome.ng product and service must be paid for using the payment gateway offered and approved on the platform. In the case of an instant cash payment, customers or prospects may only make such payments to a "third party" (Beta Ambassador) with BetaHome.ng's prior approval and clearance to handle such payment transactions on the company's behalf.\n"""),

//             Text(
//               'How long does it take to complete payment for any BetaHome.ng Products?',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Text(
//                 """Customers or clients of BetaHome.ng may pay in full at once or over the course of a minimum of one month and a maximum of three months. Customers who pay BetaHome.ng in instalments must pay 80% up advance within two months before the products are delivered and 20% within thirty days after the delivery date.
// \nCustomers and clients can choose from three different payment schedules: daily, weekly, and monthly, depending on their budget for installment payments.\n"""),

//             Text(
//               "How do I become a Beta Ambassador?",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Text(
//                 """By signing up to sell BetaHome.ng products and services you can make money selling BetaHome.ng products at your own convenience even while you work. You can become a "beta ambassador" of BetaHome.ng by using your personality to market and create brand awareness for BetaHome.ng products and services to a prospective buyer/client for a "commission".\n"""),
//             Text(
//               "How do I make money as Beta Ambassador?",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Text(
//                 """You can earn money at your convenience by promoting BetaHome.ng products, and you are able to create a side hustle that will pay you a sizable "commission bonus" only for referring prospects or new customers to BetaHome.ng products using your referral code.\n"""),

//             Text(
//               "What do I need to become a Beta Ambassador?",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Text(
//                 "As a beta ambassador, you must submit certain details that will be used to generate and create an individual profile that includes a referral code, your unique ID for claiming commission for each transaction made through your channel.\n"),

//             Text(
//               "How do I get a referral code?",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Text(
//                 "By completing the Beta Ambassador sign-up form with complete information about yourself, which will be used to create a unique user ID for you to use as a referral code when introducing BetaHome.ng products to potential new clients or customers.\n"),

//             Text(
//               "What do I need to sign up as Beta Ambassador? ",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Text(
//                 """You must enter your name, phone number, bank information, and DOB, BVN, or NIN. Only verified beta ambassadors on the platform will receive the "commission bonus" from BetaHome.ng; any beta ambassador prospects who provide inaccurate or inappropriate information will have their access to the platform suspended. Examples of such information include phone number, date of birth, and bank account information.\n"""),

//             Text(
//               "Will I find all kinds of service providers on BetaHelp?",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Text(
//                 "More than 200 services are presently listed by BetaHelp on the site, and thousands more providers are available to meet a variety of user needs. As more areas are requested by users, updates are frequently made to cover them. To fulfill the expanding user expectations, more service providers (Partners) are joining every day..\n"),

//             Text(
//               "Can I also register as a service provider on BetaHelp?",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Text(
//                 "Yes, as an unskilled worker, technician, merchant, or professional who provides services in exchange for payment. You may quickly create your service profile and payment wallet by registering as a Partner on betahelp. Once that process is complete, you may begin providing services. You can also become a vendor that sells the raw materials required to carry out such services from your business to clients nearby and earn money every day.\n"),

//             Text(
//               "Can I render any kind of service?",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Text(
//                 "With BetaHome.ng, you may help individuals with their daily requirements and find solutions to issues. You are welcome to join Betahelp as a partner if you are able to use your abilities as a person to provide these services that meet these requirements, lending your voice to promote BetaHome.ng as a brand, their products, and services, thereby persuading and convincing new potential customers to buy the products. You can also mentor and guide other people to sell BetaHome.ng products and services as a beta ambassador for a commission bonus while attending to your clients' needs.\n"),

//             Text(
//               "BetaHome.ng is available on all android & iOS devices",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Text(
//                 """If your smartphone is an Android model, go to the Google Play Store and download BetaHome.ng to get started. If you use iOS, don't worry—we've got you covered. Visit the Apple Store and download BetaHome.ng to get started.\n"""),

//             Text(
//               "Can I Choose the Delivery Date and Time?......LINKKKK",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Text(
//                 "Of course, you get to pick the day and hour. Please consult our customer service team by phone or email at help@betahme.ng.\n"), //add link
//             Text(
//               "Do I get a refund if I stop installment payment for a product?",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Text(
//                 "No, you won’t get a refund for payment made into our corporate bank account, because BetaHome.ng is not a financial institution that enable deposit and withdrawal, in the events of customers not able to meet up with deadline date for such payment obligations, BetaHome.ng will in such case revise and revamp the deadline according the clients specific request \n"),

//             Text(
//               "Can I Create My Package?",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Text(
//                 " Yes, you can create a package based on your preference. A customer can customize a special order of more pieces of their choice, color and pattern, price quotation shall be sent to them form BetaHome.ng in regards to the order request. \n"),
            //Haven't find suitable answer? Tell us what you need. add link
          ],
        ),
      ),
    );
  }
}
