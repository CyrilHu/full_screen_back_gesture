# full_screen_back_gesture

A Flutter package supports full screen swipe back gesture, without scrolling conflicts.

## Features

- full screen swipe back gesture instead of edge swipe
- will not block horizontal scroll gesture of Scrollable widgets

## Usage

### Option 1 (Recommended)

When you use `MaterialPageRoute` for `Navigator`, you can custom page transitions,

Sets `pageTransitionsTheme` for `MaterialApp` theme.

```dart
MaterialApp(
  theme: ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FullScreenBackGesturePageTransitionsBuilder(),
        TargetPlatform.iOS: FullScreenBackGesturePageTransitionsBuilder(),
      },
    ),
  ),
);
```

### Option 2

If you have to use `CupertinoPageRoute` for `Navigator`, import cupertino route form this package, There is only `CupertinoPageRoute` has been replaced.

```dart
import 'package:full_screen_back_gesture/cupertino.dart';

Navigator.of(context).push(CupertinoPageRoute(builder: (context) => MainPage())),
```