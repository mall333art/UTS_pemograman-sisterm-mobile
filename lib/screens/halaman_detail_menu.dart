// screens/halaman_detail_menu.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/teks_kantin.dart';

class HalamanDetailMenu extends StatelessWidget {
  final String namaMenu;
  final int hargaMenu;

  const HalamanDetailMenu({
    super.key,
    required this.namaMenu,
    required this.hargaMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F766E),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const TeksKantin(
          'Detail Menu Kantin',
          ukuran: 18,
          ketebalan: FontWeight.bold,
          warna: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.fastfood_rounded,
                      size: 48,
                      color: Color(0xFF0F766E),
                    ),
                    const SizedBox(height: 16),
                    const TeksKantin(
                      'Nama Hidangan',
                      ukuran: 13,
                      ketebalan: FontWeight.w500,
                      warna: Color(0xFF64748B),
                    ),
                    const SizedBox(height: 4),
                    TeksKantin(
                      namaMenu,
                      ukuran: 22,
                      ketebalan: FontWeight.bold,
                      warna: const Color(0xFF0F172A),
                    ),
                    const Divider(height: 32),
                    const TeksKantin(
                      'Harga Satuan',
                      ukuran: 13,
                      ketebalan: FontWeight.w500,
                      warna: Color(0xFF64748B),
                    ),
                    const SizedBox(height: 4),
                    TeksKantin(
                      'Rp $hargaMenu',
                      ukuran: 20,
                      ketebalan: FontWeight.w700,
                      warna: const Color(0xFF0F766E),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0F766E),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Get.back();
              },
              child: const TeksKantin(
                'Kembali ke Daftar Menu',
                ukuran: 15,
                ketebalan: FontWeight.w600,
                warna: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
