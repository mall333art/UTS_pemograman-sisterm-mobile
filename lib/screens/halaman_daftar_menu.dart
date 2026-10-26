// screens/halaman_daftar_menu.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/teks_kantin.dart';
import 'halaman_detail_menu.dart';
import 'halaman_tambah_menu.dart';

class HalamanDaftarMenu extends StatefulWidget {
  const HalamanDaftarMenu({super.key});

  @override
  State<HalamanDaftarMenu> createState() => _HalamanDaftarMenuState();
}

class _HalamanDaftarMenuState extends State<HalamanDaftarMenu> {
  // Minimal 5 data awal menu kantin disimpan dalam List biasa di dalam State
  final List<Map<String, dynamic>> _daftarMenu = [
    {'nama': 'Nasi Goreng Spesial Kampus', 'harga': 15000},
    {'nama': 'Mie Ayam Bakso Pangsit', 'harga': 13000},
    {'nama': 'Ayam Geprek Sambal Korek', 'harga': 14000},
    {'nama': 'Soto Ayam Lamongan Kuah Kuning', 'harga': 12000},
    {'nama': 'Es Teh Manis Jumbo', 'harga': 5000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F766E),
        title: const TeksKantin(
          'Kantin Teknik UNTIRTA',
          ukuran: 18,
          ketebalan: FontWeight.bold,
          warna: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TeksKantin(
              'Daftar Menu Tersedia Hari Ini',
              ukuran: 16,
              ketebalan: FontWeight.w700,
              warna: Color(0xFF0F172A),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _daftarMenu.length,
              itemBuilder: (context, index) {
                final menu = _daftarMenu[index];
                return Card(
                  elevation: 1.5,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    leading: const Icon(
                      Icons.restaurant_menu_rounded,
                      color: Color(0xFF0F766E),
                    ),
                    title: TeksKantin(
                      menu['nama'],
                      ukuran: 15,
                      ketebalan: FontWeight.w600,
                      warna: const Color(0xFF1E293B),
                    ),
                    subtitle: TeksKantin(
                      'Rp ${menu['harga']}',
                      ukuran: 13,
                      ketebalan: FontWeight.w500,
                      warna: const Color(0xFF0F766E),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: Color(0xFF64748B),
                    ),
                    onTap: () {
                      Get.to(
                        () => HalamanDetailMenu(
                          namaMenu: menu['nama'],
                          hargaMenu: menu['harga'],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0F766E),
        onPressed: () async {
          final menuBaru = await Get.to(() => const HalamanTambahMenu());
          if (menuBaru != null && menuBaru is Map<String, dynamic>) {
            setState(() {
              _daftarMenu.add(menuBaru);
            });
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
