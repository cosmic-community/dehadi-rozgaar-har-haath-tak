import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Top-level function for background messages
Future<void> _handleBackgroundMessage(RemoteMessage message) async {
  print('Background message: ${message.messageId}');
}

class NotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications = 
      FlutterLocalNotificationsPlugin();
  
  Future<void> initialize() async {
    // Request permissions
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    
    // Get FCM token
    String? token = await _messaging.getToken();
    print('FCM Token: $token');
    
    // Initialize local notifications
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOS = DarwinInitializationSettings();
    const settings = InitializationSettings(android: android, iOS: iOS);
    await _localNotifications.initialize(settings);
    
    // Handle foreground messages
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    
    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
  }
  
  void _handleForegroundMessage(RemoteMessage message) {
    // Show local notification
    _showLocalNotification(message);
  }
  
  Future<void> _showLocalNotification(RemoteMessage message) async {
    const androidDetails = AndroidNotificationDetails(
      'dehadi_channel',
      'Dehadi Notifications',
      channelDescription: 'Notifications for job matches and updates',
      importance: Importance.high,
      priority: Priority.high,
    );
    
    const iOSDetails = DarwinNotificationDetails();
    
    const details = NotificationDetails(
      android: androidDetails,
      iOS: iOSDetails,
    );
    
    await _localNotifications.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      message.notification?.title ?? 'Dehadi',
      message.notification?.body ?? '',
      details,
    );
  }
  
  Future<String?> getToken() async {
    return await _messaging.getToken();
  }
}