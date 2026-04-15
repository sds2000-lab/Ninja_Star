import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'register_screen.dart';

import 'my_orders_screen.dart';
import 'order_model.dart';

import 'my_coupons_screen.dart';
import 'coupon_model.dart';

class ProfileScreen extends StatelessWidget {
  final String? userName; // null = не авторизован
  final List<BirthdayOrder> userOrders; // список заказов
  final List<CouponModel> userCoupons; // список купонов

  const ProfileScreen({
    super.key,
    this.userName,
    this.userOrders = const [],
    this.userCoupons = const [],
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isLoggedIn = userName != null;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: const Text("פרופיל"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Avatar
          Center(
            child: CircleAvatar(
              radius: 55,
              backgroundColor: theme.colorScheme.primary.withOpacity(.2),
              child: const Icon(Icons.person, size: 60),
            ),
          ),
          const SizedBox(height: 16),

          // Name or Guest
          Center(
            child: Text(
              isLoggedIn ? userName! : "אורח",
              style: theme.textTheme.headlineSmall,
            ),
          ),
          const SizedBox(height: 30),

          // -------------------- НЕ АВТОРИЗОВАН --------------------
          if (!isLoggedIn) ...[
            _ProfileTile(
              icon: Icons.login,
              title: "התחברות",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
            ),
            _ProfileTile(
              icon: Icons.person_add,
              title: "הרשמה",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RegisterScreen()),
                );
              },
            ),
          ],

          // -------------------- АВТОРИЗОВАН --------------------
          if (isLoggedIn) ...[
            _ProfileTile(
              icon: Icons.list_alt,
              title: "הזמנות שלי",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MyOrdersScreen(orders: userOrders),
                  ),
                );
              },
            ),

            _ProfileTile(
              icon: Icons.card_giftcard,
              title: "קופונים שלי",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MyCouponsScreen(coupons: userCoupons),
                  ),
                );
              },
            ),

            _ProfileTile(
              icon: Icons.settings,
              title: "הגדרות",
              onTap: () {},
            ),
            _ProfileTile(
              icon: Icons.lock,
              title: "שינוי סיסמה",
              onTap: () {},
            ),
            _ProfileTile(
              icon: Icons.info_outline,
              title: "אודות",
              onTap: () {},
            ),

            _ProfileTile(
              icon: Icons.logout,
              title: "התנתקות",
              isDestructive: true,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProfileScreen(
                      userName: null,
                      userOrders: [],
                      userCoupons: [],
                    ),
                  ),
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isDestructive;

  const _ProfileTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(
          icon,
          color: isDestructive ? Colors.red : theme.colorScheme.primary,
        ),
        title: Text(
          title,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: isDestructive ? Colors.red : null,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.chevron_left),
        onTap: onTap,
      ),
    );
  }
}
