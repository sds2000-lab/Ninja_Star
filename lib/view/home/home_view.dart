import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/branch/branch_select_view.dart';
import 'package:fluttermvvmtemplate/view/pricing/entrance_pricing_view.dart';
import 'package:fluttermvvmtemplate/view/facilities/facilities_view.dart';
import 'package:fluttermvvmtemplate/view/birthday/birthday_booking_view.dart';
import 'package:fluttermvvmtemplate/view/food/food_packages_view.dart';
import 'package:url_launcher/url_launcher.dart';

import 'profile_screen.dart';
import 'my_orders_screen.dart';
import 'my_coupons_screen.dart';
import 'order_model.dart';
import 'coupon_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _index = 0;

  // Храним заказы и купоны здесь
  final List<BirthdayOrder> userOrders = [];
  final List<CouponModel> userCoupons = [];

  @override
  Widget build(BuildContext context) {
    // ВАЖНО: создаём screens внутри build()
    final screens = [
      _HomeScrollContent(),

      ProfileScreen(
        userName: "משתמש", // или null если не авторизован
        userOrders: userOrders,
        userCoupons: userCoupons,
      ),

      MyOrdersScreen(orders: userOrders),

      MyCouponsScreen(coupons: userCoupons),
    ];

    return Scaffold(
      body: screens[_index],
      bottomNavigationBar: _BottomBar(
        selectedIndex: _index,
        onTap: (i) => setState(() => _index = i),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//   BOTTOM BAR
// ─────────────────────────────────────────────────────────────

class _BottomBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onTap;

  const _BottomBar({
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onTap,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: "בית",
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: "פרופיל",
        ),
        NavigationDestination(
          icon: Icon(Icons.event_outlined),
          selectedIcon: Icon(Icons.event),
          label: "הזמנות שלי",
        ),
        NavigationDestination(
          icon: Icon(Icons.card_giftcard_outlined),
          selectedIcon: Icon(Icons.card_giftcard),
          label: "קופונים שלי",
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
//   HOME MAIN CONTENT (בית)
//   Твой главный экран, полностью внутри HomeView
// ─────────────────────────────────────────────────────────────

class _HomeScrollContent extends StatelessWidget {
  const _HomeScrollContent();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isWide = MediaQuery.of(context).size.width > 600;

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: _Header()),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          const SliverToBoxAdapter(child: _HeroBanner()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          const SliverToBoxAdapter(child: _SectionTitle("פעולות מהירות")),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: _QuickActions(isWide: isWide),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          const SliverToBoxAdapter(child: _SectionTitle("המתקנים שלנו")),
          const SliverToBoxAdapter(child: _FacilitiesCarousel()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          const SliverToBoxAdapter(child: _BirthdayCard()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          const SliverToBoxAdapter(child: _SectionTitle("תפריט הקפטריה")),
          SliverToBoxAdapter(child: _FoodPackages(isWide: isWide)),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          const SliverToBoxAdapter(child: _SectionTitle("דברו איתנו")),
          const SliverToBoxAdapter(child: _ContactSection()),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//   HEADER
// ─────────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Image.asset(
              "asset/logo.png",
              width: 140,
            ),
          ),

          /// Кнопка выбора филиала
          Positioned(
            right: 16,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const BranchSelectView(),
                  ),
                );
              },
              child: Row(
                children: const [
                  Icon(Icons.location_on, color: Color(0xFF1E88E5)),
                  SizedBox(width: 4),
                  Text(
                    "בחירת סניף",
                    style: TextStyle(
                      color: Color(0xFF1E88E5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//   HERO BANNER
// ─────────────────────────────────────────────────────────────

class _HeroBanner extends StatefulWidget {
  const _HeroBanner();

  @override
  State<_HeroBanner> createState() => _HeroBannerState();
}

class _HeroBannerState extends State<_HeroBanner> {
  final _controller = PageController(viewportFraction: 0.9);
  int _current = 0;

  // Названия баннеров
  final _banners = const [
    "Crazy Room - סניף אשדוד",
    "Karaoke Room - סניף רחובות",
    "Bowling - סניף רחובות",
  ];

  // Картинки для каждого баннера
  final _images = const [
    "asset/image/crazy_room.jpg",
    "asset/image/karaoke.jpg",
    "asset/image/bowling.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: _controller,
            itemCount: _banners.length,
            onPageChanged: (i) => setState(() => _current = i),
            itemBuilder: (context, index) {
              final isActive = index == _current;

              return AnimatedScale(
                duration: const Duration(milliseconds: 250),
                scale: isActive ? 1.0 : 0.95,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 250),
                  opacity: isActive ? 1.0 : 0.7,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(_images[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      _banners[index],
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: const [
                          Shadow(
                            color: Colors.black38,
                            blurRadius: 6,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_banners.length, (i) {
            final isActive = i == _current;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              height: 6,
              width: isActive ? 18 : 6,
              decoration: BoxDecoration(
                color: isActive ? Colors.blue : Colors.blue.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
//   QUICK ACTIONS
// ─────────────────────────────────────────────────────────────

class _QuickActions extends StatelessWidget {
  final bool isWide;
  const _QuickActions({required this.isWide});

  @override
  Widget build(BuildContext context) {
    final items = [
      {"icon": "🎉", "title": "הזמנת יום הולדת"},
      {"icon": "🎟️", "title": "מחירון כניסה"},
      {"icon": "🧸", "title": "המתקנים שלנו"},
      {"icon": "🎉", "title": "מתנות לחוגגים"},
    ];

    final crossAxisCount = isWide ? 4 : 2;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final item = items[index];

          return Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            elevation: 2,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                switch (item["title"]) {
                  case "מחירון כניסה":
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EntrancePricingView(),
                      ),
                    );
                    break;

                  case "המתקנים שלנו":
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FacilitiesView(),
                      ),
                    );
                    break;

                  case "הזמנת יום הולדת":
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BirthdayBookingView(),
                      ),
                    );
                    break;

                  case "מתנות לחוגגים":
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FoodPackagesView(),
                      ),
                    );
                    break;
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item["icon"]!,
                    style: const TextStyle(fontSize: 40),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item["title"]!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF212121),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//   FACILITIES
// ─────────────────────────────────────────────────────────────

class _FacilitiesCarousel extends StatelessWidget {
  const _FacilitiesCarousel();

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        "image": "asset/image/facility_whitepool.jpg",
        "title": "ווייט פול",
      },
      {
        "image": "asset/image/facility_bumper.jpg",
        "title": "מכוניות מתנגשות",
      },
      {
        "image": "asset/image/facility_climbing.jpg",
        "title": "קיר טיפוס",
      },
      {
        "image": "asset/image/facility_kids.jpg",
        "title": "מגרש מגודר לילדים",
      },
      {
        "image": "asset/image/facility_foam.jpg",
        "title": "בור קוביות",
      },
      {
        "image": "asset/image/facility_ninja.jpg",
        "title": "נינג'ה פארק",
      },
      {
        "image": "asset/image/facility_trampoline.jpg",
        "title": "מתחם הטרמפולינות",
      },
    ];

    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const FacilitiesView(),
                ),
              );
            },
            child: Container(
              width: 140,
              margin: EdgeInsets.only(left: index == 0 ? 0 : 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                  )
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 7,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: Image.asset(
                        item["image"]!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                        item["title"]!,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//   BIRTHDAY CARD
// ─────────────────────────────────────────────────────────────

class _BirthdayCard extends StatelessWidget {
  const _BirthdayCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.error,
              theme.colorScheme.primary,
            ],
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "חבילות יום הולדת החל מ‑₪1490",
                textDirection: TextDirection.rtl,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BirthdayBookingView(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "לכל החבילות",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  FOOD MENU
// ─────────────────────────────────────────────────────────────
class _FoodPackages extends StatelessWidget {
  final bool isWide;
  const _FoodPackages({required this.isWide});

  @override
  Widget build(BuildContext context) {
    final items = const [
      ("פיצה משפחתית", "₪49"),
      ("פופקורן", "₪15"),
      ("שתייה קלה", "₪10"),
      ("מגש ירקות", "₪39"),
    ];

    // תמונות לכל קטגוריה (לפי סדר)
    final images = const [
      "asset/image/pizza.jpg",
      "asset/image/popcorn.jpg",
      "asset/image/soft_drinks.jpg",
      "asset/image/veg_plate.jpg",
    ];

    final crossAxisCount = isWide ? 4 : 2;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 160 / 180, // מוגדל כדי להכיל תמונה
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          final image = images[index];

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // תמונה
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(
                    image,
                    height: 90,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                // טקסט
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        item.$1,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.$2,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF757575),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//   CONTACT SECTION
// ─────────────────────────────────────────────────────────────

class _ContactSection extends StatelessWidget {
  const _ContactSection();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {"icon": Icons.phone, "label": "טלפון"},
      {"icon": Icons.chat, "label": "וואטסאפ"},
      {"icon": Icons.email, "label": "אימייל"},
      {"icon": Icons.people, "label": "עקבו אחרינו"},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) {
          return Column(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  switch (item["label"]) {
                    case "טלפון":
                      launchUrl(Uri.parse("tel:08-8565537"));
                      break;

                    case "וואטסאפ":
                      launchUrl(Uri.parse(
                          "https://wa.me/972533221496?text=%D7%94%D7%99%D7%99"));
                      break;

                    case "אימייל":
                      launchUrl(Uri.parse("mailto:Halal.ashdod@gmail.com"));
                      break;

                    case "עקבו אחרינו":
                      _showSocialDialog(context);
                      break;
                  }
                },
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                      )
                    ],
                  ),
                  child: Center(
                    child: Icon(item["icon"], size: 32),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item["label"],
                style: const TextStyle(fontSize: 12),
              )
            ],
          );
        }).toList(),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  //   SOCIAL POPUP
  // ─────────────────────────────────────────────────────────────

  void _showSocialDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text(
            "עקבו אחרינו",
            textDirection: TextDirection.rtl,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.video_collection, color: Colors.black),
                title: const Text("TikTok"),
                onTap: () {
                  launchUrl(Uri.parse("https://www.tiktok.com/@ninjastar_israel"));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.purple),
                title: const Text("Instagram"),
                onTap: () {
                  launchUrl(Uri.parse("https://www.instagram.com/ninjastar_israel/"));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.facebook, color: Colors.blue),
                title: const Text("Facebook"),
                onTap: () {
                  launchUrl(Uri.parse("https://www.facebook.com/ninjastar2"));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────
//   BOTTOM BAR
// ─────────────────────────────────────────────────────────────

// ─────────────────────────────────────────────────────────────
//   SECTION TITLE
// ─────────────────────────────────────────────────────────────

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFF212121),
          ),
        ),
      ),
    );
  }
}