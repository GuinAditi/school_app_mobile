// import 'package:flutter/material.dart';
// import 'package:school_app_mvp/features/dashboard/presentation/teacher/widgets/teacher_dashboard.dart';
// import 'package:school_app_mvp/theme/app_theme.dart';
// import 'features/auth/presentation/login_screen.dart';

// import 'features/dashboard/presentation/student/student_dashboard.dart';
// import 'features/dashboard/presentation/teacher/widgets/teacher_dashboard.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Edu App',
//       debugShowCheckedModeBanner: false,
//       theme: AppTheme.lightTheme,
//       initialRoute: '/dashboard',
//       routes: {
//         '/': (_) => const LoginScreen(),
//         '/dashboard': (_) => const StudentDashboardScreen(),
//         '/teacher': (_) => const TeacherDashboardScreen(),
//       },
//     );
//   }
// }

// ...existing code...
import 'package:flutter/material.dart';
import 'package:school_app_mvp/theme/app_theme.dart';
import 'package:school_app_mvp/features/auth/presentation/login_screen.dart';
import 'package:school_app_mvp/features/dashboard/presentation/student/student_dashboard.dart';
import 'package:school_app_mvp/features/dashboard/presentation/teacher/widgets/teacher_dashboard.dart';

// ...existing code...
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edu App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/dashboard',
      routes: {
        '/': (_) => const LoginScreen(),
        // '/dashboard': (_) => const StudentDashboardScreen(),
        '/dashboard': (_) => const TeacherDashboardScreen(),
        // '/teacher': (_) => const TeacherDashboardScreen(),
      },
    );
  }
}
// ...existing code...
