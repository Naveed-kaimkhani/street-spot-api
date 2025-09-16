import 'package:StreetSpot/custom_widgets/customNavBar.dart' show CustomNavBar;
import 'package:StreetSpot/views/user/favoriteslistscreen.dart';
import 'package:StreetSpot/views/user/homescreen.dart';
import 'package:StreetSpot/views/user/profilesettingscreen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
     FavoritesListPage(),
    const Profilesettingscreen(),

    // const UserManagementPage(),
    // ReportAnalysisScreen(), // Assuming this represents History
    // Profilesettingscreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _screens.isNotEmpty && _selectedIndex < _screens.length
            ? _screens[_selectedIndex]
            : const Center(child: Text('No Screens Available')),
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
