import 'package:flutter/material.dart';
import 'package:sca_dchat_app/features/services/firebase_service.dart';

class AuthProvider extends ChangeNotifier{
  final FirebaseService firebaseService;

  AuthProvider(this.firebaseService);

  bool loading = false;

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

    if(isRegister.register ?? false){
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
      loading = false;
      notifyListeners();
      return (loggedIn: true, error : null);
      
    }else{
      loading = false;
      notifyListeners();
       return (loggedIn: null, error : isLoggedIn.error);
    }
  }
}