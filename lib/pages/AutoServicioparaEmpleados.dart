import 'package:flutter/material.dart';

class AutoServicioparaEmpleados extends StatelessWidget {
  const AutoServicioparaEmpleados({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto-Servicio para Empleados'),
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
                    Icons.edit,
                    Colors.red,
                    'Actualización de Información Personal',
                    'Modificación de datos de contacto y dirección.\nActualización de información bancaria y de emergencia.',
                  ),
                  _buildDivider(),
                  _buildListTile(
                    context,
                    Icons.request_page,
                    Colors.blue,
                    'Gestión de Solicitudes',
                    'Solicitud de permisos, licencias y vacaciones.\nSeguimiento del estado de las solicitudes en tiempo real.',
                  ),
                  _buildDivider(),
                  _buildListTile(
                    context,
                    Icons.assignment,
                    Colors.green,
                    'Acceso a Documentos Personales',
                    'Descarga de contratos laborales y recibos de pago.\nVisualización de certificados de trabajo y antigüedad.',
                  ),
                  _buildDivider(),
                  _buildListTile(
                    context,
                    Icons.poll,
                    Colors.orange,
                    'Consulta de Asistencia y Rendimiento',
                    'Revisión del historial de asistencias.\nEvaluaciones de desempeño y comentarios.',
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
