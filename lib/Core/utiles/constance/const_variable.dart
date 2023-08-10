import 'package:flutter/material.dart';
import 'package:salla_users/Core/utiles/constance/assets_images.dart';

class AppConst {
  static Size size(context) {
    Size size = MediaQuery.of(context).size;
    return size;
  }

  static List<String> banners = [
    AssetsImages.banner1,
    AssetsImages.banner2,
  ];
}
