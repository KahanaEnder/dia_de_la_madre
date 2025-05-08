import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('Encabezado del Drawer'),
              ),
              ListTile(
                title: Text('Elemento 1'),
                onTap: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("TITULO",style: Theme.of(context).textTheme.titleLarge,),
          // No se especifica 'leading' para mantener el ícono de menú predeterminado
          actions: [
            IconButton(
              icon: Icon(Icons.heart_broken_sharp),
              onPressed: () {
                // Acción personalizada
                print('Ícono personalizado presionado');
              },
            ),
          ],
        ),
        body: Center(child: Text('Contenido principal')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text("Botón"),),
      ),
    );
  }
}