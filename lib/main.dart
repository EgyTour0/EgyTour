import 'package:bloc/bloc.dart';
import 'package:egytour/layout/navigation_screen.dart';
import 'package:egytour/shared/bloc_observer.dart';
import 'package:egytour/shared/components/constants.dart';
import 'package:egytour/shared/network/local/cach_helper.dart';
import 'package:egytour/welcome_files/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/cubit/cubit.dart';
import 'layout/cubit/states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  BlocOverrides.runZoned(
    () async {
      // Use cubits...
      await CachHelper.init();
      uId = CachHelper.getData(key: 'uId');
      Widget widget;
      if (uId == null) {
        widget = Splashscreen();
      } else {
        widget = const Navigationbar();
      }
      runApp(MyApp(
        widget: widget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  Widget? widget;
  MyApp({
    Key? key,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SocialCubit()..getUserData(),
        ),
      ],
      child: BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: Themes.light,
            darkTheme: Themes.dark,
            debugShowCheckedModeBanner: false,
            home: Splashscreen(),
          );
        },
      ),
    );
  }
}
