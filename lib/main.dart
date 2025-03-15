import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        title: const Text('Profile Card'),
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

class ProfileCard extends StatelessWidget {
  // สมมติว่านี่คือ Custom Widget ProfileCard ของคุณ
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
              backgroundImage: NetworkImage('https://static.thairath.co.th/media/dFQROr7oWzulq5Fa5K79Lg8G4AwJ7S6C6QfeiXspyCHSOspqO0x7MtIPfDXyEwVVdyu.webp'), // เปลี่ยนตรงนี้เป็น URL จริง
              //child: const Icon(Icons.person, size: 60),
            ),
            const SizedBox(height: 16),
            Text(
              'Phaguy MUeangman', // ใส่ชื่อของคุณ
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'mueangman_p@silpakorn.edu', // ใส่อีเมลของคุณ
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '0636021079', // ใส่เบอร์โทรศัพท์ของคุณ
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}