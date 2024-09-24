import 'package:flutter/material.dart';
import 'package:pertemuan3/router_flutter/side_menu.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
      ),
      drawer: const Sidemenu(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Header Gambar
          Container(
            height: 1000,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage('galangstore.png'), // Ubah gambar sesuai dengan tema jual beli
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 20),
          // Judul Aplikasi
          const Text(
            'GALANG REKOMENDASI',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          // Deskripsi Aplikasi
          const Text(
            'Aplikasi ini di buat untuk anda yang membutuhkan rekomendasi hoodie terbaru untuk kalangan remaja.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          // Fitur Aplikasi
          const SizedBox(height: 20),
          // Footer
          // Perkenalan Pembuat Aplikasi
          const Text(
            'Dibuat oleh:\nMochamad Gilang Fadil Hakim\nFakultas Teknik',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontStyle: FontStyle.italic, // Menambahkan gaya miring
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}