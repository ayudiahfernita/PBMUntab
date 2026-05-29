import 'package:flutter/material.dart';

/// Logo resmi Universitas Tabanan (UNTAB).
class UntabLogo extends StatelessWidget {
  const UntabLogo({
    super.key,
    this.size = 120,
    this.showCaption = true,
  });

  static const String assetPath = 'assets/images/untab_logo.png';

  /// Biru utama pada lambang UNTAB.
  static const Color primaryBlue = Color(0xFF1E56A0);

  final double size;
  final bool showCaption;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          padding: EdgeInsets.all(size * 0.06),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(size * 0.08),
            boxShadow: const [
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Image.asset(
            assetPath,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.account_balance,
                size: size * 0.5,
                color: primaryBlue,
              );
            },
          ),
        ),
        if (showCaption) ...[
          const SizedBox(height: 10),
          const Text(
            'Universitas Tabanan',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF374151),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '(UNTAB)',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ],
    );
  }
}
