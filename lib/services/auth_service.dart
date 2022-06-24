import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthException implements Exception{
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? appUser;
  bool isLoading = true;

  AuthService(){
    _authCheck();
  }

  _authCheck(){
    _auth.authStateChanges().listen((User? user) {
      appUser = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser(){
    appUser = _auth.currentUser;
    notifyListeners();
  }

  register(String email, String password) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch(e){
      if(e.code == 'weak-password'){
        throw AuthException('A senha é fraca.');
      } else if(e.code == 'email-already-in-use'){
        throw AuthException('Este e-mail já está cadastrado.');
      }
    }
  }

  login(String email, String password) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        throw AuthException('E-mail não encontrado. Faça seu cadastro.');
      } else if(e.code == 'wrong-password'){
        throw AuthException('Senha incorreta Tente novamente.');
      }
    }
  }

  logout() async{
    await _auth.signOut();
    _getUser();
  }
}