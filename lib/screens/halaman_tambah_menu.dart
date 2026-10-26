// screens/halaman_tambah_menu.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/teks_kantin.dart';

class HalamanTambahMenu extends StatefulWidget {
  const HalamanTambahMenu({super.key});

  @override
  State<HalamanTambahMenu> createState() => _HalamanTambahMenuState();
}

class _HalamanTambahMenuState extends State<HalamanTambahMenu> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  void _simpanMenu() {
    if (_formKey.currentState!.validate()) {
      final menuBaru = {
        'nama': _namaController.text.trim(),
        'harga': int.parse(_hargaController.text.trim()),
      };
      Get.back(result: menuBaru);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F766E),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const TeksKantin(
          'Tambah Menu Baru',
          ukuran: 18,
          ketebalan: FontWeight.bold,
          warna: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(
                  labelText: 'Nama Menu',
                  hintText: 'Contoh: Nasi Ayam Bakar',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Kolom nama menu tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _hargaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Harga Menu (Rp)',
                  hintText: 'Contoh: 15000',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Kolom harga tidak boleh kosong';
                  }
                  final angkaHarga = int.tryParse(value.trim());
                  if (angkaHarga == null || angkaHarga <= 0) {
                    return 'Harga hanya menerima angka yang valid';
                  }
                  return null;
                },
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
                onPressed: _simpanMenu,
                child: const TeksKantin(
                  'Simpan Menu',
                  ukuran: 15,
                  ketebalan: FontWeight.w600,
                  warna: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
