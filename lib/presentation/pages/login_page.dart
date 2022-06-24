import 'package:flutter/material.dart';
import 'package:liberapp/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  bool isLogin = true;
  late String title;
  late String actionButton;
  late String toggleButton;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool action) {
    setState(() {
      isLogin = action;
      if (isLogin) {
        title = "Bem vindo";
        actionButton = "Entrar";
        toggleButton = "Ainda não tem conta? Faça seu cadastro.";
      } else {
        title = "Crie sua conta";
        actionButton = "Cadastrar";
        toggleButton = "Já tem conta? Faça login.";
      }
    });
  }

  login() async {
    setState(()=> loading = true);
    try {
      await context.read<AuthService>().login(email.text, password.text);
    } on AuthException catch (e) {
      setState(()=>loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  register() async {
    setState(()=>loading = true);
    try {
      await context.read<AuthService>().register(email.text, password.text);
    } on AuthException catch (e) {
      setState(()=>loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.5),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Informe o e-mail corretamente.";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 24.0),
                child: TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Senha"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe sua senha.';
                    } else if (value.length < 6) {
                      return 'Sua senha deve ter no mínimo 6 caracteres';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(24),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        if (isLogin) {
                          login();
                        } else {
                          register();
                        }
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: (loading)
                      ? [
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ]
                      :[
                        const Icon(Icons.check),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            actionButton,
                            style: const TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  )),
              TextButton(
                onPressed: () => setFormAction(!isLogin),
                child: Text(toggleButton),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
