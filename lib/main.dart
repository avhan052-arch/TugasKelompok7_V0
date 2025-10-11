import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const KelompokPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class KelompokPage extends StatelessWidget {
  const KelompokPage({super.key});

   final List<String> anggota = const [
    "1. Ardiansyah",
    "2. Harun",
    "3. Widya",
    "4. Hasan",
    "5. Syahril",
    "6. Aisyah",
    "7. Aji",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kelompok 7"),
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        centerTitle: true, 
        backgroundColor: const Color.fromARGB(255, 248, 176, 41), 

      ),

     body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: anggota.map((nama) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              elevation: 3, // bayangan lembut
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  nama,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            );
          }).toList(),
        ),
      ),
       bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, 
        onTap: (index) {}, 
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: "Kelompok",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Pengaturan",
          ),
        ],
      ),
    );
  }
}
