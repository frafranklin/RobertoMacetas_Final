import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false; // Para mostrar el indicador de carga

  // Método de login
  void login() async {
    const String url = "http://192.168.227.76/flutter_app/validate_user.php";

    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Por favor, completa todos los campos")),
      );
      return;
    }

    setState(() {
      isLoading = true; // Inicia la carga
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": usernameController.text,
          "password": passwordController.text,
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200 && responseData['success']) {
        Navigator.pushNamed(
            context, '/main'); // Redirige si el login es exitoso
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text(responseData['message'] ?? "Error al iniciar sesión")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al conectar con el servidor")),
      );
    } finally {
      setState(() {
        isLoading = false; // Finaliza la carga
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurpleAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bienvenido",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 40),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: "Usuario",
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white24,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Contraseña",
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white24,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 30),
                  isLoading
                      ? CircularProgressIndicator() // Indicador de carga
                      : ElevatedButton(
                          onPressed: login,
                          child: Text("Ingresar"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors
                                .purpleAccent, // Color del fondo del botón
                            foregroundColor: Colors.white, // Color del texto
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Bordes redondeados
                            ),
                          ),
                        ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      "¿No tienes cuenta? Regístrate",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
