import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'home_screen.dart';

class Onboard {
  final String title;
  final String subtitle;
  final String lottie;

  Onboard({required this.title, required this.subtitle, required this.lottie});
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Onboard> pages = [
    Onboard(
      title: 'Unlimited Entertainment',
      subtitle: 'Stream thousands of movies, series, and more anytime.',
      lottie: 'popcorn',
    ),
    Onboard(
      title: 'Grab Popcorn 🍿',
      subtitle: 'Get comfy and enjoy a world of storytelling.',
      lottie: 'movie',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _controller,
        itemCount: pages.length,
        onPageChanged: (index) => setState(() => _currentPage = index),
        itemBuilder: (ctx, index) {
          final page = pages[index];
          final isLast = index == pages.length - 1;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Lottie.asset(
                'assets/${page.lottie}.json',
                height: size.height * 0.5,
              ),
              const SizedBox(height: 20),
              Text(
                page.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: size.width * 0.8,
                child: Text(
                  page.subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
              ),
              const Spacer(),
              Wrap(
                spacing: 8,
                children: List.generate(
                  pages.length,
                      (i) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: i == _currentPage ? 14 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: i == _currentPage ? Colors.red : Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (isLast) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  } else {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: const StadiumBorder(),
                  minimumSize: Size(size.width * 0.5, 48),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: Text(isLast ? 'Get Started' : 'Next'),
              ),
              const SizedBox(height: 40),
            ],
          );
        },
      ),
    );
  }
}

