import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:higrow/constants/app_colors.dart';
import 'package:higrow/widgets/step_item.dart';

class UsageGuide extends StatelessWidget {
  const UsageGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/logo.png", width: 61, height: 22),
              SizedBox(height: 16),
              Center(
                child: Text(
                  "Panduan Penggunaan",
                  style: GoogleFonts.inter(
                    color: AppColors.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(height: 32),

              StepItem(
                number: 1,
                title: "Buka Aplikasi",
                content:
                    "Pastikan Anda telah mengunduh dan menginstal aplikasi HiGrow di perangkat Anda. Setelah itu, buka aplikasi untuk memulai.",
              ),

              StepItem(
                number: 2,
                title: "Akses Kamera",
                content:
                    "Izinkan aplikasi mengakses kamera agar bisa memindai tubuh pengguna. Pastikan pencahayaan cukup dan pengguna berdiri penuh dalam bingkai kamera.",
              ),

              StepItem(
                number: 3,
                title: "Lakukan Pengukuran",
                content:
                    "Ikuti petunjuk pada layar untuk mulai mengukur tinggi badan. Aplikasi akan menggunakan teknologi AI untuk memproses hasil pengukuran.",
              ),

              StepItem(
                number: 4,
                title: "Lihat Hasil",
                content:
                    "Setelah pengukuran selesai, hasil tinggi badan Anda akan ditampilkan dalam satuan sentimeter dengan dua angka di belakang koma.",
              ),

              StepItem(
                number: 5,
                title: "Riwayat Pengukuran",
                content:
                    "Anda dapat melihat riwayat pengukuran di halaman Riwayat untuk melacak perkembangan tinggi badan dari waktu ke waktu.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
