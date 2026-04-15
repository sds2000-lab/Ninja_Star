import 'package:flutter/material.dart';
import 'order_model.dart';

class OrderDetailsScreen extends StatelessWidget {
  final BirthdayOrder order;

  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("פרטי הזמנה"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              order.packageName,
              textDirection: TextDirection.rtl,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Text(
              "מחיר: ${order.price}",
              textDirection: TextDirection.rtl,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),

            Text(
              "תאריך הזמנה: ${order.date.day}.${order.date.month}.${order.date.year}",
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 10),

            Text(
              "סטטוס: ${order.status}",
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {},
              child: const Text("בטל הזמנה"),
            ),
          ],
        ),
      ),
    );
  }
}
