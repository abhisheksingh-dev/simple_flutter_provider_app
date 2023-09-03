import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_provider_app/provider/user_status_provider.dart';
import 'package:simple_provider_app/screens/home/view/home_view.dart';

class App extends StatelessWidget {
  App({super.key});

  final UserStatusProvider _userStatusProvider = UserStatusProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: _userStatusProvider)],
      child: const MaterialApp(
        title: 'Simple Provider App',
        home: HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
