import 'package:flutter/material.dart';
import 'package:sca_dchat_app/shared/colors.dart';
import 'package:sca_dchat_app/shared/constants.dart';
import 'package:sca_dchat_app/shared/notification/app_route.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key, required this.arguments});

  final UsersParams arguments;

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
TextEditingController messageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(widget.arguments.sendersName,      
            ),
            Text('Active Now', style: style.copyWith(
              color: Colors.grey
            ),)
          ],
        ),
        leading: CircleAvatar(
                    backgroundImage: NetworkImage(widget.arguments.imageUrl),
                  ),
       
      ),
      bottomSheet: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SafeArea(
              child: Container(
                 margin: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (a) =>
                              (a ?? "").length < 2 ? "Inavlid message" : null,
                          controller: messageController,
                          decoration: const InputDecoration(
                            hintText: 'Type a message...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          if(_formKey.currentState?.validate() ?? false){
                            messageController.text;
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
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(height: 17,),
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
              ChatBubble(
                message: 'Hello!, John Araham', 
                isSentByMe: true, 
                time: '10:30 AM'
                ),
                SizedBox(height: 17,),
                ChatBubble(
                  name: widget.arguments.sendersName,
                  img: widget.arguments.imageUrl,
                  message: 'Hello ! Nazrul How are you?',
                   isSentByMe: false,
                    time: '10:30 AM',
          
                    )
            ],
          ),
        )
        ),
    );
  }
}


class UsersParams{

  UsersParams( {
   required this.sendersName, required this.imageUrl,
  });

   final String sendersName;
  final String imageUrl;
}


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