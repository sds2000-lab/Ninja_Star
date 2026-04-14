import 'package:flutter/material.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("הזמנות שלי"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3, // пример
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: theme.colorScheme.primary.withOpacity(.2),
                child: const Icon(Icons.event),
              ),
              title: Text("הזמנה #${index + 1}"),
              subtitle: const Text("תאריך: 12.04.2026\nסטטוס: הושלם"),
              trailing: const Icon(Icons.chevron_left),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}