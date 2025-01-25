import 'package:flutter/material.dart';
import 'package:sca_dchat_app/features/authentication/views/login_screen.dart';
import 'package:sca_dchat_app/features/authentication/views/register_screen.dart';
import 'package:sca_dchat_app/features/home/views/customers_screen.dart';
import 'package:sca_dchat_app/features/home/views/home_screen.dart';
import 'package:sca_dchat_app/features/home/views/inbox_screen.dart';
import 'package:sca_dchat_app/features/home/views/message_screen.dart';


import 'package:flutter/cupertino.dart';
import 'package:sca_dchat_app/features/home/views/settings_screen.dart';
import 'package:sca_dchat_app/shared/notification/app_route_strings.dart';
class AppRouter{
 static final navKey = GlobalKey<NavigatorState>();

    static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteStrings.loginScreen:
        return CupertinoPageRoute(builder: (_) => const LoginScreen());

      case AppRouteStrings.registerScreen:
        return CupertinoPageRoute(builder: (_) => const RegisterScreen());

      case AppRouteStrings.homeScreen:
        return CupertinoPageRoute(builder: (_) => const HomeScreen());

        case AppRouteStrings.customerScreen:
        return CupertinoPageRoute(builder: (_) => const CustomersScreen());

         case AppRouteStrings.inboxScreen:
        return CupertinoPageRoute(builder: (_) =>  InboxScreen(
          arguments: settings.arguments as UsersParams,
          
        ));

        case AppRouteStrings.settingsScreen:
        return CupertinoPageRoute(builder: (_) => SettingsScreen());
        
      case AppRouteStrings.messageScreen:
        return CupertinoPageRoute(
            builder: (_) => MessageScreen(
                  
                ));
      
      default:
        return CupertinoPageRoute(builder: (_) => const LoginScreen());
    }
  }

  static void push(String name, {Object? args}){
    navKey.currentState?.pushNamed(name,  arguments: args);
  }

  static void pushReplace(String name, {Object? args}){
   navKey.currentState?.pushReplacementNamed(name, arguments: args);
  }

  static void pushClear(String name, {Object? args}){
    navKey.currentState?.pushNamedAndRemoveUntil(name, (_)=> false);
  }

  static void pop({Object? args}){
    navKey.currentState?.pop( args);
  }

  static void toastMessage( String text, { bool? isSuccessful }){
    ScaffoldMessenger.of(navKey.currentContext!).showSnackBar(SnackBar(content: Text(text)));
  }

}