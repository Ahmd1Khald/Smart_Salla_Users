import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Core/utiles/app_functions.dart';
import 'package:salla_users/Core/utiles/widgets/shimmer_appbar.dart';
import 'package:salla_users/Features/auth/presentation/views/login_screen.dart';
import 'package:salla_users/Features/profile/presentation/views/orders_screen.dart';
import 'package:salla_users/Features/profile/presentation/views/viewed_recently_screen.dart';
import 'package:salla_users/Features/profile/presentation/views/wish_list_screen.dart';

import '../../../../Core/providers/theme_provider.dart';
import '../../../../Core/utiles/constance/assets_images.dart';
import '../../../../Core/utiles/constance/text_styles/subtitle_text.dart';
import '../../../../Core/utiles/constance/text_styles/title_text.dart';
import '../../../../Core/utiles/widgets/my_app_method.dart';
import '../../../home/data/models/user_model.dart';
import '../../../home/presentation/controller/provider/user_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  User? user = FirebaseAuth.instance.currentUser;
  bool _isLoading = true;
  UserModel? userModel;
  final GoogleSignIn gSignIn = GoogleSignIn();

  Future<void> fetchUserInfo() async {
    if (user == null) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      userModel = await userProvider.fetchUserInfo();
    } catch (error) {
      await MyAppMethods.showErrorORWarningDialog(
        context: context,
        subtitle: "An error has been occured $error",
        fct: () {},
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    fetchUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: shimmerAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: user == null ? true : false,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: TitlesTextWidget(
                    label: "Please login to have ultimate access"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            userModel == null
                ? const SizedBox.shrink()
                : Padding(
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
                            image: DecorationImage(
                              image: NetworkImage(
                                userModel!.userImage,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitlesTextWidget(label: userModel!.userName),
                            SubtitleTextWidget(
                              label: userModel!.userEmail,
                              fontSize: 15,
                            ),
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
                  user == null
                      ? const SizedBox.shrink()
                      : CustomListTile(
                          imagePath: AssetsImages.orderSvg,
                          text: "All orders",
                          function: () async {
                            await AppFunction.pushTo(
                                context, const OrdersScreen());
                          },
                        ),
                  user == null
                      ? const SizedBox.shrink()
                      : CustomListTile(
                          imagePath: AssetsImages.wishlistSvg,
                          text: "Wishlist",
                          function: () async {
                            await AppFunction.pushTo(
                                context, const WishListScreen());
                          },
                        ),
                  CustomListTile(
                    imagePath: AssetsImages.recent,
                    text: "Viewed recently",
                    function: () async {
                      await AppFunction.pushTo(
                          context, const ViewedRecentlyScreen());
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
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                  ),
                ),
                icon: Icon(user == null ? Icons.login : Icons.logout),
                label: Text(
                  user == null ? "Login" : "Logout",
                ),
                onPressed: () async {
                  if (user == null) {
                    await AppFunction.pushAndRemove(
                        context, const LoginScreen());
                  } else {
                    await MyAppMethods.showErrorORWarningDialog(
                      context: context,
                      subtitle: "Are you sure?",
                      fct: () async {
                        await FirebaseAuth.instance.signOut();
                        await gSignIn.signOut();
                        if (!mounted) return;
                        await AppFunction.pushAndRemove(
                            context, const LoginScreen());
                      },
                      isError: false,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.function});
  final String imagePath, text;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      leading: Image.asset(
        imagePath,
        height: 30,
      ),
      title: SubtitleTextWidget(label: text),
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}
