import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigationbottombar_with_flutter_bloc/blocs/navigation/navigation_bloc.dart';
import 'package:navigationbottombar_with_flutter_bloc/ui/alertpage.dart';
import 'package:navigationbottombar_with_flutter_bloc/ui/homepage.dart';
import 'package:navigationbottombar_with_flutter_bloc/ui/overviewpage.dart';
import 'package:navigationbottombar_with_flutter_bloc/ui/profilepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Bloc Example',
      home: BlocProvider(
        create: (context) => NavigationBloc(),
        child: const MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _pages = [
    const HomePage(),
    const OverviewPage(),
    const AlertPage(),
    const ProfilePage(),
  ];

  int _currentIndex = 0;

  void _onTabTapped(int index) {
    BlocProvider.of<NavigationBloc>(context)
        .add(NavigationEventFactory.create(index));
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedIconTheme: const IconThemeData(color: Colors.blue),
        unselectedIconTheme: const IconThemeData(color: Colors.black),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
            ),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
            label: 'Alert',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class NavigationEventFactory {
  static NavigationEvent create(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return NavigationHomeEvent();
      case 1:
        return NavigationOverviewEvent();
      case 2:
        return NavigationAlertEvent();
      case 3:
        return NavigationProfileEvent();
      default:
        throw ArgumentError('Invalid page index: $pageIndex');
    }
  }
}
