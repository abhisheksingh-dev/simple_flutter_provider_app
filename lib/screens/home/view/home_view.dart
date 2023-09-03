// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:simple_provider_app/const.dart';
import 'package:simple_provider_app/provider/user_status_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Change User Status'),
      ),
      body: Consumer<UserStatusProvider>(
        builder: (context, value, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(value.status.name),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (value.status == UserStatus.loggedIn) {
                      await HapticFeedback.heavyImpact();
                      ScaffoldMessenger.of(context)
                        ..clearSnackBars()
                        ..showSnackBar(const SnackBar(
                            content: Text('User Already Logged In')));
                      return;
                    }
                    value.changeUserStatus(isLoogedIn: true);
                  },
                  child: const Text('Login user'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    if (value.status == UserStatus.idle) {
                      await HapticFeedback.heavyImpact();
                      ScaffoldMessenger.of(context)
                        ..clearSnackBars()
                        ..showSnackBar(const SnackBar(
                            content: Text('User Already Logged out')));
                      return;
                    }
                    value.changeUserStatus(isLoogedIn: false);
                  },
                  child: const Text('Logout user'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
