import 'package:flutter/material.dart';
import 'EditProfileScreen.dart';

class answer1 extends StatefulWidget {
  const answer1({super.key});

  @override
  State<answer1> createState() => _answer1();
}

class _answer1 extends State<answer1> {
  ThemeMode _themeMode = ThemeMode.light;

  void _changeTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Profile Card App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: ProfileScreen(
        themeMode: _themeMode,
        onThemeChanged: _changeTheme,
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final ThemeMode themeMode;
  final VoidCallback onThemeChanged;

  const ProfileScreen({
    super.key,
    required this.themeMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('โปรไฟล์ผู้ใช้'),
        actions: [
          IconButton(
            icon: Icon(
              themeMode == ThemeMode.light
                  ? Icons.brightness_4 // Icon สำหรับ Dark Mode
                  : Icons.brightness_7, // Icon สำหรับ Light Mode
            ),
            onPressed: onThemeChanged,
          ),
        ],
      ),
      body: Center(
        child: ProfileCard(), // เรียกใช้งาน Custom Widget ProfileCard ของคุณ
      ),
    );
  }
}

// ... ส่วนอื่น ๆ ของโค้ด

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://www.kasandbox.org/programming-images/avatars/leaf-blue.png'),
            ),
            const SizedBox(height: 16),
            Text(
              'Phaguy MUeangman',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'mueangman_p@silpakorn.edu',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '0636021079',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(
                      currentName: 'Phaguy MUeangman', // Replace with actual data
                      currentEmail: 'mueangman_p@silpakorn.edu', // Replace with actual data
                      currentPhone: '0636021079', // Replace with actual data
                    ),
                  ),
                );
              },
              child: const Text('แก้ไขโปรไฟล์'),
              
      
   
            ),
          ],
        ),
      ),
    );
  }
  
}
