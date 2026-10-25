import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const KaserApp());
}

class KaserApp extends StatelessWidget {
  const KaserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'الكاسر آب',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: const MainHomeScreen(),
    );
  }
}

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  final List<String> jokes = [
    "تعبت وأنا أطور التطبيق من الجوال.. حتى البطارية دعت عليّ! 📱😂",
    "سألت الذكاء الاصطناعي: متى يجهز الكاسر آب؟ قال لي: لما تشتري لابتوب! 💻😜",
    "التطبيق شغّال بالبركة.. والخطأ سلم عليّ وراح! 🚀😁",
    "أسرع تطبيق شات في العالم.. بس ينتظر النت يتحسن! 🌐⚡"
  ];

  int currentJokeIndex = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    // تغيير النكتة تلقائياً كل 5 ثوانٍ
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        currentJokeIndex = (currentJokeIndex + 1) % jokes.size;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20),

              // --- 1. العنوان الضخم المتدرج ---
              Column(
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Color(0xFFFFD700), Color(0xFFFF4500), Color(0xFFFF1493)],
                    ).createShader(bounds),
                    child: const Text(
                      "الكاسر للتواصل",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Kaser App - الإصدار الملكي",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),

              // --- 2. كارت النكت اليومية والتعب ---
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: const Color(0xFF1E1E1E),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        "💡 نكتة اليوم على التعب:",
                        style: TextStyle(
                          color: Color(0xFFFFD700),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        jokes[currentJokeIndex],
                        style: const TextStyle(color: Colors.white, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              // --- 3. الأزرار ---
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF4500),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "دخول الدردشة الفورية 🚀",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      style: OutlinedButton.styleForm(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        side: const BorderSide(color: Colors.grey),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "تفعيل ميزة العزلة 🔕",
                        style: TextStyle(fontSize: 16, color: Colors.lightGreenAccent),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
