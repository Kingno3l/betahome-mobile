import 'package:flutter/material.dart';


class ProductCategoryHeader extends StatelessWidget {
  const ProductCategoryHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: 400,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        height: 120,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.4), BlendMode.darken),
                          image: const AssetImage("lib/assets/imgs/remove.png"),
                          fit: BoxFit.cover),
                    ),
                    child: const Center(
                      child: Text(
                        "Basic",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.4), BlendMode.darken),
                          image: const AssetImage("lib/assets/imgs/remove2.png"),
                          fit: BoxFit.cover),
                    ),
                    child: const Center(
                      child: Text(
                        "Combo",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.4), BlendMode.darken),
                          image: const AssetImage("lib/assets/imgs/remove.png"),
                          fit: BoxFit.cover),
                    ),
                    child: const Center(
                      child: Text(
                        "Pro",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.4), BlendMode.darken),
                          image: const AssetImage("lib/assets/imgs/remove2.png"),
                          fit: BoxFit.cover),
                    ),
                    child: const Center(
                      child: Text(
                        "Pro-Max",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.4), BlendMode.darken),
                          image: const AssetImage("lib/assets/imgs/remove.png"),
                          fit: BoxFit.cover),
                    ),
                    child: const Center(
                      child: Text(
                        "Premium",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.4), BlendMode.darken),
                          image: const AssetImage("lib/assets/imgs/remove2.png"),
                          fit: BoxFit.cover),
                    ),
                    child: const Center(
                      child: Text(
                        "Royal",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}