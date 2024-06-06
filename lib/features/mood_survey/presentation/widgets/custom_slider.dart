import 'package:flutter/material.dart';
import 'package:test1/config/config.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
    required this.currentSliderValue,
    this.onChanged,
  });

  final double currentSliderValue;
  final void Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 11,
            color: AppColors.gray2.withOpacity(0.11),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CustomPaint(
              painter: SliderTickMarksPainter(),
              child: Container(height: 16),
            ),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTickMarkColor: Colors.transparent,
              inactiveTickMarkColor: Colors.transparent,
              activeTrackColor: Colors.orange,
              inactiveTrackColor: AppColors.gray5,
              disabledActiveTrackColor: AppColors.gray5,
              disabledInactiveTrackColor: AppColors.gray5,
              thumbColor: Colors.orange,
              overlayColor: Colors.orange.withOpacity(0.2),
              trackHeight: 8.0,
              thumbShape: CustomThumbShape(enabled: onChanged != null),
              overlayShape: const RoundSliderOverlayShape(
                overlayRadius: 0.0,
              ),
            ),
            child: Slider(
              value: currentSliderValue,
              min: 0,
              max: 100,
              divisions: onChanged != null ? 10 : null,
              onChanged: onChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Низкий',
                    style: AppTextStyle.body4(color: AppColors.gray1)),
                Text('Высокий',
                    style: AppTextStyle.body4(color: AppColors.gray1)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SliderTickMarksPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.gray5
      ..strokeWidth = 2;

    const tickMarkCount = 6;
    final tickMarkSpacing = size.width / (tickMarkCount - 1);

    for (int i = 0; i < tickMarkCount; i++) {
      final dx = i * tickMarkSpacing;
      canvas.drawLine(
        Offset(dx, 0),
        Offset(dx, 10),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CustomThumbShape extends SliderComponentShape {
  final bool enabled;

  CustomThumbShape({required this.enabled});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size.fromRadius(10);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final Paint thumbPaint = Paint()
      ..color = enabled ? Colors.orange : AppColors.gray5;
    final Paint borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    context.canvas.drawCircle(center, 10, borderPaint);
    context.canvas.drawCircle(center, 9, thumbPaint);
  }
}