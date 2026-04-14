import 'package:flutter/material.dart';

class BirthdayPackagesAshdodView extends StatelessWidget {
  const BirthdayPackagesAshdodView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("ימי הולדת — סניף אשדוד"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _HeaderCard(),
          const SizedBox(height: 24),
          _SectionTitle("מה כוללת החבילה"),
          const SizedBox(height: 12),
          _IncludesList(),
          const SizedBox(height: 24),
          _SectionTitle("בחר חבילה"),
          const SizedBox(height: 12),
          _PackageCard(
            title: "עד 15 משתתפים",
            price: 1490,
            extra: 80,
          ),
          _PackageCard(
            title: "עד 20 משתתפים",
            price: 1890,
            extra: 80,
            altPrice: 2090,
            altLabel: "כולל עוגה ושתייה",
          ),
          _PackageCard(
            title: "עד 30 משתתפים",
            price: 2390,
            extra: 80,
            altPrice: 2590,
            altLabel: "כולל עוגה ושתייה",
          ),
          const SizedBox(height: 24),
          _SectionTitle("אפשרויות נוספות"),
          const SizedBox(height: 12),
          _OptionsList(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "מזל טוב!",
            style: theme.textTheme.headlineMedium?.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "חבילת יום הולדת מקנה כניסה לכל הילדים לארבעה מתחמים:",
            textAlign: TextAlign.right,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          _Bullet("מתחם נינג'ה חוויתי ברמה הגבוהה ביותר בעולם"),
          _Bullet("פארק טרמפולינות הכי גדול באיזור"),
          _Bullet("מתחם ספורט אתגרי עם מדריכים מקצועיים"),
          _Bullet("מתחם נינג'ה לילדים לגיל הרך"),
        ],
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  final String text;
  const _Bullet(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.right,
          ),
        ),
        const Icon(Icons.check_circle, color: Colors.green, size: 20),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _IncludesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = [
      "קבלת פנים ורישום",
      "פעילות חוויתית בארבעת המתחמים",
      "130 דקות פעילות",
      "חדר מסיבות לילדים",
      "הזמנות מעוצבות של נינג'ה סטאר",
      "מתנה לכל משתתף",
    ];

    return Column(
      children: items
          .map((e) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                e,
                textAlign: TextAlign.right,
              ),
            ),
            const Icon(Icons.check, color: Colors.green),
          ],
        ),
      ))
          .toList(),
    );
  }
}

class _PackageCard extends StatelessWidget {
  final String title;
  final int price;
  final int extra;
  final int? altPrice;
  final String? altLabel;

  const _PackageCard({
    required this.title,
    required this.price,
    required this.extra,
    this.altPrice,
    this.altLabel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text("₪$price", style: theme.textTheme.headlineSmall),
            Text("כל משתתף נוסף ₪$extra"),
            if (altPrice != null) ...[
              const SizedBox(height: 8),
              Text(
                "₪$altPrice — $altLabel",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () {
                // TODO: переход к деталям пакета
              },
              child: const Text("בחר חבילה"),
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = [
      "הזמנת פיצה לכל המשתתפים – ₪250",
      "מגשי ירקות / פירות / סושי – ₪250",
      "בלונים מעוצבים – ₪250",
      "עוגת יום הולדת מעוצבת – ₪250",
    ];

    return Column(
      children: items
          .map((e) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(e),
        ),
      ))
          .toList(),
    );
  }
}