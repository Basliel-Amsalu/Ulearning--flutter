import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/app_blocs.dart';
import 'package:ulearning/app_events.dart';
import 'package:ulearning/app_states.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/bloc_providers.dart';
import 'package:ulearning/pages/register/register.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearning/pages/sign_in/sign_in.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning/pages/welcome/welcome.dart';
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
        providers: AppBlocProviders.allBlocProviders,
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(color: AppColors.primaryText),
                    elevation: 0,
                    backgroundColor: Colors.white)),
            home: const Welcome(),
            routes: {
              "myHomePage": (context) => const MyHomePage(),
              "signin": (context) => const SignIn(),
              "register": (context) => const Register(),
            },
          ),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(child: BlocBuilder<AppBlocs, AppStates>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                "${BlocProvider.of<AppBlocs>(context).state.counter}",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => BlocProvider.of<AppBlocs>(context).add(Increment()),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
    ;
  }
}
