import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MarqueeContainer extends HookConsumerWidget {
  const MarqueeContainer({
    super.key,
    required this.child,
    this.delay = const Duration(seconds: 10),
    this.disableAnimation = false,
    this.duration = const Duration(seconds: 10),
    this.gap = 40,
    this.id,
    this.pause = const Duration(seconds: 5),
  });
  final Widget child;
  final Duration delay;
  final bool disableAnimation;
  final Duration duration;
  final double gap;
  final String? id;
  final Duration pause;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shouldScroll = useState(false);

    final animationController = useAnimationController(
      duration: duration,
    );
    final offset = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-1, 0),
    ).animate(animationController)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            animationController.reverse();
          }

          if (status == AnimationStatus.dismissed) {
            animationController.forward();
          }
        },
      );

    final scrollController = useScrollController();

    useEffect(() {
      return Future(() {
        animationController.forward();
        shouldScroll.value = true;
      }).ignore;
    }, []);

    return SingleChildScrollView(
      controller: scrollController,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: SlideTransition(
        position: offset,
        child: ValueListenableBuilder<bool>(
          valueListenable: shouldScroll,
          builder: (BuildContext context, bool shouldScroll, _) {
            return Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: shouldScroll ? gap : 0,
                  ),
                  child: child,
                ),
                if (shouldScroll)
                  Padding(
                    padding: EdgeInsets.only(
                      right: gap,
                    ),
                    child: child,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
