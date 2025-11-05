import 'package:flutter/material.dart';

import '../screens/welcome_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/role_selection_screen.dart';
import '../screens/worker/worker_registration.dart';
import '../screens/worker/worker_dashboard.dart';
import '../screens/worker/job_list_screen.dart';
import '../screens/worker/worker_profile_screen.dart';
import '../screens/employer/employer_registration.dart';
import '../screens/employer/employer_dashboard.dart';
import '../screens/employer/post_job_screen.dart';
import '../screens/employer/community_groups_screen.dart';
import '../screens/employer/applicants_screen.dart';
import '../screens/shared/settings_screen.dart';
import '../screens/shared/notifications_screen.dart';

class AppRoutes {
  static const String welcome = '/';
  static const String register = '/register';
  static const String login = '/login';
  static const String roleSelection = '/role-selection';
  static const String workerRegistration = '/worker-registration';
  static const String workerDashboard = '/worker-dashboard';
  static const String jobList = '/job-list';
  static const String workerProfile = '/worker-profile';
  static const String employerRegistration = '/employer-registration';
  static const String employerDashboard = '/employer-dashboard';
  static const String postJob = '/post-job';
  static const String communityGroups = '/community-groups';
  static const String applicants = '/applicants';
  static const String settings = '/settings';
  static const String notifications = '/notifications';

  static Map<String, WidgetBuilder> get routes => {
        welcome: (context) => const WelcomeScreen(),
        register: (context) => const RegisterScreen(),
        login: (context) => const LoginScreen(),
        roleSelection: (context) => const RoleSelectionScreen(),
        workerRegistration: (context) => const WorkerRegistrationScreen(),
        workerDashboard: (context) => const WorkerDashboardScreen(),
        jobList: (context) => const JobListScreen(),
        workerProfile: (context) => const WorkerProfileScreen(),
        employerRegistration: (context) => const EmployerRegistrationScreen(),
        employerDashboard: (context) => const EmployerDashboardScreen(),
        postJob: (context) => const PostJobScreen(),
        communityGroups: (context) => const CommunityGroupsScreen(),
        settings: (context) => const SettingsScreen(),
        notifications: (context) => const NotificationsScreen(),
      };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    // Handle dynamic routes here if needed
    switch (settings.name) {
      case applicants:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (context) => ApplicantsScreen(
            jobId: args?['jobId'] ?? '',
          ),
        );
      default:
        return null;
    }
  }
}