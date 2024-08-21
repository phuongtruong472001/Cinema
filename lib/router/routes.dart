import 'package:flutter/material.dart';
import 'package:s7_cinema/pages/admin/comp_film.dart';
import 'package:s7_cinema/pages/admin/comp_theater.dart';
import 'package:s7_cinema/pages/admin/home_ad.dart';
import 'package:s7_cinema/pages/admin/movie_management.dart';
import 'package:s7_cinema/pages/login.dart';
import 'package:s7_cinema/pages/movie_book.dart';
import 'package:s7_cinema/pages/sign_up.dart';

import '../pages/pages.dart';

class Routes {
  static const String initialRoute = 'login';

  static Map<String, WidgetBuilder> routes = {
    'login': (_) => const LoginPage(),
    'register': (_) => const SignUpScreen(),
    'home': (_) => const HomePage(),
    'details': (_) => const DetailsPage(),
    'book': (_) => const MovieBook(),
    'home_ad': (_) => const HomeAd(),
    'movie_management': (_) => const MovieManagementPage(),
    'comp_film': (_) => const CompFilm(),
     'theater': (_) => const CompTheater(),
    // 'schedule': (_) => const SchedulePage(),
    // 'profile': (_) => const Profile(),
  };
}
