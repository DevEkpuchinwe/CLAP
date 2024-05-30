import 'package:clapapp/UI/airtime.dart';
import 'package:clapapp/UI/cable_tv.dart';
import 'package:clapapp/UI/clap_class.dart';
import 'package:clapapp/UI/clap_coins.dart';
import 'package:clapapp/UI/data.dart';
import 'package:clapapp/UI/fund.dart';
import 'package:clapapp/UI/notification.dart';
import 'package:clapapp/UI/service.dart';
import 'package:clapapp/UI/setting.dart';
import 'package:clapapp/UI/spin.dart';
import 'package:clapapp/UI/trade_coins.dart';
import 'package:clapapp/UI/transfer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CLAP',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static get userName => FirebaseAuth.instance.currentUser!.displayName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SafeArea(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'HI $userName,ENJOY THE EXTRAORDINARY SERVICE',
              overflow: TextOverflow.visible,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                height: 150.0,
                child: Card(
                  color: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Total Balance',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(),
                          Text(
                            'NGN 20.00',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 48.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(),
                        ],
                      ),
                      Row(children: <Widget>[
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Card(
                              color: Colors.orange[400],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ElevatedButton.icon(
                                icon: const Icon(
                                  Icons.add_circle_outline_rounded,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                onPressed: () {
                                  goToFundScreen(context);
                                },
                                label: const Text(
                                  'FUND',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ),
                        const SizedBox(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Card(
                              color: Colors.orange[400],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ElevatedButton.icon(
                                icon: const Icon(
                                  Icons.send_rounded,
                                  color: Colors.deepOrange,
                                  size: 25,
                                ),
                                onPressed: () {
                                  goToTransferScreen(context);
                                },
                                label: const Text(
                                  'TRANSFER',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(),
          const Text(
            'Quick Actions',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Row(
            children: <Widget>[
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 16,
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 1,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          goToAirtimeScreen(context);
                        },
                        child: const Column(
                          children: [
                            Icon(
                              Icons.call,
                              color: Colors.deepOrange,
                              size: 20,
                            ),
                            SizedBox(),
                            Text('Artime'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 16,
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 1,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          goToDataScreen(context);
                        },
                        child: const Column(
                          children: [
                            Icon(
                              Icons.wifi,
                              color: Colors.deepOrange,
                              size: 20,
                            ),
                            SizedBox(),
                            Text('Data'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 16,
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 1,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          goToCableScreen(context);
                        },
                        child: const Column(
                          children: [
                            Icon(
                              Icons.desktop_windows_rounded,
                              color: Colors.deepOrange,
                              size: 20,
                            ),
                            SizedBox(),
                            Text('Cable TV'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 16,
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 1,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          goToServiceScreen(context);
                        },
                        child: const Column(
                          children: [
                            Icon(
                              Icons.more_horiz_rounded,
                              color: Colors.deepOrange,
                              size: 20,
                            ),
                            SizedBox(),
                            Text('More'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(),
          const Text(
            'Finance',
            textAlign: TextAlign.left,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Center(
              child: Row(
                children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    runSpacing: 16,
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              goToClassScreen(context);
                            },
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.school_rounded,
                                  color: Colors.deepOrange,
                                ),
                                SizedBox(),
                                Text('Clap class'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    runSpacing: 16,
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              goToTradeScreen(context);
                            },
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.currency_exchange_rounded,
                                  color: Colors.deepOrange,
                                ),
                                SizedBox(),
                                Text('Trade Coins'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    runSpacing: 16,
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              goToCoinsScreen(context);
                            },
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.rocket_launch_rounded,
                                  color: Colors.deepOrange,
                                ),
                                SizedBox(),
                                Text('CLAP Coins'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    runSpacing: 16,
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              goToSpinScreen(context);
                            },
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.view_in_ar_rounded,
                                  color: Colors.deepOrange,
                                ),
                                SizedBox(),
                                Text('Spin'),
                              ],
                            ),
                          ),
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
    )));
  }
}

//navigation route to screens for ontaps and onpressed

goToFundScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FundScreen()),
    );

goToTransferScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TransferScreen()),
    );

goToAirtimeScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AirtimeScreen()),
    );

goToDataScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DataScreen()),
    );

goToCableScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CableScreen()),
    );

goToServiceScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ServiceScreen()),
    );

goToTradeScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TradeScreen()),
    );

goToClassScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ClassScreen()),
    );

goToCoinsScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CoinsScreen()),
    );

goToSpinScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SpinScreen()),
    );

goToNotificationScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotificationScreen()),
    );

goToSettingScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingScreen()),
    );
