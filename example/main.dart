import 'package:flutter/material.dart';
import 'package:full_screen_back_gesture/full_screen_back_gesture.dart';

void main() => runApp(App());

/// Sample app with [FullScreenBackGesturePageTransitionsBuilder] configuration
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android:
                FullScreenBackGesturePageTransitionsBuilder(),
            TargetPlatform.iOS: FullScreenBackGesturePageTransitionsBuilder(),
          },
        ),
      ),
      home: MainPage(),
    );
  }
}

/// A common sample page
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back Gesture'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Push next page'),
          onPressed: () => Navigator.of(context).push(
            // only [MaterialPageRoute] supports custom [pageTransitionsTheme]
            MaterialPageRoute(builder: (context) => ScrollPage()),
          ),
        ),
      ),
    );
  }
}

/// A sample page with horizontal scrollable widget
class ScrollPage extends StatelessWidget {
  const ScrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrollable'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: 100.0,
          child: GridView.count(
            crossAxisCount: 1,
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => Card(
                child: InkWell(
                  child: Center(child: Text('$index')),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MainPage()),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
