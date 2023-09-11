import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../../../cart/presentation/controller/provider/cart_provider.dart';
import '../../../cart/presentation/views/cart_screen.dart';
import '../../../home/presentation/controller/provider/product_provider.dart';
import '../../../home/presentation/views/home_screen.dart';
import '../../../profile/presentation/views/profile_screen.dart';
import '../../../search/presentation/views/search_secreen.dart';

class RoutScreens extends StatefulWidget {
  static const routName = '/RootScreen';
  const RoutScreens({super.key});

  @override
  State<RoutScreens> createState() => _RoutScreensState();
}

class _RoutScreensState extends State<RoutScreens> {
  late PageController controller;
  int currentScreen = 0;
  bool isLoadingProds = true;
  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(
      categoryName: null,
    ),
    const CartScreen(),
    const ProfileScreen()
  ];
  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: currentScreen,
    );
  }

  Future<void> fetchFCT() async {
    final productsProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    try {
      Future.wait({
        productsProvider.fetchProducts(context),
      });
      Future.wait({
        cartProvider.fetchCart(),
      });
    } catch (error) {
      log(error.toString());
    } finally {
      setState(() {
        isLoadingProds = false;
      });
    }
  }

  @override
  void didChangeDependencies() {
    if (isLoadingProds) {
      fetchFCT();
      //Navigator.pop(context);
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentScreen,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 2,
        height: kBottomNavigationBarHeight,
        onDestinationSelected: (index) {
          setState(() {
            currentScreen = index;
          });
          controller.jumpToPage(currentScreen);
        },
        destinations: [
          const NavigationDestination(
            selectedIcon: Icon(IconlyBold.home),
            icon: Icon(IconlyLight.home),
            label: "Home",
          ),
          const NavigationDestination(
            selectedIcon: Icon(IconlyBold.search),
            icon: Icon(IconlyLight.search),
            label: "Search",
          ),
          NavigationDestination(
            selectedIcon: const Icon(IconlyBold.bag2),
            icon: Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                return Badge(
                  backgroundColor: Colors.blue,
                  label: Text(cartProvider.getCart.length.toString()),
                  child: const Icon(IconlyLight.bag2),
                );
              },
            ),
            label: "Cart",
          ),
          const NavigationDestination(
            selectedIcon: Icon(IconlyBold.profile),
            icon: Icon(IconlyLight.profile),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
