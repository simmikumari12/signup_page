import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'welcome_screen.dart';

class SuccessScreen extends StatefulWidget {
  final String name;

  const SuccessScreen({super.key, required this.name});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  late ConfettiController _confettiController;
  late ConfettiController _centerConfettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 5));
    _centerConfettiController =
        ConfettiController(duration: const Duration(seconds: 4));
    
    // Auto-start both confetti animations with stagger
    _confettiController.play();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _centerConfettiController.play();
      }
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _centerConfettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.green.shade400, Colors.blue.shade600],
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // 🎉 Confetti Animation - Top Burst
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: 0,
              particleDrag: 0.02,
              emissionFrequency: 0.03,
              numberOfParticles: 100,
              gravity: 0.05,
              shouldLoop: false,
              maxBlastForce: 100,
              minBlastForce: 50,
              colors: const [
                Colors.red,
                Colors.blue,
                Colors.green,
                Colors.yellow,
                Colors.pink,
                Colors.orange,
                Colors.purple,
                Colors.cyan,
              ],
            ),

            // 🎊 Center Confetti Burst - Around Success Message
            Align(
              alignment: Alignment.center,
              child: ConfettiWidget(
                confettiController: _centerConfettiController,
                blastDirection: -3.14 / 2,
                particleDrag: 0.03,
                emissionFrequency: 0.02,
                numberOfParticles: 80,
                gravity: 0.08,
                shouldLoop: false,
                maxBlastForce: 80,
                minBlastForce: 35,
                colors: const [
                  Colors.red,
                  Colors.blue,
                  Colors.green,
                  Colors.yellow,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple,
                  Colors.cyan,
                ],
              ),
            ),

            // 📱 Main Content
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    
                    // ✅ Success Icon
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.check_circle,
                        size: 100,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // 🎊 Success Message
                    const Text(
                      'Welcome Aboard!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // 👤 Personalized Greeting
                    Text(
                      'Hello, ${widget.name}! 🎉',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 40),

                    // 📝 Success Details
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.95),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 20,
                            spreadRadius: 3,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Your account is ready!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'You\'re all set to explore our amazing app and unlock exclusive features.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.star, color: Colors.amber, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Premium Access Unlocked',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),

                    // 🏠 Return Home Button
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomeScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.home, size: 24),
                      label: const Text(
                        'Back to Home',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.green.shade600,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 8,
                        shadowColor: Colors.black.withValues(alpha: 0.3),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
