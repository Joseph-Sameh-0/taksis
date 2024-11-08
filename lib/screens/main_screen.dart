import 'package:flutter/material.dart';
import 'package:taksis/colors.dart';
import 'package:taksis/screens/Account/account.dart';
import 'package:taksis/screens/Orders/orders.dart';

import 'Home Screen/home_page.dart';
import 'cart/cart.dart';
import 'wishlist/wish_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, this.index});

  final int? index;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex;

  final List<Widget> _pages = [];

  Future<bool> _handlePop(bool didPop, dynamic result) async {
    if (didPop) {
      return false;
    }

    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you want to exit the App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );

    return shouldExit ?? false;
  }

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      HomePage(onNavigate: _onItemTapped),
      WishList(onNavigate: _onItemTapped),
      Cart(onNavigate: _onItemTapped),
      Orders(onNavigate: _onItemTapped),
      Account(onNavigate: _onItemTapped),
    ]);
    if (widget.index != null) {
      _selectedIndex = widget.index!;
    } else {
      _selectedIndex = 0;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _handlePop(false, null),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _pages[_selectedIndex],
        floatingActionButton: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              bottom: 30,
              child: FloatingActionButton(
                onPressed: () {
                  _onItemTapped(2);
                },
                backgroundColor:
                    _selectedIndex == 2 ? secondaryColor : Colors.white,
                shape: const CircleBorder(),
                child: Icon(Icons.shopping_cart_outlined,
                    color: _selectedIndex == 2 ? Colors.white : primaryColor),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: primaryColor,
          ),
          child: BottomAppBar(
            padding: EdgeInsets.zero,
            notchMargin: 8.0,
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: (index) {
                if (index != 2) {
                  _onItemTapped(index);
                }
              },
              iconSize: 24,
              selectedItemColor: secondaryColor,
              unselectedItemColor: Colors.white,
              unselectedFontSize: 10,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_outlined),
                  label: 'Wishlist',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.circle, color: Colors.transparent),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt),
                  label: 'Orders',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_pin),
                  label: 'Account',
                ),
              ],
              type: BottomNavigationBarType.fixed,
            ),
          ),
        ),
      ),
    );
  }
}
