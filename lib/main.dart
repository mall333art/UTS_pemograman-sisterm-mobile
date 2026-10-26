// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/halaman_daftar_menu.dart';

void main() {
  runApp(const AplikasiKantinApp());
}

class AplikasiKantinApp extends StatelessWidget {
  const AplikasiKantinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pencatat Menu Kantin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0F766E)),
        useMaterial3: true,
      ),
      home: const HalamanDaftarMenu(),
    );
  }
}
