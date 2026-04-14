import 'package:flutter/material.dart';

class MyCouponsScreen extends StatelessWidget {
  const MyCouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("קופונים שלי"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _CouponCard(
            title: "10% הנחה",
            description: "קופון למימוש בקפטריה",
            qrData: "COUPON-10-OFF",
          ),
          _CouponCard(
            title: "כניסה חינם",
            description: "למתקן אחד לבחירה",
            qrData: "FREE-ENTRY",
          ),
        ],
      ),
    );
  }
}

class _CouponCard extends StatelessWidget {
  final String title;
  final String description;
  final String qrData;

  const _CouponCard({
    required this.title,
    required this.description,
    required this.qrData,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.titleLarge),
            const SizedBox(height: 6),
            Text(description),
            const SizedBox(height: 16),

            // QR placeholder
            Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                border: Border.all(color: theme.colorScheme.primary, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(Icons.qr_code, size: 80),
              ),
            ),

            const SizedBox(height: 12),
            Text("קוד: $qrData"),
          ],
        ),
      ),
    );
  }
}