import 'package:StreetSpot/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTap,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed, // Ensures all items are visible
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 22,
            color: selectedIndex == 0 ? Colors.orange : AppColors.inactive,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.local_shipping,
            size: 22,
            color: selectedIndex == 1 ? Colors.orange : AppColors.inactive,
          ),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: 22,
            color: selectedIndex == 2 ? Colors.orange : AppColors.inactive,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
