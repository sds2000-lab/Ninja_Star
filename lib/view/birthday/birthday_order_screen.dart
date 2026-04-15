import 'package:flutter/material.dart';
import '../home/order_model.dart';

class BirthdayOrderScreen extends StatelessWidget {
  final String title;
  final String price;
  final List<String> details;

  const BirthdayOrderScreen({
    super.key,
    required this.title,
    required this.price,
    required this.details,
  });

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
          Text(
            title,
            textDirection: TextDirection.rtl,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            price,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          const Text(
            "פרטי החבילה:",
            textDirection: TextDirection.rtl,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          ...details.map(
                (d) => Text(
              "• $d",
              textDirection: TextDirection.rtl,
              style: const TextStyle(fontSize: 14),
            ),
          ),

          const SizedBox(height: 30),

          const Text(
            "פרטי המזמין:",
            textDirection: TextDirection.rtl,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          _input("שם מלא"),
          _input("טלפון"),
          _input("תאריך מבוקש"),
          _input("שעת התחלה"),
          _input("הערות נוספות", maxLines: 4),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              final order = BirthdayOrder(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                packageName: title,
                price: price,
                date: DateTime.now(),
                status: "ממתין לאישור",
                userId: "USER123", // позже заменим на реальный ID
              );
              Navigator.pop(context, order);
            },
            child: const Text("שלח הזמנה"),
          )

        ],
      ),
    );
  }

  Widget _input(String label, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 5),
        TextField(
          textDirection: TextDirection.rtl,
          maxLines: maxLines,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
