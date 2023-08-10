import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Features/profile/presentation/views/widgets/custom_listtile.dart';
import 'package:salla_users/Features/profile/presentation/views/widgets/logout_button.dart';
import 'package:salla_users/Features/profile/presentation/views/widgets/please_text.dart';

import '../../../../Core/providers/theme_provider.dart';
import '../../../../Core/root_manager.dart';
import '../../../../Core/utiles/constance/assets_images.dart';
import '../../../../Core/utiles/constance/text_styles/subtitle_text.dart';
import '../../../../Core/utiles/constance/text_styles/title_text.dart';
import '../../../../Core/utiles/widgets/shimmer_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: shimmerAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Visibility(
                visible: true,
                child: PleaseText(),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).cardColor,
                        border: Border.all(
                            color: Theme.of(context).colorScheme.background,
                            width: 3),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: FancyShimmerImage(
                          imageUrl:
                              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitlesTextWidget(label: "Ahmed"),
                        SubtitleTextWidget(label: "Ahmed@gmail.com"),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitlesTextWidget(label: "General"),
                    CustomListTile(
                      imagePath: AssetsImages.orderSvg,
                      text: "All orders",
                      function: () {},
                    ),
                    CustomListTile(
                      imagePath: AssetsImages.wishlistSvg,
                      text: "Wishlist",
                      function: () {
                        Navigator.pushNamed(context, Routes.wishListRoute);
                      },
                    ),
                    CustomListTile(
                      imagePath: AssetsImages.recent,
                      text: "Viewed recently",
                      function: () {
                        Navigator.pushNamed(
                            context, Routes.viewedRecentlyRoute);
                      },
                    ),
                    CustomListTile(
                      imagePath: AssetsImages.address,
                      text: "Address",
                      function: () {},
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const TitlesTextWidget(label: "Settings"),
                    const SizedBox(
                      height: 7,
                    ),
                    SwitchListTile(
                      secondary: Image.asset(
                        AssetsImages.theme,
                        height: 30,
                      ),
                      title: Text(themeProvider.getIsDarkTheme
                          ? "Dark mode"
                          : "Light mode"),
                      value: themeProvider.getIsDarkTheme,
                      onChanged: (value) {
                        themeProvider.setIsDarkTheme(themeValue: value);
                      },
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                  ],
                ),
              ),
              LogOutButton(
                function: () {},
              )
            ],
          ),
        ));
  }
}
