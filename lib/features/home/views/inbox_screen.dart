
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sca_dchat_app/features/authentication/viewModel/auth_provider.dart';
import 'package:sca_dchat_app/features/home/models/chat_model.dart';
import 'package:sca_dchat_app/features/home/models/user_model.dart';
import 'package:sca_dchat_app/features/home/viewModel/chat_provider.dart';
import 'package:sca_dchat_app/features/services/firebase_service.dart';
import 'package:sca_dchat_app/shared/colors.dart';
import 'package:sca_dchat_app/shared/constants.dart';
import 'package:sca_dchat_app/shared/notification/app_route.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key,  this.selectedUser});

  // final UsersParams arguments;
 final UserModel? selectedUser;

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  
TextEditingController messageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState(){
    WidgetsBinding.instance.addPostFrameCallback((_){
      return context.read<ChatProvider>().setUserModel(
        model: context.read<AuthProvider>().userModel);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 25,
                    backgroundImage: NetworkImage(widget.selectedUser?.img ?? ""),
                  ),
                  SizedBox(width: 8,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.selectedUser?.firstNamae ?? "",      
                ),
                Text('Active Now', style: style.copyWith(
                  color: Colors.grey
                ),)
              ],
            ),
          ],
        ),
        
       
      ),
      bottomSheet: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SafeArea(
              child: Container(
                 margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                    //border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (a) =>
                              (a ?? "").length < 2 ? "Inavlid message" : null,
                          controller: messageController,
                          decoration: InputDecoration(
                            hintText: 'Write your message...',
                             focusedBorder: OutlineInputBorder(
           borderSide: const BorderSide(
            color: AppColors.appColor,
          ),
          borderRadius: BorderRadius.circular(8),
       
        ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          if(_formKey.currentState?.validate() ?? false){
                            context.read<ChatProvider>().sendMsg(
                              
                              recieversId: widget.selectedUser?.uid ?? "",
                              message: messageController.text);
                            messageController.clear();
                          }
                        },
                         icon: Icon(Icons.send))
                    ],
                  ),
              ))
          ],
        ),
      ) ,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.fromLTRB(18, 18, 18, 60.h),
          child: Column(
            children: [
              SizedBox(height: 27.h,),
              Container(
                padding:  const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: AppColors.blueGrey,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Text('Today', style: style.copyWith(
                  fontWeight: FontWeight.w500
                ),),
              ),
              SizedBox(height: 17,),
              StreamBuilder(
                  stream: context.read<ChatProvider>().getMsgs(
                      recieversId: widget.selectedUser?.uid ?? ""),
                  builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator(),);
                    } else if(snapshot.hasError){
                      return  SizedBox(
                          height: 200.h,
                          child: Center(
                              child: Text("Can not fetch messages now")));
                    } else if((snapshot.data?.size ?? 0) < 1 ){
                      return const SizedBox(
                          height: 200,
                          child: Center(child: Text("No messages yet")));
                    }
                    final listofChats = snapshot.data?.docs ?? [];
                    final chats = List<ChatModel>.from(
                        listofChats.map((e)=> ChatModel.fromJson(e.data())
                        )
                    );

                     chats.sort((a, b)=> (b.time ?? DateTime.now())
                     .compareTo(a.time ?? DateTime.now())
                     
                     );
                    return Expanded(
                      child: ListView.builder(
                          itemCount: chats.length,
                          reverse: true,
                        itemBuilder: (context, index){
                          final each = chats[index];
                      
                          return ChatBubble(
                            name: widget.selectedUser?.firstNamae,
                              img: widget.selectedUser?.img,
                              message: each.msg ?? "",
                              isSentByMe: each.id == context.read<ChatProvider>().userModel?.uid ,
                              time: DateFormat("hh:mm a").format(each.time ?? DateTime.now())
                          );
                      
                      }),
                    );
                 }
                )
            ],
          ),
        )
        ),
    );
  }
}


// class UsersParams{

//   UsersParams( {
//    required this.sendersName, required this.imageUrl,
//   });

//    final String sendersName;
//   final String imageUrl;
// }


class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSentByMe;
  final String time;
  final String? name;
  final String? img;
  const ChatBubble({
    required this.message,
    required this.isSentByMe,
    required this.time, 
    this.name, 
    this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if(!isSentByMe && name != null && img != null)
          Row(
            children: [
              CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(img!),
                ),
                SizedBox(width: 8),
                Text(
                  name!,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: isSentByMe ? AppColors.appColor : AppColors.blueGrey,
              borderRadius: BorderRadius.only(
                topLeft: isSentByMe ? Radius.circular(15) : Radius.zero,
                topRight: isSentByMe ? Radius.zero : Radius.circular(15),
                bottomLeft:  Radius.circular(15) ,
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: isSentByMe ? Colors.white : Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              time,
              //textAlign: TextAlign.end,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}