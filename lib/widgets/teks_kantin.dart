// widgets/teks_kantin.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Font Plus Jakarta Sans dipilih karena memiliki keterbacaan tinggi di layar mobile
// serta memberikan kesan bersih, modern, dan ramah untuk aplikasi katalog kuliner kantin.
// Parameter ukuran, ketebalan, dan warna dibuat fleksibel agar mudah menjaga hierarki visual.
class TeksKantin extends StatelessWidget {
  final String isiTeks;
  final double ukuran;
  final FontWeight ketebalan;
  final Color warna;

  const TeksKantin(
    this.isiTeks, {
    super.key,
    this.ukuran = 14.0,
    this.ketebalan = FontWeight.normal,
    this.warna = const Color(0xFF1E293B),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      isiTeks,
      style: GoogleFonts.plusJakartaSans(
        fontSize: ukuran,
        fontWeight: ketebalan,
        color: warna,
      ),
    );
  }
}
