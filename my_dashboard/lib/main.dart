import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'MyLearning Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,

        // warna
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF009688),
          background: const Color(0xFFF5F7FA),
        ),
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        )
      ),
      home: const DashboardPage(),
    );
  }
}

//main page
class DashboardPage extends StatelessWidget {
  const DashboardPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //side bar (kiri)
      body: Row(
        children: [
          Container(
            width: 250,
            color: Colors.white,
            child: const Center(
              child: Text("Sidebar Area"),
            ),
          ),
          
          //main bar
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.background,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: double.infinity,
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal:20),
                    child: const Text("Header Area"),
                  ),
                  const SizedBox(height: 20),

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