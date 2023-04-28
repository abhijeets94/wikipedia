import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wiki/provider/search_provider.dart';
import 'package:wiki/routes.dart';
import 'package:wiki/screens/home_screen.dart';

import 'constants/api_routes.dart';

void main() {
  Dio dio = Dio();
  dio.interceptors
      .add(DioCacheManager(CacheConfig(baseUrl: baseUrl())).interceptor);
  runApp(const Wikipedia());
}

class Wikipedia extends StatelessWidget {
  const Wikipedia({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WikiProvider>(
      create: (_) => WikiProvider(),
      lazy: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wikipedia',
        home: HomeScreen(),
        onGenerateRoute: PageRoutes().pages,
      ),
    );
  }
}
