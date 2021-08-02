library full_screen_back_gesture;

import 'package:flutter/material.dart';

import 'src/cupertino/route.dart';

/// Used by [PageTransitionsTheme] to define a horizontal [MaterialPageRoute]
/// page transition animation that matches native iOS page transitions.
///
/// See also:
///
///  * [FadeUpwardsPageTransitionsBuilder], which defines a default page transition.
///  * [OpenUpwardsPageTransitionsBuilder], which defines a page transition
///    that's similar to the one provided by Android P.
///  * [CupertinoPageTransitionsBuilder], which defines a horizontal page
///    transition that matches native iOS page transitions.
///  * [ZoomPageTransitionsBuilder], which defines a page transition similar
///    to the one provided in Android 10.
class FullScreenBackGesturePageTransitionsBuilder
    extends PageTransitionsBuilder {
  /// Construct a [FullScreenBackGesturePageTransitionsBuilder].
  const FullScreenBackGesturePageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return CupertinoRouteTransitionMixin.buildPageTransitions<T>(
        route, context, animation, secondaryAnimation, child);
  }
}
