import 'package:flutter/material.dart';
import 'package:sca_dchat_app/features/home/views/customers_screen.dart';
import 'package:sca_dchat_app/features/home/views/message_screen.dart';
import 'package:sca_dchat_app/features/home/views/settings_screen.dart';
import 'package:sca_dchat_app/shared/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    int selectedIndex = 0;
  var screens = [
     const MessageScreen(),
     const CustomersScreen(),
     const SettingsScreen(),
  ];
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          unselectedLabelStyle: style.copyWith(
            color: Colors.grey
          ),
          //selectedLabelStyle: const TextStyle(color: Colors.green),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.chat, ),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_outlined, ),
              label: 'Customers',
            ),
            
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, ),
              label: 'Settings',
            )
          ]),
    );
  }
}