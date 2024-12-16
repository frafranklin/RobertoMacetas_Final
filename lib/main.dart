import 'package:flutter/material.dart';
// Importa las pantallas del primer bloque
import 'pages/login_screen.dart';
import 'pages/register_screen.dart';
import 'pages/main_screen.dart';

import 'pages/AutoServicioparaEmpleados.dart';
import 'pages/GestiondeNominayBeneficios.dart';
import 'pages/ReclutamientoySeleccion.dart';

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
        '/capacitacionTecnica': (context) => GestiondeNominayBeneficios(),
        '/capacitacionSeguridad': (context) => AutoServicioparaEmpleados(),
        '/capacitacionLiderazgo': (context) => ReclutamientoySeleccion(),
      },
      theme: ThemeData(
        primaryColor: Colors.purple,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.purple,
          secondary: Colors.deepPurpleAccent,
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
