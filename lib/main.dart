import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer Page"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text("Favorite"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoriteScreen()));
              },
            )
          ],
        ),
      ),
      body: const ResponsiveBody(),
    );
  }
}

class ResponsiveBody extends StatelessWidget {
  const ResponsiveBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    if (screenWidth > 800) {
      // Desktop layout
      return DesktopBody();
    } else if (screenWidth > 500) {
      // Tablet layout
      return TabletBody();
    } else {
      // Mobile layout
      return MobileBody();
    }
  }
}

class DesktopBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Desktop layout",
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class TabletBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Tablet layout",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class MobileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Mobile layout",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Flexible(
            child: Container(
              height: screenHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.deepOrange, Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite Screen',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Flexible(
            child: Container(
              height: screenHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
            ),
          )
        ],
      ),
    );
  }
}
