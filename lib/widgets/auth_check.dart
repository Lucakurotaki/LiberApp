import 'package:flutter/material.dart';
import 'package:liberapp/presentation/pages/home_page.dart';
import 'package:liberapp/services/auth_service.dart';
import 'package:provider/provider.dart';

import '../presentation/pages/login_page.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if(auth.isLoading){
      return loading();
    }else if(auth.appUser == null){
      return const LoginPage();
    }else{
      return const MyHomePage();
    }
  }

  loading(){
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}