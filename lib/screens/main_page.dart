
import 'package:flutter/material.dart';
import 'package:netlifx_cross/screens/comingsoon/coming_soon.dart';
import 'package:netlifx_cross/screens/downloads/downloads.dart';
import 'package:netlifx_cross/screens/home_page/home_page.dart';
import 'package:netlifx_cross/screens/home_page/home_screen.dart';



class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = [
   const HomeScreen(),
    const ComingSoon(),
      const DownloadPage(),
  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(
          () => currentIndex = index,
        ),
        items: const [
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
            label: 'New & Hot',
            icon: Icon(Icons.collections),
          ),
          // BottomNavigationBarItem(
          //   label: 'Search',
          //   icon: Icon(Icons.search),
          // ),
          BottomNavigationBarItem(
            label: 'Download',
            icon: Icon(Icons.download),
          ),
        ],
      ),
    );
  }
}
