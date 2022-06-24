import 'package:flutter/material.dart';
import 'package:liberapp/services/auth_service.dart';
import 'package:provider/provider.dart';


class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minha conta", style: TextStyle(color: Colors.white, fontSize: 20),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: OutlinedButton(
            onPressed: (){
              context.read<AuthService>().logout();
              Navigator.pop(context);
            },
            style: OutlinedButton.styleFrom(
              primary: Colors.red,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.logout),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Sair da conta',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}