import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final String username; // Agregamos el nombre del usuario como parámetro

  MainScreen({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portal de Recursos Humanos'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Mostrar el título centrado con el nombre del usuario
            Text(
              'Bienvenido, al Portal de \n Recursos Humanos',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40), // Separación del título y los botones
            // Botón 1: Asesoria en Marketing
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/marketingasesoria');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('Asesoria en Marketing'),
              ),
            ),
            const SizedBox(height: 20),
            // Botón 2: Auto-Servicio para Empleados
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/asesoriafinanzas');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('Asesoria en Finanzas'),
              ),
            ),
            const SizedBox(height: 20),
            // Botón 3: Asesoria en Ventas
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/capacitacionLiderazgo');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('Asesoria en Ventas'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
