import 'package:flutter/material.dart';
import 'package:notification_mobile_client/args.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  static String id = 'notificationscreen';
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as NotificationArguments;
    String? title = args.title;
    String? body = args.body;
    Map<String, dynamic> payload = args.payload;
    String? imageUrl = args.imageUrl;
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 40)),
            Center(
              child: Text(
                'Title: ${title ?? 'Could not get title'}',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Body: ${body ?? 'Could not get title'}',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Payload: $payload',
              textAlign: TextAlign.center,
            ),
            SizedBox(
                width: 150, height: 150, child: Image.network(imageUrl ?? ''))
          ]),
    );
  }
}
