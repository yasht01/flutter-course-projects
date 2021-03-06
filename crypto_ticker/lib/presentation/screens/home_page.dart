import 'dart:ui';
import 'package:crypto_ticker/logic/cubits/coin_cubit.dart';
import 'package:crypto_ticker/logic/cubits/settings_cubit.dart';
import 'package:flutter/material.dart';

import 'package:crypto_ticker/presentation/widgets/home_widgets.dart';
import 'package:crypto_ticker/presentation/shared/background_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownValue = 'BTC';
  Map<String, String>? settingsData;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, settingsState) {
        if(settingsState is SettingUpdated) {
          settingsData = settingsState.settingsData!;
          BlocProvider.of<CoinCubit>(context).getCoinData(dropdownValue, settingsData!['currency']!);
        } else if(settingsState is SettingsInitial) {
          settingsData = settingsState.settingsData!;
          print(settingsData);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            BackgroundWidget(),
            Container(
              height: double.infinity,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 300.0,
                  sigmaY: 300.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/settings');
                            },
                            child: Text(
                              'Settings'.toUpperCase(),
                              style: TextStyle(
                                fontFamily: 'Exo',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.black),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                Colors.grey.withOpacity(0.3),
                              ),
                              elevation: MaterialStateProperty.all(20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.03,
                        horizontal: MediaQuery.of(context).size.height * 0.03,
                      ),
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height * 0.09,
                      ),
                      child: BlocBuilder<CoinCubit, CoinState>(
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey.withOpacity(0.35),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                padding: EdgeInsets.all(8),
                                constraints: BoxConstraints(
                                  maxWidth: 70,
                                  maxHeight: 70,
                                ),
                                child: Image.asset(
                                  'assets/images/$dropdownValue.png',
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                  minWidth: 100,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      settingsData == null ? 'USD' : settingsData!['currency']!,
                                      style: TextStyle(
                                        fontFamily: 'Exo',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      state.coinData!.price!.toStringAsFixed(2),
                                      style: TextStyle(
                                        fontFamily: 'Exo',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: state.coinData!.percentChange! > 0
                                      ? Colors.green
                                      : Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.all(5),
                                constraints: BoxConstraints(
                                  minWidth: 80,
                                  minHeight: 30,
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      if (state.coinData!.percentChange! >
                                          0) ...[
                                        Icon(Icons.arrow_upward),
                                        Text(
                                          "${state.coinData!.percentChange!.toStringAsFixed(2)}%",
                                          style: TextStyle(
                                            fontFamily: 'Exo',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ] else ...[
                                        Icon(Icons.arrow_downward),
                                        Text(
                                          "${state.coinData!.percentChange!.toStringAsFixed(2)}%",
                                          style: TextStyle(
                                            fontFamily: 'Exo',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ]
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(22, 20, 20, 20),
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height * 0.45,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(0.35),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: GraphWidget(),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.02,
                        horizontal: MediaQuery.of(context).size.width * 0.08,
                      ),
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height * 0.06,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(0.35),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TimeButton(
                              callback: () {},
                              text: '24H',
                              highlight: true,
                            ),
                            TimeButton(
                              callback: () {},
                              text: '1D',
                              highlight: false,
                            ),
                            TimeButton(
                              callback: () {},
                              text: '1M',
                              highlight: false,
                            ),
                            TimeButton(
                              callback: () {},
                              text: '1Y',
                              highlight: false,
                            ),
                            TimeButton(
                              callback: () {},
                              text: 'All',
                              highlight: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.09,
                            horizontal:
                                MediaQuery.of(context).size.height * 0.03,
                          ),
                          constraints: BoxConstraints(
                            minHeight:
                                MediaQuery.of(context).size.height * 0.09,
                            minWidth: MediaQuery.of(context).size.height * 0.2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.withOpacity(0.35),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'BUY',
                                style: TextStyle(
                                  fontFamily: 'Exo',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0,
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                  minWidth: 2,
                                  minHeight: 50,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0x77FFFFFF),
                                ),
                              ),
                              Text(
                                'SELL',
                                style: TextStyle(
                                  fontFamily: 'Exo',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01),
                        Container(
                          padding: EdgeInsets.all(10),
                          constraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width * 0.37,
                          ),
                          child: Align(
                            alignment: Alignment(0.5, 1),
                            child: DropdownButton<String>(
                              value: dropdownValue,
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
                                setState(() {
                                  dropdownValue = newValue!;
                                  final currency = settingsData == null ? 'USD' : settingsData!['currency']!;
                                  BlocProvider.of<CoinCubit>(context)
                                      .getCoinData(
                                          dropdownValue.toUpperCase(), currency);
                                });
                              },
                              items: <String>[
                                'BTC',
                                'ETH',
                                'MATIC',
                                'LTC'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/$value.png',
                                        height: 35,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(value),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blueGrey.withOpacity(0.3),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
