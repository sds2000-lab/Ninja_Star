import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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

          // Name
          Center(
            child: Text(
              "שם משתמש",
              style: theme.textTheme.headlineSmall,
            ),
          ),
          const SizedBox(height: 30),

          // Profile options
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
            onTap: () {},
            isDestructive: true,
          ),
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
      child: ListTile(
        leading: Icon(icon, color: isDestructive ? Colors.red : theme.colorScheme.primary),
        title: Text(
          title,
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