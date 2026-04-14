import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BranchSelectView extends StatelessWidget {
  const BranchSelectView({super.key});

  @override
  Widget build(BuildContext context) {
    final branches = [
      Branch(
        name: "נינג׳ה סטאר רחובות",
        address: "הסניף נמצא במתחם אמריקן סיטי קומה 2, צמוד להולמס פלייס",
        image: "asset/image/rehovot_top_bunner.jpg",
        openHours: "א׳–ה׳ 10:00–20:00\nו׳ 10:00–16:00\nשבת 10:00–18:30",
        wazeUrl: "https://ul.waze.com/ul?preview_venue_id=22806847.228002934.575211&navigate=yes&utm_campaign=default&utm_source=waze_website&utm_medium=lm_share_location",
      ),
      Branch(
        name: "נינג׳ה סטאר שרונים",
        address: "הסניף נמצא בקומה 1 - שער צהוב",
        image: "asset/image/sharonim_top_bunner.jpg",
        openHours: "א׳–ה׳ 10:00–20:00\nו׳ 10:00–16:00\nשבת 10:00–18:30",
        wazeUrl: "https://ul.waze.com/ul?preview_venue_id=22872385.228723853.4296&navigate=yes&utm_campaign=default&utm_source=waze_website&utm_medium=lm_share_location",
      ),
      Branch(
        name: "נינג׳ה סטאר אשדוד",
        address: "אזור תעשייה עד הלום, קניון בימול, קומה 2",
        image: "asset/image/ashdod_top_bunner.jpg",
        openHours: "א׳–ה׳ 10:00–20:00\nו׳ 10:00–16:00\nשבת 10:00–18:30",
        wazeUrl: "https://ul.waze.com/ul?place=ChIJJcHQl8CiAhURNpDNGYQ4xBk&ll=31.76643590%2C34.66547550&navigate=yes&utm_campaign=default&utm_source=waze_website&utm_medium=lm_share_location",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "בחירת סניף",
          textDirection: TextDirection.rtl,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: branches.length,
        itemBuilder: (context, index) {
          final branch = branches[index];
          return _BranchCard(branch: branch);
        },
      ),
    );
  }
}

class Branch {
  final String name;
  final String address;
  final String image;
  final String openHours;
  final String wazeUrl;

  Branch({
    required this.name,
    required this.address,
    required this.image,
    required this.openHours,
    required this.wazeUrl,
  });
}

class _BranchCard extends StatelessWidget {
  final Branch branch;

  const _BranchCard({required this.branch});

  Future<void> _openNavigation(BuildContext context) async {
    final waze = Uri.parse(branch.wazeUrl);

    final googleMaps = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(branch.address)}",
    );

    // Waze
    if (await canLaunchUrl(waze)) {
      await launchUrl(waze, mode: LaunchMode.externalApplication);
      return;
    }

    // Google Maps
    if (await canLaunchUrl(googleMaps)) {
      await launchUrl(googleMaps, mode: LaunchMode.externalApplication);
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("לא ניתן לפתוח ניווט במכשיר")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            child: Image.asset(
              branch.image,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  branch.name,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        branch.address,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(Icons.location_on, size: 18, color: Colors.blue),
                  ],
                ),

                const SizedBox(height: 6),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "שעות פתיחה: ${branch.openHours}",
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(Icons.access_time, size: 18, color: Colors.orange),
                  ],
                ),

                const SizedBox(height: 16),

                // ✔ оставляем только кнопку ניווט
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () => _openNavigation(context),
                        child: const Text(
                          "ניווט",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}