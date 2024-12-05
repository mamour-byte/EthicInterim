import 'package:ethicinterim/pages/HomePage.dart';
import 'package:ethicinterim/pages/profil.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  void setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFEEEEEE)),
      home: Home(currentIndex: _currentIndex, setCurrentIndex: setCurrentIndex),
    );
  }
}

class Home extends StatelessWidget {
  final int currentIndex;
  final void Function(int) setCurrentIndex;

  const Home({required this.currentIndex, required this.setCurrentIndex, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          [
            "Accueil",
            "Profil",
          ][currentIndex],
        ),
        backgroundColor: Colors.brown,
      ),
      body: [
        const HomePage(),
        const Profil(),
      ][currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Colors.brown,
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black87,
        onTap: (i) => setCurrentIndex(i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.home,
              size: 35,
            ),
            title: const Text("Home"),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.message,
              size: 35,
            ),
            title: const Text("Message"),
          ),
        ],
      ),
    );
  }
}
