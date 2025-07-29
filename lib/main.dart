import 'dart:io';
import 'package:app/data/data.dart';
import 'package:app/models/current_track_model.dart';
import 'package:app/screen/home/home_layout.dart';
import 'package:app/screen/play_list_screen.dart';
import 'package:app/widgets/current_tracks.dart';
import 'package:app/widgets/material_apps.dart';
import 'package:app/widgets/side_menu.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isMacOS || Platform.isLinux || Platform.isWindows)) {
    await DesktopWindow.setWindowSize(const Size(600, 800));
  }
  runApp(ChangeNotifierProvider(create:(context) => CurrentTrackModel(),child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
     designSize: Size(400, 790),
     builder: (_, _) => MaterialApps(),
   );
  }
}


// darkTheme: ThemeData(
//   brightness: Brightness.dark,
//   appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
//   scaffoldBackgroundColor: const Color(0xFF121212),
//   colorScheme: ColorScheme.dark(
//     background: const Color(0xFF121212),
//     secondary: const Color(0xFF1DB954),
//   ),
//
//
//   // backgroundColor: const Color(0xFF121212),
//   primaryColor: Colors.black,
//   // accentColor: const Color(0xFF1DB954),
//
//   iconTheme: const IconThemeData().copyWith(color: Colors.white),
//   fontFamily: 'Montserrat',
//   textTheme: TextTheme(
//     headlineLarge: const TextStyle(
//       color: Colors.white,
//       fontSize: 32.0,
//       fontWeight: FontWeight.bold,
//     ),
//     headlineSmall: TextStyle(
//       fontSize: 12.0,
//       color: Colors.grey[300],
//       fontWeight: FontWeight.w500,
//       letterSpacing: 2.0,
//     ),
//     bodyLarge: TextStyle(
//       color: Colors.grey[300],
//       fontSize: 14.0,
//       fontWeight: FontWeight.w600,
//       letterSpacing: 1.0,
//     ),
//     bodySmall: TextStyle(
//       color: Colors.grey[300],
//       letterSpacing: 1.0,
//     ),
//   ),
// ),


