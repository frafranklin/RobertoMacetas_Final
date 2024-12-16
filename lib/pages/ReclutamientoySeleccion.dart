import 'package:flutter/material.dart';

class ReclutamientoySeleccion extends StatelessWidget {
  const ReclutamientoySeleccion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reclutamiento y Selección'),
        centerTitle: true, // Centra el título
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selecciona alguna opción:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16), // Espaciado
            Expanded(
              child: ListView(
                children: [
                  _buildListTile(
                    context,
                    Icons.work_outline,
                    Colors.blue,
                    'Gestión de Vacantes',
                    'Creación y publicación de ofertas de empleo.\nDifusión automática en plataformas internas y externas.',
                  ),
                  _buildDivider(),
                  _buildListTile(
                    context,
                    Icons.person_add,
                    Colors.green,
                    'Seguimiento de Candidatos',
                    'Análisis y clasificación de currículums.\nRegistro del progreso de los postulantes en el proceso.',
                  ),
                  _buildDivider(),
                  _buildListTile(
                    context,
                    Icons.schedule,
                    Colors.orange,
                    'Programación de Entrevistas',
                    'Coordinación de horarios con candidatos y panelistas.\nEvaluación y registro de resultados de las entrevistas.',
                  ),
                  _buildDivider(),
                  _buildListTile(
                    context,
                    Icons.assessment,
                    Colors.red,
                    'Evaluaciones de Competencias',
                    'Aplicación de pruebas técnicas y psicométricas en línea.\nGeneración automática de reportes con resultados.',
                  ),
                  _buildDivider(),
                  _buildListTile(
                    context,
                    Icons.new_releases,
                    Colors.purple,
                    'Onboarding Digital',
                    'Registro inicial de empleados contratados.\nCapacitación en línea y entrega de documentación digital.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildListTile(
    BuildContext context,
    IconData icon,
    Color color,
    String title,
    String subtitle,
  ) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: PopupMenuButton<String>(
        onSelected: (value) {
          // Aquí se puede manejar la acción si lo deseas.
        },
        itemBuilder: (BuildContext context) => [
          const PopupMenuItem<String>(
            value: 'moreInfo',
            child: Text('Más Información'),
          ),
          const PopupMenuItem<String>(
            value: 'update',
            child: Text('Actualizar'),
          ),
          const PopupMenuItem<String>(
            value: 'edit',
            child: Text('Editar'),
          ),
        ],
        icon: const Icon(Icons.more_vert),
      ),
    );
  }

  Divider _buildDivider() {
    return const Divider();
  }
}
