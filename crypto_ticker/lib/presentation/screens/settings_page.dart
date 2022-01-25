import 'dart:ui';

import 'package:crypto_ticker/logic/cubits/settings_cubit.dart';
import 'package:flutter/material.dart';

import 'package:crypto_ticker/presentation/shared/background_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String themeValue = 'Dark';
  String currencyValue = 'USD';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          BackgroundWidget(),
          Container(
            height: double.infinity,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 150.0,
                sigmaY: 150.0,
              ),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 70,
                          minHeight: 70,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 40,
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.12),
                      Text(
                        'Settings',
                        style: TextStyle(
                          fontFamily: 'Exo',
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height * 0.5,
                      maxWidth: MediaQuery.of(context).size.width * 0.85,
                    ),
                    child: BlocBuilder<SettingsCubit, SettingsState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Theme',
                                  style: TextStyle(
                                    fontFamily: 'Exo',
                                    fontSize: 25,
                                  ),
                                ),
                                DropdownButton<String>(
                                  value: state.settingsData!['theme'],
                                  icon: const Icon(
                                      Icons.arrow_drop_down_circle_outlined),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Exo'),
                                  underline: Container(
                                    color: Colors.transparent,
                                  ),
                                  onChanged: (String? newValue) {
                                    BlocProvider.of<SettingsCubit>(context)
                                        .updateTheme(newValue!);
                                  },
                                  items: <String>[
                                    'Dark',
                                    'Light',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text('$value '),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Currency',
                                  style: TextStyle(
                                    fontFamily: 'Exo',
                                    fontSize: 25,
                                  ),
                                ),
                                DropdownButton<String>(
                                  value: state.settingsData!['currency'],
                                  icon: const Icon(
                                      Icons.arrow_drop_down_circle_outlined),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Exo'),
                                  underline: Container(
                                    color: Colors.transparent,
                                  ),
                                  onChanged: (String? newValue) {
                                    BlocProvider.of<SettingsCubit>(context)
                                        .updateCurrency(newValue!);
                                  },
                                  items: <String>[
                                    'USD',
                                    'INR',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text('$value '),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Container(
                    constraints: BoxConstraints(
                      minHeight: 60,
                      maxWidth: 250,
                    ),
                    child: Column(
                      // TODO: Create hyperlinks to designer's dribbble.
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Made with ❤ by Yash Tiwari.',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontFamily: 'Exo',
                            ),
                          ),
                        ),
                        Text(
                          'Design inspiration by Risang Kuncoro and Johnny Kyorov.',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'Exo',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
