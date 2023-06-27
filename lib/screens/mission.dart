import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Mission extends StatelessWidget {
  const Mission({super.key});

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
            Text("Our Mission", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            Text("•	We intend to beautify every rural and urban homes within the communities in Nigeria, with Lagos as a flagship of the platform other cities to follow are; Abuja, Port Harcourt, Anambra then Kano state. Everyone’s home desires a touch of nature with a serene environment that feels home to nature because home is where the heart goes after the day's hustles.\n\n•	 We intend to create awareness with Beta Talk which is a daily radio program powered by “Buy One! Plant One! Go-Green initiatives” where every member of the platform can talk about the services they render to humanity every day as a product or services if they wish to communicate with other community members of the platform to share their experiences while they showcase their skills sets, promote their product to other users. Other community members can also interact with you via live chat, live videos online on the app and various social media channels online in real-time.\n\n•	We are dedicated to reforestation initiatives and its impacts on the eco-system, understanding the effects of deforestation on Nigeria’s natural resources how it affects our everyday lives as human, with our pet project called “Buy One! Plant One! Go-Green initiatives” that will be launched and aired on our online radio station. Since woods & timber industry supply 90% of raw materials needed in our everyday furniture and domestic needs ranging from chairs, table, bed, kitchen cabinet, wardrobe, etc. for each BetaHome.ng product sold a percentage of it goes into the radio program to amplify the benefits of Good practice in the wood & Timber industry, proper\n\n•	Our dedication to sustainability, reforestation, and support for local artisans serves as an inspiration for entrepreneurs and businesses both in Nigeria and around the world. Our commitment to championing eco-friendly methods and preserving Nigeria’s cultural heritage through modern furniture manufacturing, reforestation mechanizing and education of local industry players. Health benefits for all involve from the local raw materials timber farmer to the customers purchasing the by-product which is BetaHome.ng.ng furniture exemplifies responsible business practices. The innovative and sustainable approach to contemporary furniture making demonstrates that green practices and profitable businesses can coexist. ")
          ],
        ),
      ),
    );
  }
}



