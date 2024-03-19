import 'package:interview_task/src/services/auth_service.dart';
import 'package:interview_task/src/services/home_service.dart';
import 'package:interview_task/src/ui/views/blank_view.dart';
import 'package:interview_task/src/ui/views/checklist_item/checklist_item_view.dart';
import 'package:interview_task/src/ui/views/create_checklist/create_checklist_view.dart';
import 'package:interview_task/src/ui/views/home/home_view.dart';
import 'package:interview_task/src/ui/views/main/main_view.dart';
import 'package:interview_task/src/ui/views/login/login_view.dart';
import 'package:interview_task/src/ui/views/profile/profile_view.dart';
import 'package:interview_task/src/ui/views/sign_up/sign_up_view.dart';
import 'package:interview_task/src/ui/views/splash_screen/splash_screen_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreenView, initial: true),
    CupertinoRoute(page: SignUpView),
    CupertinoRoute(page: LoginView),
    CupertinoRoute(page: MainView),
    CupertinoRoute(page: HomeView),
    CupertinoRoute(page: BlankView),
    CupertinoRoute(page: ProfileView),
    CupertinoRoute(page: ChecklistItemView),
    CupertinoRoute(page: CreateChecklistView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: HomeService),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
  /** flutter pub run build_runner build --delete-conflicting-outputs */
}
