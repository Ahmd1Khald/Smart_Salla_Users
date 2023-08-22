import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  final String userId;
  final String userName;
  final String userImage;
  final String userEmail;
  final Timestamp createdAt;
  final List userCart;
  final List userWishlist;

  UserModel({
    required this.createdAt,
    required this.userCart,
    required this.userWishlist,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.userEmail,
  });
}
