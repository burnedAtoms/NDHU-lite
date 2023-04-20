import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedOption;

  final List<String> _options = ['Profile','View Campus','Assignments','Grades'];

  @override
  void initState() {
    super.initState();
    _selectedOption = _options[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        // Add hamburger menu icon to the app bar
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      // Add drawer to the scaffold
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            // Add a list of menu items
            ListTile(
              title: Text('Profile'),
              selected: _selectedOption == 'Profile',
              onTap: () {
                setState(() {
                  _selectedOption = 'Profile';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('View Campus'),
              selected: _selectedOption == 'View Campus',
              onTap: () {
                setState(() {
                  _selectedOption = 'View Campus';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Assignments'),
              selected: _selectedOption == 'Assignments',
              onTap: () {
                setState(() {
                  _selectedOption = 'Assignments';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Grades'),
              selected: _selectedOption == 'Grades',
              onTap: () {
                setState(() {
                  _selectedOption = 'Grades';
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select an option:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            DropdownButton(
              value: _selectedOption,
              items: _options.map((option) {
                return DropdownMenuItem(
                  child: Text(option),
                  value: option,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
