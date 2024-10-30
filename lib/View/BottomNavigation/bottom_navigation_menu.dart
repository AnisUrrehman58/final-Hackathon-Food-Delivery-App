
import 'package:flutter/material.dart';

import '../../Utils/Constant/colors.dart';
import '../Favourite/favourite.dart';
import '../cart/cart_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile.dart';

class BottomNavigationMenu extends StatefulWidget {
  const BottomNavigationMenu({super.key});


  @override
  createState() => _MyAppState();
}

class _MyAppState extends State<BottomNavigationMenu> {
  int _currentIndex = 0;

  final listChildren = [
    const HomeScreen(),const CartScreen(),const FavouriteScreen(),const ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<FavoriteProvider>(context, listen: true);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AColor.buttonBackGround,
      body: listChildren[_currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10), // Adjust spacing
        decoration: BoxDecoration(
          color: const Color(0xff403AA2),
          borderRadius: BorderRadius.circular(30), // Border radius applied here
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: SizedBox(
            height: height * 0.09,
            width: width,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey.withOpacity(0.8),
              iconSize: 30,
              backgroundColor: Colors.transparent, // Background handled by parent Container
              selectedLabelStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.black,
              ),
              onTap: onTabTapped,
              currentIndex: _currentIndex,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined), label: 'Carts'),
                BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourite'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Image.asset('assets/Icons/btn_home.png',height: 30,width: 30)


// Image.asset('assets/Icons/btn_shopping_cart.png',height: 30,width: 30),

// Image.asset('assets/Icons/btn_user_icon.png',height: 30,width: 30)