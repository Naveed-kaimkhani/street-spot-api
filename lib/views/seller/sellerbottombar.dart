import 'package:StreetSpot/custom_widgets/customNavBar.dart' show CustomNavBar;
import 'package:StreetSpot/views/order/order_screen.dart';
import 'package:StreetSpot/views/seller/dashboardscreen.dart';
import 'package:StreetSpot/views/user/profilesettingscreen.dart';
import 'package:flutter/material.dart';

class Sellerbottombar extends StatefulWidget {
  const Sellerbottombar({super.key});

  @override
  State<Sellerbottombar> createState() => _SellerbottombarState();
}

class _SellerbottombarState extends State<Sellerbottombar> {
    
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const Dashboardscreen(),
    const OrderScreen(),
    const Profilesettingscreen(),

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
        // 👇 this keeps state alive
        child: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
