import 'package:flutter/material.dart';
import 'package:sca_dchat_app/features/home/views/customers_screen.dart';
import 'package:sca_dchat_app/features/home/views/home_screen.dart';
import 'package:sca_dchat_app/features/home/views/settings_screen.dart';
import 'package:sca_dchat_app/shared/constants.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  @override
  Widget build(BuildContext context) {

    int selectedIndex = 0;
  var screens = [
     const HomeScreen(),
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