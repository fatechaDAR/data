import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyLearning Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // PERBAIKAN 1: 'fromSeed' (bukan fontSeed)
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF009688), // Teal
          background: const Color(0xFFF5F7FA),
        ),
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      // PERBAIKAN 2: 'DashboardPage' 
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  // PERBAIKAN 3: Constructor 'DashboardPage' 
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // --- BAGIAN 1: SIDEBAR (KIRI) ---
          SizedBox(
            width: 280,
            child: Column(
              children: [
                // 1. AREA LOGO
                Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "MyLearning.",
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 2. MENU ITEM 1 (DASHBOARD - AKTIF)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      onTap: () {},
                      selected: false,
                      leading: Icon(
                        Icons.dashboard_rounded,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      title: Text(
                        "Dashboard",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 4),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ListTile(
                    onTap: () {},

                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    leading: const Icon(Icons.dashboard_rounded, color: Colors.grey),
                    title: Text(
                      "My Courses",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 4),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ListTile(
                    onTap: () {},
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    leading: const Icon(Icons.settings_rounded, color: Colors.grey),
                    title: Text(
                      "Settings",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ], // akhir column side bar
            ),
          ),

          // --- BAGIAN 2: KONTEN UTAMA (KANAN) ---
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.background,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Header sederhana (Akan kita percantik nanti)
                  Container(
                    height: 60,
                    width: double.infinity,
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text("Header Area"),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Area Konten Bawah
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: const Center(child: Text("Main Content Area")),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}