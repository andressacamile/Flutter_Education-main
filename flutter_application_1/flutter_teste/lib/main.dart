import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_teste/about_page.dart';
import 'package:flutter_teste/home_page.dart';
import 'package:flutter_teste/settings_screen.dart';

class AppBarDemo extends StatefulWidget {
  const AppBarDemo({Key? key}) : super(key: key);
  @override 
  AppBarDemoState createState() => AppBarDemoState();
}


class AppBarDemoState extends State <AppBarDemo> {
   int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Comentários'),
    Text('Agenda'),
    Text('Conta'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // Obtenha uma instância de MaterialLocalizations para acessar os textos localizados
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 239, 109, 239), // Cor de fundo do AppBar
        iconTheme: IconThemeData(
          color: Colors.white, 
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            tooltip: localizations.openAppDrawerTooltip,
            onPressed: () {
              // Abre o Drawer ao clicar no ícone do menu
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Text(
          'App',
        ),
        actions: [
          IconButton(
            tooltip: 'Favorite',
            icon: const Icon(Icons.favorite),
            onPressed: () {},
          ),
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('Politica de privacidade'),
                ),
                PopupMenuItem(
                  child: Text('Sobre'),
                ),
                PopupMenuItem(
                  child: Text('Sair'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed:(){
                
              },
              child: Text('Clique Aqui'),
            ),
            SizedBox(height: 38),
          
          ],

         ),
         ),
      // Adiciona o Drawer ao Scaffold
      drawer: Drawer(
        child: ListView(
          // Defina os itens no Drawer
          children: [
            DrawerHeader(
              
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 238, 152, 226),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  Text(
                      'And',
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Ação ao selecionar "Home"
                Navigator.pop(context); // Fechar o Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Ação ao selecionar "Settings"
                Navigator.pop(context); // Fechar o Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                // Ação ao selecionar "About"
                Navigator.pop(context); // Fechar o Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 239, 109, 239),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            label: 'Comentários',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Agenda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Conta',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 212, 237, 237),
        onTap: _onItemTapped,
      ),
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
        // Configurações para internacionalização com flutter_localizations
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        // Lista de idiomas suportados
        Locale('en', 'US'), // Inglês
        Locale('pt', 'BR'), // Português do Brasil
      ],
      home: const AppBarDemo(),
    );
  }
}
