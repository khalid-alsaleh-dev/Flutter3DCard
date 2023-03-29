import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:reactable/reactable.dart';
import 'package:simple_shadow/simple_shadow.dart';

class ThreeDCard extends StatelessWidget {
  const ThreeDCard(
      {super.key,
      required this.isHover,
      required this.background,
      required this.foreground,
      required this.shadowColor});
  final Reactable<bool> isHover;
  final String background;
  final String foreground;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: FocusableActionDetector(
        mouseCursor: SystemMouseCursors.click,
        onShowHoverHighlight: (newIsHover) => isHover.value = newIsHover,
        child: Scope(builder: (context) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Animate(
                target: isHover.value ? 1 : 0,
              ).custom(builder: (_, value, __) {
                return Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        offset: Offset(0, value * 15),
                        blurRadius: 15,
                        spreadRadius: 5)
                  ]),
                  child: Image.asset(
                    background,
                    width: 500,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ).animate(target: isHover.value ? 1 : 0).flipV(
                    end: -0.15,
                    alignment: Alignment.center,
                    duration: 0.2.seconds);
              }),
              SimpleShadow(
                opacity: isHover.value ? 1 : 0,
                color: shadowColor,
                offset: const Offset(0, -10),
                sigma: 7,
                child: Image.asset(
                  foreground,
                  width: 500,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              )
                  .animate(
                    target: isHover.value ? 1 : 0,
                  )
                  .moveY(end: -30, duration: 0.2.seconds)
            ],
          );
        }),
      ),
    );
  }
}
