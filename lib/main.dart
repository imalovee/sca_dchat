import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sca_dchat_app/features/authentication/viewModel/auth_provider.dart';
import 'package:sca_dchat_app/features/home/viewModel/chat_provider.dart';
import 'package:sca_dchat_app/features/services/firebase_service.dart';
import 'package:sca_dchat_app/firebase_options.dart';
import 'package:sca_dchat_app/shared/notification/app_route.dart';
import 'package:sca_dchat_app/shared/notification/app_route_strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform); 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final firebaseService = FirebaseService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create:(_)=> AuthProvider(firebaseService)),
        ChangeNotifierProvider<ChatProvider>(create: (_)=> ChatProvider(firebaseService))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
          navigatorKey: AppRouter.navKey,
          initialRoute: AppRouteStrings.registerScreen,
      ),
    );
  }
}

