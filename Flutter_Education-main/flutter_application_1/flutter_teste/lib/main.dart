import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:device_preview/device_preview.dart';

class AppBarDemo extends StatelessWidget {
  const AppBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF691A9E), 
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Text(
              'Adaptive Speech',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold, 
              ),
            ),
            Text(
              'You can communicate easily throug Speech to Text chat',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7), 
                fontSize: 14, 
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            SizedBox(height:200),
            SizedBox(
              height: 50,
              width: 300,
              child: 
            ElevatedButton( 
              onPressed: () {
               
              },
              child: Text('Get Started'),
            ),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 148, 97, 181),
    );
  }
}

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppBar Demo',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
      ],
      theme: ThemeData(
        primarySwatch: Colors.purple, 
      ),
      home: const AppBarDemo(),
    );
  }
}