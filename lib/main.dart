import 'package:flutter/material.dart';
// Importa las pantallas del primer bloque
import 'pages/login_screen.dart';
import 'pages/register_screen.dart';
import 'pages/main_screen.dart';

import 'pages/AsesoriaFinanzas.dart';
import 'pages/pageMaeketing.dart';
import 'pages/AsesorVentas.dart';
import 'pages/AsesoriaTecnologia.dart';

void main() => runApp(AppCorporativa());

class AppCorporativa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplicación Corporativa',
      initialRoute: '/login', // Ruta inicial
      routes: {
        // Rutas del primer bloque
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        // Pasar un valor predeterminado a MainScreen
        '/main': (context) => MainScreen(username: 'Usuario'),

        // Rutas del segundo bloque
        '/marketingasesoria': (context) => pageMaeketing(),
        '/asesoriafinanzas': (context) => AsesoriaFinanzas(),
        '/capacitacionLiderazgo': (context) => AsesorVentas(),
        '/asesoriatecnolgia': (context) => AsesoriaTecnologia(),
      },
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 18, 78, 189),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 26, 179, 47),
          secondary: const Color.fromARGB(255, 223, 94, 20),
        ),
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
