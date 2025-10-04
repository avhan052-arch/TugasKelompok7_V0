import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KelompokPage(),
    );
  }
}

class KelompokPage extends StatefulWidget {
  const KelompokPage({super.key});

  @override
  State<KelompokPage> createState() => _KelompokPageState();
}

class _KelompokPageState extends State<KelompokPage>
with TickerProviderStateMixin {
  final List<Map<String, String>> anggota = const [
    {"nama": "Ardiansyah", "detail": "Nama : Ardiansyah, NIM : ........."},
    {"nama": "Harun", "detail": "Nama : Harun, NIM : ........."},
    {"nama": "Widya", "detail": "Nama : Widya, NIM : ........."},
    {"nama": "Hasan", "detail": "Nama : Hasan, NIM : ........."},
    {"nama": "...", "detail": "Nama : ..., NIM : ........."},
    {"nama": "...", "detail": "Nama : ..., NIM : ........."},
    {"nama": "...", "detail": "Nama : ..., NIM : ........."},
  ];

  late List<AnimationController> controllers;
  late List<Animation<double>> animations;

  @override
  void initState() {
    super.initState();

    controllers = List.generate(
      anggota.length,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 600 + index * 100), // delay per card
      ),
    );

    animations = controllers
    .map(
      (c) => CurvedAnimation(
        parent: c,
        curve: Curves.elasticOut, // efek bounce
      ),
    )
    .toList();

    // Jalankan animasi secara berurutan
    Future.delayed(const Duration(milliseconds: 300), () {
      for (var c in controllers) {
        c.forward();
      }
    });
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void showDetail(BuildContext context, String nama, String detail) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return DraggableScrollableSheet(
          initialChildSize: 0.4,
          maxChildSize: 0.7,
          minChildSize: 0.3,
          expand: false,
          builder: (_, controller) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: ListView(
                controller: controller,
                padding: const EdgeInsets.all(20),
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 5,
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Text(
                    nama,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    detail,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () => Navigator.pop(ctx),
                    child: const Text(
                      "Tutup",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "KELOMPOK 7",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              // Shadow 1: Bayangan utama
              Shadow(
                blurRadius: 10.0, // Tingkat keburaman/penyebaran bayangan
                color: Colors.black, // Warna bayangan
                offset: Offset(5.0, 5.0), // Posisi bayangan (x, y)
              ),

              // Anda bisa menambahkan bayangan lain untuk efek ganda
              Shadow(
                blurRadius: 5.0,
                color: Color.fromARGB(255, 3, 10, 4),
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        ),

        elevation: 5,
        shadowColor: Colors.black,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 248, 154, 32),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Anggota Kelompok 7",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),

          // List Anggota (dengan animasi card)
          Expanded(
            child: ListView.builder(
              itemCount: anggota.length,
              itemBuilder: (context, index) {
                return ScaleTransition(
                  scale: animations[index],
                  child: Card(
                    margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: Text(
                          anggota[index]["nama"]![0], // huruf pertama
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        anggota[index]["nama"]!,
                        style: const TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        showDetail(
                          context,
                          anggota[index]["nama"]!,
                          anggota[index]["detail"]!,
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
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
