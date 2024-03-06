import 'package:flutter/material.dart';
import 'package:loginsignup/BlogsPage.dart';
import 'package:loginsignup/notes_app_screen.dart';
import 'package:flutter/services.dart';
import 'package:loginsignup/pages/todo_page.dart';
import 'package:loginsignup/temp/blogs_app_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Index of the selected tab

  // List of pages to be displayed for each tab
  final List<Widget> _pages = [
    NotesAppScreen(),
    TodoPage(),
    BlogsPage(),
    // BlogsAppScreen(),
  ];

  // Function to handle tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.book,
                size: 30, // Adjust the size as needed
              ),
            ),
            Text(
              "Pro",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Blog",
              style: TextStyle(
                  color: Color.fromARGB(255, 150, 81, 206),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'To-Do List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Blogs',
          ),
        ],
        currentIndex: _selectedIndex, // Current selected tab index
        onTap: _onItemTapped, // Function to handle tab selection
      ),
    );
  }
}
