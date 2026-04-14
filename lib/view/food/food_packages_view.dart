import 'package:flutter/material.dart';

class FoodPackagesView extends StatelessWidget {
  const FoodPackagesView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> packages = [
      {
        "title": "מגוון מתנות לבנים ובנות",
        "price": "₪45",
        "image": "asset/image/present45nis.jpg",
        "items": <String>[],
      },
      {
        "title": "מגוון מתנות לבנים ובנות",
        "price": "₪65",
        "image": "asset/image/present65nis.jpg",
        "items": <String>[],
      },
      {
        "title": "מגוון מתנות לבנים ובנות",
        "price": "₪85",
        "image": "asset/image/present85nis.jpg",
        "items": <String>[],
      },
      {
        "title": "מגוון מתנות לבנים ובנות",
        "price": "₪95",
        "image": "asset/image/present95nis.jpg",
        "items": <String>[],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "מתנות לחוגגים",
          textDirection: TextDirection.rtl,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: packages.length,
        itemBuilder: (context, index) {
          final p = packages[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 6),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // ───────────────────────────────
                //   IMAGE
                // ───────────────────────────────
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(
                    p["image"],
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                // ───────────────────────────────
                //   CONTENT
                // ───────────────────────────────
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        p["title"],
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        p["price"],
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),

                      const SizedBox(height: 10),

                      ...List<String>.from(p["items"]).map(
                            (i) => Text(
                          "• $i",
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}