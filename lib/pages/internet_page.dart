import 'package:flutter/material.dart';

import '../internet/show_internet.dart';

class InternetPage extends StatelessWidget {
  const InternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.all(10),
              child: ShowInternet(),
            ),
          ],
        ),
      ),
    );
  }
}
