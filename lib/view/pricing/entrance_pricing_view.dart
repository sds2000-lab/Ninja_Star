import 'package:flutter/material.dart';

class EntrancePricingView extends StatelessWidget {
  const EntrancePricingView({super.key});

  @override
  Widget build(BuildContext context) {
    final prices = [
      ("כניסה לשעתיים לילד - מתחת לגיל 3", "₪50"),
      ("כניסה לשעתיים לילד - מעל גיל 3", "₪70"),
      ("כניסה לשעתיים לילד מעל גיל 3 כולל קיר טיפוס", "₪80"),
      ("כרטיסיה ל-10 כניסות", "₪490"),
      ("כרטיסיה ל-10 ילדים + קיר טיפוס", "₪560"),
      ("מכוניות מתנגשות (בסניף אשדוד)", "₪15"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "מחירון כניסה",
          textDirection: TextDirection.rtl,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ...prices.map((item) => _PriceRow(title: item.$1, price: item.$2)),

          const SizedBox(height: 30),

          // הערות כמו בתמונה
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "• הורה מלווה אינו משלם\n"
                  "• כניסה חובה עם גרביים נגד החלקה\n"
                  "(ניתן לרכוש בקופות – גרביים)",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String title;
  final String price;

  const _PriceRow({required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          // Цена справа
          Text(
            price,
            style: const TextStyle(
              color: Color(0xFF005BBB),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(width: 12),

          // Линия
          Expanded(
            child: Container(
              height: 1.2,
              color: Colors.grey.shade400,
            ),
          ),

          const SizedBox(width: 12),

          // Текст слева
          Expanded(
            flex: 2,
            child: Text(
              title,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}