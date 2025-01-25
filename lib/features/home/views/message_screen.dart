import 'package:flutter/material.dart';
import 'package:sca_dchat_app/features/home/views/inbox_screen.dart';
import 'package:sca_dchat_app/shared/colors.dart';
import 'package:sca_dchat_app/shared/constants.dart';
import 'package:sca_dchat_app/shared/notification/app_route.dart';
import 'package:sca_dchat_app/shared/notification/app_route_strings.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {

  final List<Map<String, String>> firstNames = [
   {
    'name': 'Max', 
    'image': 'https://plus.unsplash.com/premium_photo-1689539137236-b68e436248de?q=80&w=2971&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
   },
   {
    'name': 'Andi',
    'image': "https://images.unsplash.com/photo-1445053023192-8d45cb66099d?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
   },
   {'name': 'Martins',
   'image': "https://plus.unsplash.com/premium_photo-1664536392896-cd1743f9c02c?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
   },
   {'name': 'Dean',
   'image': "https://plus.unsplash.com/premium_photo-1664536392896-cd1743f9c02c?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
   },
    {
    'name': 'John', 
    'image': 'https://plus.unsplash.com/premium_photo-1689539137236-b68e436248de?q=80&w=2971&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
   },
   {
    'name': "Sam",
    'image': "https://images.unsplash.com/photo-1445053023192-8d45cb66099d?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
   },
   {'name': 'Doe',
   'image': "https://plus.unsplash.com/premium_photo-1664536392896-cd1743f9c02c?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
   },
  ];

   List<Map<String, String>> fullNames = [
      {
    'name': 'Alex Linderson', 
    'image': 'https://plus.unsplash.com/premium_photo-1689539137236-b68e436248de?q=80&w=2971&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
   },
   {
    'name': 'Angel Daya',
    'image': "https://images.unsplash.com/photo-1445053023192-8d45cb66099d?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
   },
   {'name': 'John Araham',
   'image': "https://plus.unsplash.com/premium_photo-1664536392896-cd1743f9c02c?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
   },
   {'name': 'Sabila Sayma',
   'image': "https://plus.unsplash.com/premium_photo-1664536392896-cd1743f9c02c?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
   },
    {
    'name': 'John Borno', 
    'image': 'https://plus.unsplash.com/premium_photo-1689539137236-b68e436248de?q=80&w=2971&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
   },
   {
    'name': "Sam Anderson",
    'image': "https://images.unsplash.com/photo-1445053023192-8d45cb66099d?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
   },
   {'name': 'Doe Jones',
   'image': "https://plus.unsplash.com/premium_photo-1664536392896-cd1743f9c02c?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
   },
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColor,
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        elevation: 0.0,
        leading: Icon(Icons.search, color: Colors.white,),
        centerTitle: true,
        title: Text('Home', style: style.copyWith(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500
        ),),
        actions: [
          CircleAvatar(
           backgroundImage: NetworkImage('https://plus.unsplash.com/premium_photo-1689539137236-b68e436248de?q=80&w=2971&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
          ),
          SizedBox(width: 12,)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                padding: EdgeInsets.all(16),
                scrollDirection: Axis.horizontal,
                itemCount: firstNames.length,
                itemBuilder: (context, index){
                  final name = firstNames[index]['name'];
                  final image = firstNames[index]['image'];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: image != null? NetworkImage(image) : null
                          ),
                          SizedBox(height: 16,),
                          Text(name ?? "max", style: style.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                          ),)
                        ],
                      ),
                      SizedBox(width: 18,)
                    ],
                  );
                }),
            ),
            Container(
             height: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only( 
                  topLeft: const Radius.circular(30),
                    topRight: const Radius.circular(30), )
              ),
              padding: EdgeInsets.fromLTRB(8, 30, 8, 8),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: fullNames.length,
                itemBuilder: (context, index){
                  final fullname = fullNames[index]['name'];
                  final img = fullNames[index]['image'];
                  return ListTile(
                    onTap: (){
                      AppRouter.push(
                        AppRouteStrings.inboxScreen,
                        args: UsersParams(sendersName: fullname!, 
                        imageUrl: img!)
                        );
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: img != null? NetworkImage(img) : null
                    ),
                    title: Text(fullname ?? "", style: style.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w600
                    ),),
                    subtitle: Text('How are you today?', style: style.copyWith(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400
                    ),),
                    trailing: Text('2 mins ago?', style: style.copyWith(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400
                    ),),
                   
                  );
              
                }
                ),
            )
          ],
        ),
      ),
    );
  }
}