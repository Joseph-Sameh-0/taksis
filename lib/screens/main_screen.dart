import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, this.index});

  final int? index;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex;
  // List of pages for each BottomNavigationBar index
  // Pass a callback to each page to allow changing the selected index
  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      Scaffold(),
      Scaffold(),
      Scaffold(),
      Scaffold(),
      Scaffold(),
      // HomePage(onNavigate: _onItemTapped),
      // TrendingProducts(onNavigate: _onItemTapped),
      // // ShopPage(onNavigate: _onItemTapped),
      // // Profile(onNavigate: _onItemTapped),
      // ShoppingBag(onNavigate: _onItemTapped),
      // // Profile(onNavigate: _onItemTapped),
      // Scaffold(),
      // Profile(onNavigate: _onItemTapped),
    ]);
    if (widget.index != null) {
      _selectedIndex = widget.index!;
    } else {
      _selectedIndex = 0;
    }
  }

  // Callback function to update selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _pages[_selectedIndex],
      // Display selected page based on index
      floatingActionButton: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 30,
            child: FloatingActionButton(
              onPressed: () {
                _onItemTapped(2); // Set index 2 for the cart page
              },
              backgroundColor:
              _selectedIndex == 2 ? const Color(0xFFD6AA59) : Colors.white,
              shape: const CircleBorder(),
              child: Icon(Icons.shopping_cart_outlined,
                  color: _selectedIndex == 2 ? Colors.white : Color(0xFF45140E)),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFF45140E),
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
            selectedItemColor: const Color(0xFFD6AA59),
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
                label: '', // Placeholder for spacing
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
    );
  }
}

