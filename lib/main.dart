import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ulearning/common/routes/routes.dart';
import 'package:ulearning/common/values/colors.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAWFNfdu2MUPqDVWiF4UtgfFlbqep--o6k",
      appId: "1:592869980729:android:bf4a4ea464b31b6193ebe8",
      messagingSenderId: "592869980729",
      projectId: "ulearning-app-ce95d",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [...AppPages.allBlocProviders(context)],
        // providers: AppBlocProviders.allBlocProviders,
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(color: AppColors.primaryText),
                    elevation: 0,
                    backgroundColor: Colors.white)),
            // home: const Welcome(),
            onGenerateRoute: AppPages.GenerateRouteSettings,
            // initialRoute: "/",
            // routes: {
            //   "myHomePage": (context) => const MyHomePage(),
            //   "signin": (context) => const SignIn(),
            //   "register": (context) => const Register(),
            // },
          ),
        ));
  }
}
