import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/subtitle_text.dart';
import 'package:salla_users/Features/cart/presentation/views/cart_screen.dart';
import 'package:salla_users/Features/home/presentation/controller/provider/product_provider.dart';
import 'package:salla_users/Features/home/presentation/views/home_screen.dart';
import 'package:salla_users/Features/profile/presentation/views/profile_screen.dart';
import 'package:salla_users/Features/search/presentation/views/search_secreen.dart';

import '../../../cart/presentation/controller/provider/cart_provider.dart';

class RoutScreens extends StatefulWidget {
  const RoutScreens({Key? key}) : super(key: key);

  @override
  State<RoutScreens> createState() => _RoutScreensState();
}

class _RoutScreensState extends State<RoutScreens> {
  bool loading = true;
  Future<void> fetchFCT() async {
    final productsProvider =
        Provider.of<ProductProvider>(context, listen: false);
    try {
      if (loading == true) {
        Future.wait({
          productsProvider.fetchProducts(context),
        });
      }
    } catch (error) {
      print(error.toString());
    } finally {
      loading = false;
    }
  }

  late PageController pageController;
  int currentScreen = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(
      categoryName: null,
    ),
    const CartScreen(),
    ProfileScreen()
  ];
  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: currentScreen,
    );
  }

  @override
  void didChangeDependencies() {
    if (loading) {
      fetchFCT();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        height: kBottomNavigationBarHeight,
        elevation: 2,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedIndex: currentScreen,
        onDestinationSelected: (index) {
          setState(() {
            currentScreen = index;
          });
          pageController.jumpToPage(currentScreen);
        },
        destinations: [
          const NavigationDestination(
            selectedIcon: Icon(IconlyBold.home),
            icon: Icon(IconlyLight.home),
            label: 'Home',
          ),
          const NavigationDestination(
            selectedIcon: Icon(IconlyBold.search),
            icon: Icon(IconlyLight.search),
            label: 'Search',
          ),
          NavigationDestination(
            selectedIcon: const Icon(IconlyBold.bag),
            icon: Badge(
              label: SubtitleTextWidget(
                label: cartProvider.getCart.length.toString(),
                fontSize: 11,
              ),
              child: const Icon(IconlyLight.bag),
            ),
            label: 'Cart',
          ),
          const NavigationDestination(
            selectedIcon: Icon(IconlyBold.profile),
            icon: Icon(IconlyLight.profile),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
