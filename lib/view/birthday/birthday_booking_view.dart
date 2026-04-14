import 'package:flutter/material.dart';

class BirthdayBookingView extends StatelessWidget {
  const BirthdayBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "הזמנת יום הולדת",
          textDirection: TextDirection.rtl,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "מגוון החבילות",
            textDirection: TextDirection.rtl,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          _packageCard(
            title: "חבילה עד 15 משתתפים",
            price: "₪1490",
            details: [
              "כל ילד נוסף 80 ₪",
              "כל משתתף מקבל גרביים נגד החלקה במתנה",
              "החבילה כוללת קבלת פנים ורישום, זמן משחק חופשי בכל המתחמים, חדר יום הולדת פרטי, פיצה ושתייה לילדים, וצמידים מעוצבים של נינג’ה סטאר",
            ],
          ),

          _packageCard(
            title: "חבילה עד 20 משתתפים",
            price: "₪1890",
            details: [
              "עד 20 ילדים",
              "שעתיים וחצי פעילות",
              "חדר פרטי",
              "שתייה + חטיפים",
            ],
          ),

          _packageCard(
            title: "חבילה עד 30 משתתפים",
            price: "₪2390",
            details: [
              "עד 30 ילדים",
              "3 שעות פעילות",
              "חדר פרטי מעוצב",
              "מדריך בכיר",
              "מתנה לילד יום ההולדת",
            ],
          ),
        ],
      ),
    );
  }

  Widget _packageCard({
    required String title,
    required String price,
    required List<String> details,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
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
          Text(
            title,
            textDirection: TextDirection.rtl,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            price,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          ...details.map(
                (d) => Text(
              "• $d",
              textDirection: TextDirection.rtl,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            child: const Text("הזמן עכשיו"),
          )
        ],
      ),
    );
  }
}