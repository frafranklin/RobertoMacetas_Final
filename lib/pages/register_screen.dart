import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void register() async {
    const String url = "http://192.168.227.76/flutter_app/insert_user.php";
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
      if (responseData['success']) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registro exitoso. Vuelve a iniciar sesión.")),
        );
        Navigator.pop(context); // Regresa a la pantalla anterior
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(responseData['message'] ?? "Error al registrar")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al conectar con el servidor: $e")),
      );
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Registro",
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
                    labelText: "Nuevo Usuario",
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
                ElevatedButton(
                  onPressed: register,
                  child: Text("Registrar"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purpleAccent, // Color del fondo
                    foregroundColor: Colors.white, // Color del texto
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Bordes redondeados
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
