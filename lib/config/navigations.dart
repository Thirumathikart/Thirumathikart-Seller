import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:thirumathikart_seller/bindings/home_bindings.dart';
import 'package:thirumathikart_seller/bindings/login_bindings.dart';
import 'package:thirumathikart_seller/bindings/add_edit_products_binding.dart';
import 'package:thirumathikart_seller/bindings/past_orders_binding.dart';
import 'package:thirumathikart_seller/bindings/todays_orders_bindings.dart';
import 'package:thirumathikart_seller/bindings/profile_bindings.dart';
import 'package:thirumathikart_seller/bindings/earning_bindings.dart';
import 'package:thirumathikart_seller/constants/navigation_routes.dart';
import 'package:thirumathikart_seller/views/add_edit_product_page.dart';
import 'package:thirumathikart_seller/views/home_page.dart';
import 'package:thirumathikart_seller/views/login.dart';
import 'package:thirumathikart_seller/views/past_orders.dart';
import 'package:thirumathikart_seller/views/todays_orders.dart';
import 'package:thirumathikart_seller/views/profile.dart';
import 'package:thirumathikart_seller/views/earning.dart';

class NavigationPages {
  static List<GetPage<dynamic>> getPages() => [
        GetPage(
          name: NavigationRoutes.home,
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: NavigationRoutes.editProduct,
          page: AddEditProductPage.new,
          binding: AddEditProductsBindings(),
        ),
        GetPage(
          name: NavigationRoutes.addProduct,
          page: AddEditProductPage.new,
          binding: AddEditProductsBindings(),
        ),
        GetPage(
          name: NavigationRoutes.loginRoute,
          page: () => const LoginPage(),
          binding: LoginBindings(),
        ),
        GetPage(
          name: NavigationRoutes.profileRoute,
          page: () => const ProfilePage(),
          binding: ProfileBindings(),
        ),
        GetPage(
          name: NavigationRoutes.earningRoute,
          page: () => const EarningPage(),
          binding: EarningBindings(),
        ),
        GetPage(
          name: NavigationRoutes.todaysOrdersRoute,
          page: () => const TodaysOrdersPage(),
          binding: TodaysOrdersBindings(),
        ),
        GetPage(
          name: NavigationRoutes.pastOrdersRoute,
          page: () => const PastOrdersPage(),
          binding: PastOrdersBindings(),
        ),
      ];
}
