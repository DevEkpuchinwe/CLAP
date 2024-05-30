import 'package:clapapp/UI/homescreen.dart';
import 'package:clapapp/UI/profile.dart';
import 'package:clapapp/UI/service.dart';
import 'package:clapapp/UI/wallet.dart';
import 'package:flutter/material.dart';

void main() => runApp(const NavigationScreen());

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;
  final List _listPages = [];
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _listPages
      ..add(const HomeScreen())
      ..add(const ServiceScreen())
      ..add(const WalletScreen())
      ..add(const ProfileScreen());
    _currentPage = const HomeScreen();
  }

  void _changePage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPages[selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CLAP'),
        backgroundColor: Colors.deepOrange,
        centerTitle: false,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.circle_notifications_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              goToNotificationScreen(context);
            },
          ),
          IconButton(
            onPressed: () {
              goToSettingScreen(context);
            },
            icon: const Icon(
              Icons.settings_rounded,
            ),
          ),
        ],
      ),
      // appBar: AppBar(
      //  title: const Text('CLAP'),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _currentPage,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.deepOrange,
        showSelectedLabels: true,
        iconSize: 40,
        selectedFontSize: 20,
        unselectedFontSize: 10,
        showUnselectedLabels: false,
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
        ),
        unselectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_repair_service_rounded),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_rounded),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
        onTap: (selectedIndex) => _changePage(selectedIndex),
      ),
    );
  }
}
