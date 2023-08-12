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

  static List<CategoriesModel> categoriesItems = [
    CategoriesModel(image: AssetsImages.mobiles, name: 'Phones'),
    CategoriesModel(image: AssetsImages.electronics, name: 'Electronics'),
    CategoriesModel(image: AssetsImages.cosmetics, name: 'Cosmetics'),
    CategoriesModel(image: AssetsImages.shoes, name: 'Shoes'),
    CategoriesModel(image: AssetsImages.book, name: 'Books'),
    CategoriesModel(image: AssetsImages.watch, name: 'Watches'),
    CategoriesModel(image: AssetsImages.pc, name: 'Laptops'),
    CategoriesModel(image: AssetsImages.fashion, name: 'Clothes'),
  ];
}

class CategoriesModel {
  final String name;
  final String image;

  CategoriesModel({required this.image, required this.name});
}
