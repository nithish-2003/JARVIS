import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'services/database_service.dart';
import 'services/notification_service.dart';
import 'services/voice_service.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Request permissions
  await Permission.microphone.request();
  await Permission.notification.request();
  
  // Initialize services
  DatabaseService();
  NotificationService();
  VoiceService();
  
  runApp(const DarlingAssistant());
}

class DarlingAssistant extends StatelessWidget {
  const DarlingAssistant({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Darling Assistant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const HomeScreen(),
    );
  }
}
