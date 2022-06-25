import 'package:coronavirus_rest_api_flutter_course/app/repository/data_repository.dart';
import 'package:coronavirus_rest_api_flutter_course/app/service/api_service.dart';
import 'package:coronavirus_rest_api_flutter_course/app/ui/dashboard.dart';
import 'package:provider/provider.dart';
import 'app/service/api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<DataRepository>(
      create: (_) => DataRepository(
        apiService: APIService(API.sandbox()),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coronavirus Tracker',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF101010),
          cardColor: const Color(0xFF222222),
        ),
        home: const Dashboard(),
      ),
    );
  }
}
