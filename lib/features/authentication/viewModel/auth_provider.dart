import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sca_dchat_app/features/home/models/user_model.dart';
import 'package:sca_dchat_app/features/services/firebase_service.dart';

class AuthProvider extends ChangeNotifier{
  final FirebaseService firebaseService;

  AuthProvider(this.firebaseService);

  UserModel? userModel;
  bool loading = false;

  List<UserModel> allUsers = [];

  Future<({bool? registered, String? error})> register({
    required String firstName,
  required String lastName,
  required String email,
  required String password
  })async{
    loading = true;
    notifyListeners();
    final isRegister =  await firebaseService.registerUser(firstName: firstName, 
    lastName: lastName, 
    email: email, 
    password: password);

    if(isRegister.registered ?? false){
      loading = false;
      notifyListeners();
      return (registered: true, error : null);
      
    }else{
      loading = false;
      notifyListeners();
       return (registered: null, error : isRegister.error);
    }
  }

   Future<({bool? loggedIn, String? error})> login({
    
  required String email,
  required String password
  })async{
    loading = true;
    notifyListeners();
    final isLoggedIn =  await firebaseService.loginUser(email: email, password: password);

    if(isLoggedIn.login ?? false){
      await fetchUserData();
      await fetchAllUsers();
      loading = false;
      notifyListeners();
      return (loggedIn: true, error : null);
      
    }else{
      loading = false;
      notifyListeners();
       return (loggedIn: null, error : isLoggedIn.error);
    }
  }

  Future<void> fetchUserData()async{
    try {
    final users = await firebaseService.getUser();
    if (users != null) {
      userModel = users;
      notifyListeners();
    } else {
      print('User data not found');
    }
  } catch (e) {
    print('Error fetching user data: $e');
  }
  }


  Future<void> fetchAllUsers()async{
    try {
      final currentUserId = FirebaseAuth.instance.currentUser?.uid;
      if (currentUserId == null) {
        print('No current user found.');
        return;
      }
       final getUsers = await firebaseService.getAllUsers(currentUserId);
       if (getUsers.isNotEmpty) {
        allUsers = getUsers;
        notifyListeners();
       }
    } catch (e) {
       print('Error fetching all users: $e');
    }
   

  }
  //  void setUserModel(UserModel? model) async {
  //   userModel = model;
  //   userModel ??= await firebaseService.getUser();
  // }
}