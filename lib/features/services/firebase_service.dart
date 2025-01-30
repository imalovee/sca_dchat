import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:sca_dchat_app/features/home/models/user_model.dart';
import 'package:sca_dchat_app/shared/constants.dart';

class FirebaseService {
  final auth =  FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

Future<({bool? registered, String? error})> registerUser({
  required String firstName,
  required String lastName,
  required String email,
  required String password
})async{
  try {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    await auth.currentUser?.reload();

       await  firestore.collection('users')
  .doc(auth.currentUser?.uid)
  .set(UserModel(
    firstNamae: firstName,
    lastName: lastName,
    uid: auth.currentUser?.uid,
    img: imgs[Random().nextInt(imgs.length)]
  ).toJson());

  return (registered: true, error: null);
  } on FirebaseAuthException catch(e){
    return (registered: null, error: e.message);
  }
  catch (e) {
    return (registered: null, error: e.toString());
  }
   
}

 Future< UserModel?> getUser()async{
   try {
     final get = await firestore.collection('users').doc(auth.currentUser?.uid).get();
   if (get.exists) {
     return UserModel.fromJson(get.data()!);
   }
   return null;
   } catch (e) {
     return null;
   }
 }

Future <({bool? login, String? error})> loginUser({
  required String email,
  required String password
})async{
  try {
    await auth.signInWithEmailAndPassword(email: email, password: password);
    return (login: true, error: null );
  } on FirebaseAuthException catch(e){
    return (login: null, error: e.message );
  }
  catch (e) {
    return (login: null, error: e.toString() );
  }
}


  Future<List<UserModel>> getAllUsers(String currentUserId)async{
    try {
      final querySnapshot = await firestore.collection('users')
      .where("uid", isNotEqualTo: currentUserId)
          .get();
      return querySnapshot.docs.map((doc){
        return UserModel.fromJson(doc.data());
      }).toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching users: $e');
      }
      return [];
    }
  }
  }