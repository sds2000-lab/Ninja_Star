import 'package:flutter/material.dart';
import 'order_model.dart';
import 'order_details_screen.dart';

class MyOrdersScreen extends StatelessWidget {
  final List<BirthdayOrder> orders;

  const MyOrdersScreen({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("הזמנות שלי"),
        centerTitle: true,
      ),
      body: orders.isEmpty
          ? const Center(
        child: Text(
          "אין הזמנות עדיין",
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: theme.colorScheme.primary.withOpacity(.2),
                child: const Icon(Icons.event),
              ),
              title: Text(order.packageName),
              subtitle: Text(
                "תאריך: ${order.date.day}.${order.date.month}.${order.date.year}\n"
                    "סטטוס: ${order.status}",
                textDirection: TextDirection.rtl,
              ),
              trailing: const Icon(Icons.chevron_left),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderDetailsScreen(order: order),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
