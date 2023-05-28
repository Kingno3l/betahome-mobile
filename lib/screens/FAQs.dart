import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FAQ extends StatelessWidget {
  const FAQ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 260,
      ),
      child: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                  """BetaHome.ng is a mobile app that helps with an installment payment plan to purchase quality furniture and other living room accessories like artwork, wall painting and lot more, you can also use BetaHelp to find and hire trusted service providers for all your needs. The platform has thousands of trusted, reliable, and experienced professionals who work to make a difference in the lives of people by catering to their needs in a timely manner and within the convenience of their space.\n"""),
              Text(
                "Is BetaHome.ng Free?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  'It’s totally free to download the BetaHome.ng Mobile App and register your account. You will however pay for every product and service rendered to you through the platform. There is an array of product and service providers available, so you have the freedom to pick anyone that suits your price and budget\n'),
              Text(
                'Is It Better To buy BetaHome.ng Furniture Or from regular furniture vendor?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  """Buying furniture from BetaHome.ng is often cheaper than buying from regular furniture vendor, BetaHome.ng don’t just sell furniture they sell value along with furniture that help makes your home or office an eco-friendly habitable environment, beautifying your living and work place with contemporary artwork, painting and pictures that suite your budget, hereby promoting art and cultures of prominent location within and beyond the Lagos metropolis.\n\nBuying your furniture from BetaHome.ng comes with value that gives you comfort and happiness in a conducive environment you call home, because Home is where the heart goes.\n\nBuying your furniture from BetaHome.ng automatically helps create awareness about deforestation and its impacts on the eco-system, how it affects our everyday lives as human, with our pet project called “Buy One! Plant One! Go-Green initiatives” that will be launched and aired on our online radio station. Since woods & timber industry supply 90% of raw materials needed in our everyday furniture and domestic needs ranging from chairs, table, bed, kitchen cabinet, wardrobe, etc. for each BetaHome.ng product sold a percentage of it goes into the radio program to amplify the benefits of Good practice in the wood & Timber industry, proper reforestation mechanizing and education of local industry players. Health benefits for all involve from the local raw materials timber farmer to the customers purchasing the by-product which is BetaHome.ng furniture.\n\nTo be honest, it is challenging to purchase a furniture with installment payment plan around.\n"""),
              Text(
                'How do I purchase BetaHome.ng products?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  """You can purchase and make payments for BetaHome.ng products by outright purchase or an installment payment plan of your choice when you sign up to purchase any of the products listed on BetaHome.ng platform.\n"""),

              Text(
                'How Does It Work?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  """1. Select Preferred Product Package:\n2. Sign contract of sales Agreement\n3. Choose a payment plan\n4. Make Installment Payment\n5. Choose a delivery date\n6. Order is delivered (within 5-10 working days) and assembled by BetaHome.ng Agents\n"""),
              Text(
                "How do I make payment for BetaHome.ng Products?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  "As a customer or clients, you make payment for every BetaHome.ng product and services only through the payment gateway provided and approved on the platform, in the events of instant cash payment customers/prospect shall only pay to a “third party” (Beta Ambassador) on behalf of BetaHome.ng after seeking the consent of BetaHome.ng for approval and clearance to facilities such payment transaction for the company.\n"),

              Text(
                'How long does it take to complete payment for any BetaHome.ng Products?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  """Customers or clients of BetaHome.ng can make outright payment at once or installment payment (minimum of 1 month and maximum of 3months payment period).\nCustomers making installment payment to purchase BetaHome.ng products shall pay 80% upfront to BetaHome.ng within 2months before products will be delivered and 20% within 30days post delivery date.\nCustomers/clients can select a payment options that suite their installment payment budget, Daily, Weekly, and monthly.\n"""),

              Text(
                "How do I become a Beta Ambassador?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  "You can become a “beta ambassador” of BetaHome.ng by using your personality to market and create brand awareness for BetaHome.ng products and services to a prospective buyer/client for a “commission” by signing up to sell BetaHome.ng products and service you can make money selling BetaHome.ng products at your own convenience even while you work.\n"),
              Text(
                "How do I make money as Beta Ambassador?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  " You make money selling BetaHome.ng products at your convenience also you can build a career side-Hustle for yourself earning huge “commission bonus” simply by introducing prospect/new client to purchase betanhome.ng products using your referral code as an ambassador.\n"),

              Text(
                "What do I need to become a Beta Ambassador?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  "You need to provide some specific information that will be use to generate and create a unique profile that comes with a referral code which is your unique ID to claim commission for every sale made through your channel as a beta ambassador.\n"),

              Text(
                "How do I get a referral code?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  "By providing detailed information about yourself on the Beta Ambassador sign up portal which will be use to generate a unique users ID for you, as a referral code that you can share with prospective new client or customer when you introduce them to BetaHome.ng products.\n"),

              Text(
                "What do I need to sign up as Beta Ambassador? ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  "You need to provide your name, phone, bank details, DOB, BVN or NIN. BetaHome.ng shall pay out “commission bonus” only to a verified beta Ambassador on the platform, every beta ambassador information provided by any Beta Ambassador prospect such as phone number, date of birth, bank information, must match the details on their BVN/NIN before they can be verified on the platform, in case of irregular and inappropriate Information provided such beta ambassador shall be suspended from using the platform.\n"),

              Text(
                "Will I find all kinds of service providers on BetaHelp?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  "BetaHelp currently has over 200 listed services on the platform with thousands of providers catering to a wide array of needs for users. Updates are made regularly to cover more grounds as users demand them. Service providers (Partners) also join daily to meet the growing user demands.\n"),

              Text(
                "Can I also register as a service provider on BetaHelp?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  "Yes, as an artisan, technicians, vendor, unskilled and professional that renders services for wages you can. Simply register as a Partner on betahelp and you will be able to set up your service profile, payment wallet in a few minutes. Once you are through with that process, you can start offering services, you can also be a vendor that sell raw materials needed to complete such services from your store to customers around you and earning daily.\n"),

              Text(
                "Can I render any kind of service?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  "BetaHome.ng was designed to give you an opportunity to meet people’s daily needs and solve problems. If you can use your skills as person to render this services that meets these criteria, lending your voice to create awareness about BetaHome.ng as brand, their product  and services, hereby persuading & convincing new prospect/clients to buy the products, you can also mentor and guide other people to sell BetaHome.ng products and services as a beta ambassador for a commission bonus while servicing your client needs, you are welcome as a partner on Betahelp.\n"),

              Text(
                "BetaHome.ng is available on all android & iOS devices",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  """Are you using an android smartphone, we got you covered already, visit google play store and download BetaHome.ng to get started?\nAre you an iOS user, just hang-on we've got you in mind, visit Apple Store, download BetaHome.ng to get started?\n"""),

              Text(
                "Can I Choose the Delivery Date and Time?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  " Of Course, you can choose the date and time. Please coordinate with our Customer Support Team on Telephone or hello@betahme.ng\n"), //add link
              Text(
                "Do I get a refund if I stop installment payment for a product?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  "No, you won’t get a refund for payment made into our corporate bank account, because BetaHome.ng is not a financial institution that enable deposit and withdrawal, in the events of customers not able to meet up with deadline date for such payment obligations, BetaHome.ng will in such case revise and revamp the deadline according the clients specific request \n"),

              Text(
                "Can I Create My Package?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  " Yes, you can create a package based on your preference. A customer can customize a special order of more pieces of their choice, color and pattern, price quotation shall be sent to them form BetaHome.ng in regards to the order request. \n"),
              //Haven't find suitable answer? Tell us what you need. add link
            ],
          ),
        ),
      ),
    );
  }
}
