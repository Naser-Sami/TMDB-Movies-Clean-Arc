import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isPressed = true;
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isDarkMode ? const Color(0xFF2E3239) : const Color(0xFFE7ECEF);
    Offset distance =
        isPressed ? const Offset(10.0, 10.0) : const Offset(28.0, 28.0);
    double blur = isPressed ? 5.0 : 30.0;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Listener(
          // if on click use GestureDetector for example
          onPointerUp: (_) => setState(() => isPressed = false),
          onPointerDown: (_) => setState(() => isPressed = true),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: backgroundColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: blur,
                    offset: -distance,
                    color: isDarkMode ? const Color(0xFF35393F) : Colors.white,
                    inset: isPressed,
                  ),
                  BoxShadow(
                    blurRadius: blur,
                    offset: distance,
                    color: isDarkMode
                        ? const Color(0xFF23262A)
                        : const Color(0xFFA7A9AF),
                    inset: isPressed,
                  ),
                ]),
            child: const SizedBox(
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
