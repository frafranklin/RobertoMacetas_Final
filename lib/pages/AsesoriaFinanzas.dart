import 'package:flutter/material.dart';

class AsesoriaFinanzas extends StatelessWidget {
  const AsesoriaFinanzas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asesoria en Finanzas'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del mentor
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/mentor_marketing.jpg', // Cambia por tu imagen
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Título y descripción
            const Text(
              "Juan Pérez - Mentor en Marketing",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Con más de 10 años de experiencia en marketing digital y estrategias comerciales, Juan ha ayudado a más de 100 empresas a alcanzar sus objetivos de negocio mediante campañas efectivas. Su enfoque práctico garantiza resultados visibles en el corto plazo.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            // Información adicional
            const Text(
              "Áreas de experiencia:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const BulletPoint(text: "Estrategias de Marketing Digital."),
            const BulletPoint(text: "Optimización de campañas publicitarias."),
            const BulletPoint(text: "Análisis de métricas y ROI."),
            const BulletPoint(text: "Gestión de redes sociales."),
            const SizedBox(height: 20),
            // Botón para más información
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Acción del botón (puede ser navegación)
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Más información próximamente."),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Contactar al Mentor",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget para puntos de lista
class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("• ", style: TextStyle(fontSize: 16, color: Colors.black54)),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
      ],
    );
  }
}
