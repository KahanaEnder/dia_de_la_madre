import 'package:flutter/material.dart';

class HouseScreen extends StatelessWidget {
  const HouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SONADORA'),
        centerTitle: true,
        elevation: 30,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurpleAccent,
              Colors.indigo,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Imagen principal
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/1.jpg',
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Texto descriptivo
                  Text(
                    'Un lugar conseguido con sacrificio',
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,),
                  const SizedBox(height: 20),
                  // Sección de iconos decorativos
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      DecorIcon(icon: Icons.house_siding_sharp, label: ''),
                    ],
                  ),
                  SizedBox(
                    height: 92,
                  ),// Tarjeta de información adicional
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            'Con trabajo, dedicación y paciencia has logrado construir otro hogar donde poder cumplir cualquier sueño, cuando lo veas siempre recuerda que es el fruto de tu perseverancia',
                            style: Theme.of(context).textTheme.bodyLarge,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
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

// Widget de icono decorativo con etiqueta
class DecorIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const DecorIcon({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 100,
          backgroundColor: Colors.white24,
          child: Icon(icon, size: 100, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}
