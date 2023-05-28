import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding:  EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height/3.4,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                "Introduction\n",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "The Website\n",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "  •	Landing page\n",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  """BetaHome.ng is a service-based platform that creates environmentally conscious contemporary furniture helping individual/ corporate organizations decorate their homes or offices, providing state of the art comfortable homes/offices, a place for comfort, rest and relaxation, as a Nigerian-based furniture manufacturing company, our commitment lies in advocating reforestation, eco-friendly practices, and support for local artisans.\n """),
              Text(
                  """Home is often the go-to place to get away from the hustle and bustle of everyday life. Highlighting changes and developments around interior aesthetics, structural design and customized living, improving the standard of living and doing business of every individual/corporate organization.\n"""),
              Text(
                  """We provide clean living rooms, neat office space, affordable home appliances, new furniture and fitting, interior decorations, sculptures, artwork, drawing and painting, house/office wall repainting, facelift and general rebranding and redesigning of homes/offices outlook in respective of your income and earnings, Our vision is to create a positive environmental impact while offering customers reasonably priced, high-quality furniture that aligns with current design standards.\n"""),
              Text(
                  "We provide all these services with a well-tailored and structured installment plan, a 90days payment system that suits every individual/corporate organization need and wants.\n\n"),
              //   Text(textAlign: TextAlign.center,
              //       "  Beta Home.ng is established in Nigeria. With its quality in homes and office space decorations, remodeling, rebranding with basic artwork and designs that are embedded in our culture to create a conducive living/working environment for our prospective clients, with our excellent service concept, our app has taken its place in the sector, proffer a platform that provides solutions to the everyday needs of Nigerian home/office better OUTLOOK, with a flexible product plan and a well-tailored installment payment structure. With our experience in professional in-home/office design. We make great Nigerian projects promoting and preserving Nigeria’s rich heritage and cultural traditions while incorporating contemporary design elements with interior architects.  Home/Office plan design and home, office furniture supplier.  Factory wholesale home & office desks and chairs. The furniture created by Beta Home.ng furniture’s is crafted by adept artisans trained in modern techniques.\•	90% of the raw materials needed to service our user’s everyday needs are sourced locally, utilizing locally available resources, such as reclaimed wood, bamboo, and recycled plastics, thereby creating hundreds of domestic & international indirect job opportunities for every party involved, devoted to backing local craftsmen by giving them a platform to display their skills and promote their work. Our popularity among eco-aware consumers in Nigeria and beyond highlights the success of our efforts. The company has also received accolades for its contribution to sustainable growth in the furniture sector locally, only on special orders or a request from the clients that want foreign-sourced raw material to service their specific need. \•	Equipped with modern-day Technology as the bedrock of the products and services we offer, every information users provide on the platform is highly secured on our server, our app is a very easy to use platform for our prospective client/users which is downloadable on the app store, with multiple signs up options either via, phone number, E-mail, Social Media handle or SMS once the app is downloaded to a device.\•	To enjoy the benefits of the platform, users need to carefully go through all our products, terms & conditions, select the package that best suits their needs, with each having its unique service functionality. ")
              Text(
                "About Us",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  "  •	Beta Home.ng is established in Nigeria. With its quality in homes and office space decorations, remodeling, rebranding with basic artwork and designs that are embedded in our culture to create a conducive living/working environment for our prospective clients, with our excellent service concept, our app has taken its place in the sector, proffer a platform that provides solutions to the everyday needs of Nigerian home/office better OUTLOOK, with a flexible product plan and a well-tailored installment payment structure. With our experience in professional in-home/office design. We make great Nigerian projects promoting and preserving Nigeria’s rich heritage and cultural traditions while incorporating contemporary design elements with interior architects.  Home/Office plan design and home, office furniture supplier.  Factory wholesale home & office desks and chairs. The furniture created by Beta Home.ng furniture’s is crafted by adept artisans trained in modern techniques.\n"),
              Text(
                  """  •	90% of the raw materials needed to service our user’s everyday needs are sourced locally, utilizing locally available resources, such as reclaimed wood, bamboo, and recycled plastics, thereby creating hundreds of domestic & international indirect job opportunities for every party involved, devoted to backing local craftsmen by giving them a platform to display their skills and promote their work. Our popularity among eco-aware consumers in Nigeria and beyond highlights the success of our efforts. The company has also received accolades for its contribution to sustainable growth in the furniture sector locally, only on special orders or a request from the clients that want foreign-sourced raw material to service their specific need.\n"""),

              Text(
                  """  •	Equipped with modern-day Technology as the bedrock of the products and services we offer, every information users provide on the platform is highly secured on our server, our app is a very easy to use platform for our prospective client/users which is downloadable on the app store, with multiple signs up options either via, phone number, E-mail, Social Media handle or SMS once the app is downloaded to a device. \n"""),
              Text(
                  "  •	To enjoy the benefits of the platform, users need to carefully go through all our products, terms & conditions, select the package that best suits their needs, with each having its unique service functionality.\n\n"),
              Text(
                "Our Services ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  "Services rendered to users, or members of the platform makes the app a unique service-hub for every human with a technologically empowered real-time opportunity to render services and then earn an income.\n\n"),
              Text(
                "About the Platform",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  "  •	We have created a robust platform that is committed to provide a means of earning a living for every service-oriented person and every well meaningful Nigerians who can render a service; our platform is a service-powered community that provides diversifies opportunities for every member also backing local craftsmen by giving them a platform to display their skills and promote their work on the platform.  We are also dedicated to reforestation initiatives, understanding the effects of deforestation on Nigeria’s natural resources. By using only sustainably sourced materials, BetaHome.ng significantly reduces its environmental footprint."),
            ],
          ),
        ),
      ),
    );
  }
}
