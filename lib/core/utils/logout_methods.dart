
import '../../features/auth_screen/view/screens/login_screen/login_screen.dart';
import '../../features/auth_screen/view_model/auth_cubit/cubit.dart';
import 'navigation.dart';

 class Logout {
   static void logoutMethod(context) {
     AuthCubit.get(context).reset();
     AuthCubit.get(context).logOut();
     Navigation.pushAndReplace(context , const LoginScreen());
   }
 }
