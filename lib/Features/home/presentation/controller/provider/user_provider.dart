import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:salla_users/Core/utiles/constance/app_strings.dart';
import 'package:salla_users/Features/home/data/models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? userModel;
  UserModel? get getUserModel {
    return userModel;
  }

  Future<UserModel?> fetchUserData() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user == null) return null;
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection(AppStrings.userCollection)
          .doc(user.uid)
          .get();
      print(userDoc.data());
      final userDocDict = userDoc.data();
      userModel = UserModel(
        createdAt: userDoc.get('createdAt'),
        userCart:
            userDocDict!.containsKey('userCart') ? userDoc.get('userCart') : [],
        userWishlist: userDocDict.containsKey('userWishlist')
            ? userDoc.get('userWishlist')
            : [],
        userId: userDoc.get('userId'),
        userName: userDoc.get('userName'),
        userImage: userDoc.get('userImage'),
        userEmail: userDoc.get('userEmail'),
      );
      return userModel;
    } on FirebaseException catch (error) {
      throw error.message.toString();
    } catch (error) {
      rethrow;
    }
  }
}
