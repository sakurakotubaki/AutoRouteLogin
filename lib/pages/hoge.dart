import 'package:auto_route/auto_route.dart';
import 'package:auto_route_app/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HogeScreen extends StatelessWidget {
  const HogeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hoge')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Fugaへ遷移
            AutoRouter.of(context).push(FugaRoute());
          },
          child: const Text('Fugaへ'),
        ),
      ),
    );
  }
}
