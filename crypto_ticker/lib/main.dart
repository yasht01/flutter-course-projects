import 'package:crypto_ticker/logic/cubits/coin_cubit.dart';
import 'package:crypto_ticker/logic/cubits/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/onboarding_page.dart';
import 'presentation/screens/home_page.dart';
import 'presentation/screens/settings_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CoinCubit()..getCoinData('BTC', 'USD'),
        ),
        BlocProvider(
          create: (context) => SettingsCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        initialRoute: '/init',
        routes: {
          '/home': (context) => HomePage(),
          '/init': (context) => InitPage(),
          '/settings': (context) => SettingsPage(),
        },
      ),
    );
  }
}
