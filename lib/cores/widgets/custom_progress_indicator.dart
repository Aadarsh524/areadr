import 'package:areadr/cores/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  final String? label;

  const CustomProgressIndicator({
    super.key,
    this.color = AppColors.primary,
    this.strokeWidth = 4.0,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(color),
            strokeWidth: strokeWidth,
          ),
          if (label != null) ...[
            const SizedBox(height: 10),
            Text(
              label!,
              style: TextStyle(
                fontSize: 16,
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
