import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class TandC extends StatefulWidget {
  const TandC({
    super.key,
  });

  @override
  State<TandC> createState() => _TandCState();
}

class _TandCState extends State<TandC> {
  ScrollController _scrollController = ScrollController();
  ButtonStyle? declineButtonStyle = TextButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    side: BorderSide(color: Colors.grey.shade400),
  );
  ButtonStyle? acceptButtonStyle = TextButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    side: BorderSide(color: Colors.grey.shade400),
  );
  ButtonStyle? activeStyle = TextButton.styleFrom(
    backgroundColor: Color(0xFFfdd958),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        // Update button style when end of scrollable content is reached
        acceptButtonStyle = activeStyle;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset("lib/assets/svgs/t_and_c.svg"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Terms of Service",
                style: TextStyle(
                    color: Color(0xff273357), fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Update 30/01/2023",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
            ],
          ),
          Container()
        ],
      ),
      content: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //1
            Row(
              children: [
                Text(
                  "1. ",
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
                ),
                Text("TERMS AND CONDITIONS",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400))
              ],
            ),
            Text(
              """BetaHome.ng, a division of Vistawood International Limited, registered at the Corporate Affairs Commission under registration number RC 1887516 ("betahome.ng"), and you have each agreed to abide by the rules of usage of this platform, which are legally binding between you and BetaHome.ng. Do not accept if otherwise.
You and betahome.ng ("Betahome.ng" "we", "our" or "us") are parties to this legal agreement (the "Terms") with respect to the use of the Platform. These Terms will govern your access to and use of our Services, which include our website, the betahome.ng platform, the app store (referred to as "the Platform"), and other associated service providers' related goods and services (collectively referred to as the "Services").
Any agreements or arrangements with you are expressly superseded by these Terms. Betahome.ng reserves the right to immediately terminate these Terms and any Services provided to you, as well as to stop providing the Services or any part of them, at any time and for any reason.
Some Services may have additional conditions that apply, such as rules for a specific event, activity, or campaign. These additional terms will be made known to you in connection with the relevant Services. For the purposes of the relevant Services, supplemental terms are in addition to the Terms and shall be deemed to be a part of them. In the event of a dispute with regard to the relevant Services, supplemental terms shall control.
""",
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
            //2
            Row(
              children: [
                Text(
                  "2. ",
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
                ),
                Text("",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400))
              ],
            ),
            Text(
              """Betahome.ng reserves the right to modify the Terms governing the Services at any time. Changes take effect when betahome.ng posts them here or when they are updated rules or supplemental terms are posted on the relevant service. You agree to be governed by the Terms as revised if you continue to access or use the Services after such posting.""",
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
            //3
            Row(
              children: [
                Text(
                  "3. ",
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
                ),
                Text("ELIGIBILITY",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400))
              ],
            ),
            Text(
              """By registering to use our services, you certify that you are not a person who is prohibited from doing so by the laws of the relevant jurisdiction. You represent and warrant that you are authorized to accept these Terms on behalf of any company, business, or organization on whose behalf you use the Services.""",
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
            //4
            Row(
              children: [
                Text(
                  "4. ",
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
                ),
                Text("AGE RESTRICTION",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400))
              ],
            ),
            Text(
              """People who are 18 years of age and older are the target audience for our services. You must be 18 years of age or older to utilize the Services. We never knowingly work with anyone under the age of 18. Please get in touch with us using the information in these Terms if you learn that your child or ward has given us any information without your permission as a parent or guardian.""",
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
            //5
            Row(
              children: [
                Text(
                  "5. ",
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
                ),
                Text("INTELLECTUAL PROPERTY",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400))
              ],
            ),
            Text(
              """Except as otherwise noted, the intellectual property rights and materials of our Platform are owned by us and/or our licensors and are subject to the license below. The intellectual property rights of our company and/or our licensors and licensees apply to all text, formatting (including without limitation the arrangement of materials on our Platform and the graphics, animation, tools, commercials, music, video, articles, sound, copy, trade names, logos and other materials and information on the Platform, collectively the "Content"). You may or may not have access to any of our intellectual property rights, but we do not offer you any right, license, title, or interest therein.
This content cannot be duplicated, decompiled, disassembled, reverse-engineered, modified, or republished on other platforms. Nothing on our Platform should be taken to imply, expressly or otherwise, that we, or any third party that may own a trademark, are granted any license or right to use any brand displayed on our Platform. You consent to carrying out the necessary steps, such as signing any paperwork required to bolster our intellectual property rights not be able to access.
""",
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
            //6
            Row(
              children: [
                Text(
                  "6. ",
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
                ),
                Text("LICENSE TO USE OUR SERVICES",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400))
              ],
            ),
            Text(
              """Betahome.ng hereby grants you a limited, non-exclusive, revocable, non-transferable license to: (i) access and use the Applications on your personal device solely in connection with your use of the Services; and (ii) access and use any content, information, and related materials that may be made available through the Services, (iii).as part of our Services in the manner permitted by these Terms. This license grant covers any upgrades, new versions, and updates for our Services that you may use, solely for your own personal, noncommercial use.
The copyright, trademark, and other laws of both Nigeria and other countries protect the Services. No provision of these Terms grants you the right to use our name or any of our trademarks, logos, domain names, or other identifying brand characteristics. We and/or our licensors are the only owners of all right, title, and interest in and to the Services, and this will always be the case. You also undertake not to modify, recreate, adapt, exhibit, distribute, translate, disassemble, reverse engineer, or use in any other way.
""",
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
            //7
            Row(
              children: [
                Text(
                  "7. ",
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
                ),
                Text("OUR PRODUCTS",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400))
              ],
            ),
            Text(
              """i.	The Betahome.ng quotation must include the number and description of the Products.
ii.	 Where the Products are supplied in accordance with the Betahome.ng specifications, the Betahome.ng may make any changes to the Products' specifications that do not materially impact their quality or performance in order to comply with any applicable regulations.
iii.	 Images are for illustrative purposes only and may not accurately depict the actual product.
iv.	The products are created with a 90-day flexible installment payment plan on each of our deliverables, allowing a user, client, or customer to sign up or subscribe to buy any of the products. The customer shall establish their credibility by making an advance installment payment or an outright one-time purchase.  When you subscribed to buy the product, you were required to pay 80% of the installment payment plan on or before 60 days. After that, you were required to pay the remaining 20% of the payment within 30 days of the product's delivery date.
v.  Payment plan based on the needs and budget of the customer. Daily, weekly, and monthly payment plans are all available.
vi.  Background checks on clients' payment details and financial verification shall authenticate the    ownership of the products.  
""",
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
            //8 Our Service
            Row(
              children: [
                Text(
                  "8. ",
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
                ),
                Text("OUR SERVICE",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400))
              ],
            ),
            Text(
              """Our platform is a service-powered community that will provide diversified opportunities for every member, providing various value-chain opportunities to sell value as a product or service to earn an income as a reward for the services, as well as connecting artisans. The Service is an enabler robust platform that is committed to providing a means of earning a living for every service-oriented person and every well-meaningful Nigerian who shall render service in return. Users, clients, and customers can do tasks in complete comfort without breaking the bank.""",
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
            //9 PERSONALIZATION
            Row(
              children: [
                Text(
                  "9. ",
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
                ),
                Text("PERSONALIZATION",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400))
              ],
            ),
            Text(
              """For the purposes of these terms and conditions as well as for subsequent usage on the platform, artisans, vendor/sellers, and (Beta Ambassadors) shall be referred to as "service providers" (S.P), whereas parties seeking to purchase a product or of the services of this service providers (S.P) to assist in performing an assignment shall be referred to as "Customers". As a result, both parties will be referred to on the site as "Users" or "You." For the purposes of these Terms of Service, Betahome.ng shall be referred to as "We" or "Betahome.ng.".
"Your Information" means anything that you give the Company or other Users in connection with your registration for and use of the Service, including without restriction anything uploaded or sent for use in Public Areas.
""",
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
            //10 DISCALIMER
            Row(
              children: [
                Text(
                  "10. ",
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
                ),
                Text("DISCLAIMER",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400))
              ],
            ),
            Text(
              """YOU USE OUR PLATFORM AND SERVICES AT YOUR OWN RISK EVEN THOUGH WE WORK HARD TO KEEP THEM SECURE, BUG-FREE, AND ACCESSIBLE AT ALL TIMES.
INCLUDING ANY IMPLIED WARRANTY OR CONDITION OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AVAILABILITY, SECURITY, TITLE, OR NON-INFRINGEMENT OF INTELLECTUAL PROPERTY RIGHTS, WE PROVIDE THE PLATFORM AND THE CONTENT "AS IS" WITHOUT ANY WARRANTY, EXPRESS OR IMPLIED, OF ANY KIND. WE PROVIDE NO WARRANTY THAT OUR PLATFORM WILL WORK, WITHOUT LIMITING THE GENERALITY OF THE AFOREMENTIONED. (i) THAT THE PRODUCTS AND SERVICES WILL CONFORM TO YOUR REQUIREMENTS OR THAT OUR PLATFORM WILL BE 100% FRAUD OR FAIL PROOF, CONTINUE TO BE FREE FROM ANY INTERRUPTION, BUGS, INACCURACIES, AND ERROR FREE. (ii) (BETAHOME.NG) SHALL NOT BE LIABLE FOR ANY OMISSION, REFUSAL TO WORK, LATENESS, OR ANY OTHER DISCREPANCY CAUSED BY THE SERVICE PROVIDERS WHILE COMPLETING THEIR PAID TASKS FOR THE CUSTOMERS. BETAHOME.NG IS JUST A MEANS BY WHICH CUSTOMERS CAN CONNECT TO SERVICE PROVIDERS TO EASE THEIR DAILY STRESSES OF GETTING THINGS DONE, WHETHER PERSONALLY OR IN THEIR RESPECTIVE HOMES. (BETAHOME.NG) IS JUST A WAY FOR SERVICE PROVIDERS TO GET MORE CUSTOMERS TO IMPROVE DAILY LIFEWE WOULD NOT BE LIABLE FOR ANY SERVICE PROVIDERS' FAILURE TO COMPLETE A TASK OR KEEP AN APPOINTMENT. (BETAHOME.NG) WARRANTS THAT IT WILL USE ITS BEST EFFORT TO ENSURE THAT THE SERVICE OPERATES OPTIMALLY AT ALL TIMES IN ACCORDANCE WITH BEST INDUSTRY STANDARD SERVICE. (BETAHOME.NG) IS NOT AN EMPLOYER OF ANY SERVICE PROVIDER WHO HAS WILLFULLY SUBSCRIBED TO THIS.
""",
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
            //external linking
            Row(
              children: [
                Text(
                  "For more information,",
                  style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 0,
                      ),
                      fixedSize: Size(20, 10)),
                  onPressed: () {
                    launchUrl(Uri.parse(
                        "http://www.betahome.ng/terms-and-conditions"));
                  },
                  child: Text(
                    "click here",
                    style: TextStyle(
                      fontSize: 16,
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
      actions: [
        //decline
        TextButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          style: declineButtonStyle,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Decline",
              style: TextStyle(color: Colors.grey.shade500),
            ),
          ),
        ),
        //accept
        TextButton(
          onPressed: acceptButtonStyle == activeStyle
              ? () {
                  // (bool? val) {
                  //   setState(() {
                  //     _isTandC = val!;
                  //   });
                  // };
                  Navigator.pop(context, true);//pass true value for the checkbox
                }
              : null,
          style: acceptButtonStyle,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Accept",
              style: acceptButtonStyle == activeStyle
                  ? const TextStyle(color: Colors.black)
                  : TextStyle(color: Colors.grey.shade500),
            ),
          ),
        )
      ],
    );
  }
}
