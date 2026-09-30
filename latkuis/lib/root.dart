import 'package:flutter/material.dart';
import 'package:latkuis/screens/home.dart';
import 'package:latkuis/screens/profile.dart';
import 'package:latkuis/models/data.dart';

class Root extends StatefulWidget {
  final User user;

  const Root({super.key, required this.user});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      HomeScreen(),
      ProfileScreen(username: widget.user.username),
    ];
    List<String> titleScreen = ["Home", "Profile"];

    return Scaffold(
      appBar: AppBar(
        title: Text(titleScreen[_selectedIndex]),
        actions: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.45,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  widget.user.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),
        ],
      ),

      body: screen[_selectedIndex], 

      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
          _selectedIndex = value;  
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}