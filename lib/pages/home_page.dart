import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

ButtonStyle buttonStyle = const ButtonStyle(
  backgroundColor: MaterialStatePropertyAll(Colors.orange),
  textStyle: MaterialStatePropertyAll(
    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  ),
);

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    const QuickActions quickActions = QuickActions();
    quickActions.initialize((String actionName) {
      String redirectRoute;
      switch (actionName) {
        case 'internet':
          redirectRoute = '/internet';
          break;
        case 'pageOne':
          redirectRoute = '/page-one';
          break;
        case 'pageTwo':
          redirectRoute = '/page-two';
          break;
        default:
          redirectRoute = '/';
          break;
      }
      Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
      if (redirectRoute != '/') {
        Navigator.pushNamed(context, redirectRoute);
      }
    });

    quickActions.setShortcutItems(
      <ShortcutItem>[
        const ShortcutItem(
          type: 'home',
          localizedTitle: 'Home Page',
          icon: 'ic_home',
        ),
        const ShortcutItem(
          type: 'internet',
          localizedTitle: 'Internet Page',
          icon: 'ic_internet',
        ),
        const ShortcutItem(
          type: 'pageOne',
          localizedTitle: 'Page One',
          icon: 'ic_one',
        ),
        const ShortcutItem(
          type: 'pageTwo',
          localizedTitle: 'Page Two',
          icon: 'ic_two',
        ),
      ],
    );
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
