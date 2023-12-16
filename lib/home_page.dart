import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notification_mobile_client/services/messaging_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'homepage';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? firebaseToken;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getToken();
    });
  }

  void getToken() async {
    String? token = await MessagingApi().initNotifications();
    if (token != null) {
      setState(() {
        firebaseToken = token;
      });
    }
  }

  Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            messaging.getToken ?? 'Token not found',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          IconButton(
              onPressed: () =>
                  copyToClipboard(messaging.getToken ?? 'Token not found'),
              icon: const Icon(Icons.copy))
        ],
      ),
    );
  }
}
