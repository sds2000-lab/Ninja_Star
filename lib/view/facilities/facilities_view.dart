import 'package:flutter/material.dart';

class FacilitiesView extends StatelessWidget {
  const FacilitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    final facilities = [
      ("asset/image/facility_ninja.jpg", "נינג'ה פארק"),
      ("asset/image/facility_bumper.jpg", "מכוניות מתנגשות"),
      ("asset/image/facility_kids.jpg", "מגרש נינג'בורי לילדים"),
      ("asset/image/facility_foam.jpg", "בור הגומי"),
      ("asset/image/facility_trampoline.jpg", "מתחם הטרמפולינות"),
      ("asset/image/facility_whitepool.jpg", "וויט פול"),
      ("asset/image/facility_climbing.jpg", "קיר טיפוס"),
      ("asset/image/karaoke.jpg", "KARAOKE ROOM רחובות"),
      ("asset/image/crazy_room.jpg", "CRAZY ROOM אשדוד"),
      ("asset/image/bowling.jpg", "באולינג רחובות"),

    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "המתקנים שלנו",
          textDirection: TextDirection.rtl,
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: facilities.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          final item = facilities[index];

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                )
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Image.asset(
                      item.$1,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    item.$2,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}