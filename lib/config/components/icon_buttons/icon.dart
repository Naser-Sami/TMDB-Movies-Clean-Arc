import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/core/core.dart';

class SvgIconWidget extends StatelessWidget {
  const SvgIconWidget({
    Key? key,
    required this.name,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.onPressed,
  }) : super(key: key);

  final String name;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      minWidth: 0,
      height: 0,
      onPressed: onPressed,
      child: SvgPicture.asset(
        Func.getIconSVG(name), // for multi path we can use it as required parameter
        width: width,
        height: height,
        colorFilter:
        color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
        fit: fit,
      ),
    );
  }
}
