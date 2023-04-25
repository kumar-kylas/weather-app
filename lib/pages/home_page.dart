import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String initialRoute = '/';
  ButtonStyle buttonStyle = const ButtonStyle(
    backgroundColor: MaterialStatePropertyAll(Colors.orange),
    textStyle: MaterialStatePropertyAll(
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );

  @override
  void initState() {
    super.initState();

    const QuickActions quickActions = QuickActions();
    quickActions.initialize((String pageRoute) {
      setState(() {
        initialRoute = pageRoute;
      });
    });

    quickActions.setShortcutItems(
      <ShortcutItem>[
        const ShortcutItem(
          type: '/',
          localizedTitle: 'Home Page',
          // icon: 'ic_launcher',
        ),
        const ShortcutItem(
          type: '/internet',
          localizedTitle: 'Internet Page',
          // icon: 'ic_launcher',
        ),
        const ShortcutItem(
          type: '/page-one',
          localizedTitle: 'Page One',
          // icon: 'AppIcon',
        ),
        const ShortcutItem(
          type: '/page-two',
          localizedTitle: 'Page Two',
          // icon: 'ic_launcher',
        ),
      ],
    ).then((void _) {
      if (initialRoute != '/') {
        Navigator.of(context).pushNamed(initialRoute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Welcome Home',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/internet');
                },
                style: buttonStyle,
                child: const Text('Go to Internet Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/page-one');
                },
                style: buttonStyle,
                child: const Text('Go to Page One'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/page-two');
                },
                style: buttonStyle,
                child: const Text('Go to Page Two'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
