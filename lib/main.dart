import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:liberapp/presentation/repositories/cart_repository.dart';
import 'package:liberapp/presentation/repositories/orders_repository.dart';
import 'package:liberapp/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'presentation/repositories/favorites_repository.dart';
import 'my_app.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => AuthService()),
      ChangeNotifierProvider(create: (context)=> FavoritesRepository(
        auth: context.read<AuthService>(),
      )),
      ChangeNotifierProvider(create: (context)=> CartRepository(
        auth: context.read<AuthService>(),
      )),
      ChangeNotifierProvider(create: (context)=> OrdersRepository(
        auth: context.read<AuthService>(),
      )),
    ],
    
    child: const MyApp(),)
    );
    
}

