import 'package:flutter/material.dart';

import 'cadastro.screen.dart';
import 'overview.screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(children: [
              TextFormField(
                onSaved: (value) => {},
                decoration: const InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none),
                    fillColor: Color.fromARGB(22, 68, 137, 255),
                    filled: true,
                    prefixIcon: Icon(Icons.person)),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                onSaved: (value) => {},
                decoration: const InputDecoration(
                    hintText: "Senha",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none),
                    fillColor: Color.fromARGB(22, 68, 137, 255),
                    filled: true,
                    prefixIcon: Icon(Icons.person)),
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => OverviewScreen()),
                  )
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF448AFF),
                    padding: const EdgeInsets.all(20)),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CadastroScreen()),
                  )
                },
                child: const Text(
                  "Cadastro",
                  style: TextStyle(color: Color(0xFF448AFF)),
                ),
              )
            ])));
  }
}
