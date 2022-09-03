import 'package:school_meal/routes/routes.dart';
import 'package:school_meal/ui/page/search_page/search_page.dart';

abstract class Pages {
  Pages._();

  static const initialPage = Routes.search;

  static final routes = {
    Routes.search : (context) => const SearchPage(),
  };
}