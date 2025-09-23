import 'dart:ui';

extension HexColor on Color {
  String toHex({bool leadingHashSign = false, bool withAlpha = false}) {
    final a = (this.a * 255.0).round() & 0xFF;
    final r = (this.r * 255.0).round() & 0xFF;
    final g = (this.g * 255.0).round() & 0xFF;
    final b = (this.b * 255.0).round() & 0xFF;

    final prefix = leadingHashSign ? '#' : '';
    final alpha = withAlpha ? a.toRadixString(16).padLeft(2, '0') : '';

    return '$prefix$alpha${r.toRadixString(16).padLeft(2, '0')}'
            '${g.toRadixString(16).padLeft(2, '0')}'
            '${b.toRadixString(16).padLeft(2, '0')}'
        .toUpperCase();
  }
}
