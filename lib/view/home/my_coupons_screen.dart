import 'package:flutter/material.dart';
import 'coupon_model.dart';

class MyCouponsScreen extends StatelessWidget {
  final List<CouponModel> coupons;

  const MyCouponsScreen({super.key, required this.coupons});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("קופונים שלי"),
        centerTitle: true,
      ),
      body: coupons.isEmpty
          ? const Center(
        child: Text(
          "אין קופונים זמינים",
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: coupons.length,
        itemBuilder: (context, index) {
          final coupon = coupons[index];

          return _CouponCard(coupon: coupon);
        },
      ),
    );
  }
}

class _CouponCard extends StatelessWidget {
  final CouponModel coupon;

  const _CouponCard({required this.coupon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              coupon.title,
              textDirection: TextDirection.rtl,
              style: theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),

            Text(
              coupon.description,
              textDirection: TextDirection.rtl,
            ),

            const SizedBox(height: 16),

            // QR placeholder
            Center(
              child: Container(
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
            ),

            const SizedBox(height: 12),

            Text(
              "קוד: ${coupon.qrData}",
              textDirection: TextDirection.rtl,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            if (coupon.link != null) ...[
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  // TODO: открыть ссылку
                },
                child: const Text("פתח קישור לקופון"),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
