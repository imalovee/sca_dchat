import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:sca_dchat_app/features/home/models/chat_model.dart';
import 'package:sca_dchat_app/features/home/models/user_model.dart';
import 'package:sca_dchat_app/features/services/firebase_service.dart';

class ChatProvider extends ChangeNotifier{
  final FirebaseService firebaseService;

  ChatProvider(this.firebaseService);

  bool loading = false;
  UserModel? userModel;

  void setUserModel({required UserModel? model}) async{
    userModel = model;
    userModel ??= await firebaseService.getUser();
  }

  void sendMsg({
    required String message,
  //  required String sendersId,
   required String recieversId,
    }
   
    ) async{
    await firebaseService.sendMessage(
      uid2: recieversId,
      uid1: firebaseService.auth.currentUser?.uid ?? "" ,
      chatModel: ChatModel(
        id: userModel?.uid,
      msg: message,
       time: DateTime.now(),
       lastMsg: message,
       lastMsgTime: DateTime.now()
    ));

    //  imah -arNfBJ3P43fMlrAcg7FzMQSzqv43 t32bder6PzYVVvaj9WETnl3YNR83
    //   arNfBJ3P43fMlrAcg7FzMQSzqv43" t32bder6PzYVVvaj9WETnl3YNR83"- candace

    //   5ysKm5j6vqakoNKKjh3m3lMWQwm2 -greg
    //   JVpDMLeRycVZ7vhUEHKhRFUnJ0r1 -kevin


  }
 Stream<QuerySnapshot<Map<String, dynamic>>> getMsgs({
    required String recieversId
}){
  return  firebaseService.getMessages(
      uid1: recieversId,
      uid2: firebaseService.auth.currentUser?.uid ?? ""
  );
  }
  
}