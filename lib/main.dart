import 'package:flutter/material.dart';
import 'firebase_notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'home.dart';

// 백그라운드에서 메시지를 처리하기 위한 핸들러
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // 필요한 초기화
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  // FCM 토큰을 확인하고 데이터베이스에 저장하는 함수 호출
  await FirebaseNotificationHandler.initTokenAndSaveToDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHome(),
    );
  }
}
