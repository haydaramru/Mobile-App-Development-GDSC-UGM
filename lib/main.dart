import 'package:flutter/material.dart';
import 'package:mobile_app_development/home.dart';
import 'package:mobile_app_development/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = const [
    HomePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIMASTER UGM'),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('Actions');
            },
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: pages[currentPage],
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     debugPrint('Floating Action Button Clicked');
      //   },
      //   child: const Icon(Icons.add),
      // ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.add_alert_rounded), label: 'Notif'),
          NavigationDestination(
              icon: Icon(Icons.dehaze_outlined), label: 'Menu'),
          NavigationDestination(
              icon: Icon(Icons.fingerprint), label: 'Presensi'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
