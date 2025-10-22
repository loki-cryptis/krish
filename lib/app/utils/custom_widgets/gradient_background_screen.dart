import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            // Color(0xFF3A0CA3),
            Color(0xFF1B0C4C),
            Color(0xFF6C0EFF),
            Color(0xFFB700FF),
            //Color(0xFF3A0CA3),
          ],
        ),
      ),
      child: child,
    );
  }
}


class GradientScreenBackground extends StatelessWidget {
  final Widget child;

  const GradientScreenBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1B0C4C),
            Color(0xFF24006E),
            Color(0xFF38017A),
            Color(0xFF38017A),
          ],
        ),
      ),
      child: child,
    );
  }
}
