import 'package:flash/flash.dart';
import 'package:flutter/material.dart';


// check this for the examples: https://pub.dev/packages/flash/example

class FlashPage extends StatelessWidget {
  const FlashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => showFlash(
                  context: context,
                  builder: (context, controller) {
                    return Flash(
                      controller: controller,
                      dismissDirections: FlashDismissDirection.values,
                      slideAnimationCreator:
                          (context, position, parent, curve, reverseCurve) {
                        return controller.controller.drive(
                          Tween(
                              begin: const Offset(0.1, 0.1), end: Offset.zero),
                        );
                      },
                      child: AlertDialog(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          side: BorderSide(),
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 24.0,
                          top: 16.0,
                          right: 24.0,
                          bottom: 16.0,
                        ),
                        title: const Text('Title'),
                        content: const Text('Content'),
                        actions: [
                          TextButton(
                            onPressed: controller.dismiss,
                            child: const Text('Ok'),
                          ),
                        ],
                      ),
                    );
                  }),
              child: const Text('Alert Dialog'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => showFlash(
                  context: context,
                  builder: (context, controller) {
                    return Flash(controller: controller, child: Text('Hello'));
                  }),
              child: const Text('SnackBar'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => null,
              child: const Text('Toast'),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
