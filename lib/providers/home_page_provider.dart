import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/home_page_controller.dart';

final homePageControllerProvider =
    Provider<HomePageController>((ref) => HomePageController());
