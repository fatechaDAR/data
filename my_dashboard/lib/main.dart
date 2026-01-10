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

  final List<Map<String, dynamic>> courses = const [
    {
      "title": "Flutter Web Masterclass",
      "instructor": "By Yui",
      "progress": 0.75,
      "color": Color(0xFF009688),
    },
    {
      "title": "UI/UX Design Principles",
      "instructor": "By Sarah",
      "progress": 0.45,
      "color": Colors.orange,
    },
    {
      "title": "Python for Data Science",
      "instructor": "By Budi",
      "progress": 0.20,
      "color": Colors.blue,
    },
  ];

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
              child: Column(
                children: [
                  // Bagian Header (Search Bar & Profile)
                  Container(
                    height: 80,
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Selamat Datang !!",
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Perkembangan Belajar Anda !!",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),

                        Container(
                          width: 250,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              const Icon(Icons.search, color: Colors.grey),
                              const SizedBox(width: 8),
                              Text(
                                "Search...",
                                style: GoogleFonts.inter(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Area Konten Scrollable
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                    Text(
                      "Overview",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      children: [
                        SummaryCard(
                          title: "In Progress ",
                          value: "4",
                          icon: Icons.book,
                          color: Color(0xFF009688),
                        ),
                        SizedBox(width: 20),
                        SummaryCard(
                          title: "Completed",
                          value: "12",
                          icon: Icons.check_circle,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 20),
                        SummaryCard(
                          title: "Certificates",
                          value: "2",
                          icon: Icons.workspace_premium,
                          color: Colors.orange,
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    Text(
                      "Recent Courses",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Column(
                      children: courses.map((course){
                        return CourseItem(
                          title: course['title'],
                          instructor: course['instructor'],
                          progress: course['progress'],
                          color: course['color'],
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 500),
                    const Text("Footer Area (Testing Scroll)"),
                  ],
                      ),
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


// coba refactor
// widget Summary Card
class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: GoogleFonts.inter(
                  color: Colors.grey[700],
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                )
              ),
            ],
          ),
          const Spacer(),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

//widget Course Item
class CourseItem extends StatelessWidget {
  final String title;
  final String instructor;
  final double progress;
  final Color color;

  const CourseItem({
    super.key,
    required this.title,
    required this.instructor,
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
         Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.play_circle_fill, color:color, size: 28),
         ) ,

         const SizedBox(width: 16),

         Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold,),
              ),
              Text(
                instructor,
                style: GoogleFonts.inter(fontSize: 12, color: Colors.grey,),
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[200],
                  color: color,
                  minHeight: 6,
                ),
              ),
            ],
          ),
         ),

         const SizedBox(width: 24),

         Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "Continue",
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
         ),
        ],
      ),
    );
  }
}

// Sidebar jadi widget terpisah
class SideMenu extends StatelessWidget {
  const SideMenu({super.key});
  
  @override
  Widget build(BuildContext Context) {
    return Container(
      wiidth: 250,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 80,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets. symmetric(horizontal: 24),
            child: Text(
              "My Learning.",
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF009688),
              ),
            ),
          ),

          // Menu Items
          padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF009688).withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.dashboard_rounded, color: Color(0xFF009688)),
                title: Text(
                  "Dashboard",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold, color: const Color(0xFF009688)
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            _buildMenuItem(Icon.book_rounded, "My Courses"),
            const SizedBox(height: 4),
            _buildMenuItem(Icon.settings_rounded, "Settings"),
          ),
        ],
      ),
    ),
  };
}

Widget _buildMenuItem(IconData, String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: ListTile(
      onTap: () {},
      leading: Icon(icon, color:Colors.grey),
      title: Text(
        title,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          color: Colors.grey
        ),
      ),
    );
  )
}