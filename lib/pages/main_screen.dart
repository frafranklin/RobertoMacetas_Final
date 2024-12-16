import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final String username; // Parámetro para el nombre del usuario

  const MainScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text(
          'Portal de Recursos Humanos',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Mensaje de bienvenida
            Text(
              'Bienvenido, $username\nal Portal de Recursos Humanos',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 40),

            // Botones estilizados
            _buildProfessionalButton(
              context,
              'Asesoría en Marketing',
              Icons.campaign,
              '/marketingasesoria',
            ),
            const SizedBox(height: 20),
            _buildProfessionalButton(
              context,
              'Asesoría en Finanzas',
              Icons.attach_money,
              '/asesoriafinanzas',
            ),
            const SizedBox(height: 20),
            _buildProfessionalButton(
              context,
              'Asesoría en Tecnología',
              Icons.computer,
              '/asesoriatecnolgia',
            ),
            const SizedBox(height: 20),
            _buildProfessionalButton(
              context,
              'Asesoría en Ventas',
              Icons.sell,
              '/capacitacionLiderazgo',
            ),
          ],
        ),
      ),
    );
  }

  // Widget reutilizable para botones estilizados
  Widget _buildProfessionalButton(
      BuildContext context, String text, IconData icon, String route) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        icon: Icon(icon, color: Colors.white, size: 26),
        label: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          elevation: 3,
          shadowColor: Colors.grey.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }
}
