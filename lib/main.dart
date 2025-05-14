import 'dart:io';
import 'package:flutter/material.dart';
import 'package:reference_app/src/components/my_materials.dart'; //Imports
import 'package:window_size/window_size.dart';
import 'package:provider/provider.dart';
import 'package:reference_app/src/core/service/permission_service.dart';
import 'package:reference_app/src/core/service/image_service.dart';
import 'package:reference_app/src/core/providers/image_provider.dart';

///[Const]
//Las propiedades y widgets CONST optimizan la App ya que no se reconstruyen con estados si no que son estaticas

///[Estructura]
/*Hay varias formas de organizar la aplicación y proyecto
se puede crear directamente un MVC en lib o ponerlo dentro de una carpeta
source o src y usar una arquitectura adecuada o que se quiera,
dividiendo en components y widgets donde van estos mismos y fragmentos de logica,
views donde pueden estar las screens y modelos donde esten las plantillas y clases
por ejemplo una clase static con los colores de la app para acceder a ellas de forma
organizada y mas estandarizada que con ENUMS*/


///[Comandos] => flutter doctor,flutter clean, flutter build windows


/*
TO DO implementar como esta organizado este proyecto
con corchetes se puede hablar de clases y widgets en comentarios
por ejemplo referencia a [MainApp] o [Scaffold]
*/

// [MainApp]
/// Solo funciona con comentarios con triple ///
/// [MainApp] 

///[Importante] 
///Crear la carpeta assets para agregar cualquier elemento al proyecto
///y agregar la ubicacion en el yaml y recargar el pubspec
///Ahi tambien se pueden añadir el nombre y descripción de la app
///ademas de añadir las dependencias y librerias que usemos


///[Descripción] tambien del yaml modificar el README.markdown


///[Assets y material]
/*
flutter:
  uses-material-design: true
  assets:
    - assets/fonts/
    - assets/images/
    - assets/icons/
*/
//Es la forma correcta de agregar carpetas al pubspec
///[Se agrega la dependencia window_size para modificar las dimensiones en PC]
void main() async { //Metodo Main
  WidgetsFlutterBinding.ensureInitialized(); 

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('Para mi mamá');
    setWindowMinSize(const Size(426, 240));
    setWindowMaxSize(const Size(480, 720));
    setWindowFrame(const Rect.fromLTWH(100, 100, 480, 720));
  }
  runApp(MultiProvider(
      providers: [
        Provider(create: (_) => PermissionService()),
        Provider(create: (_) => ImageService()),
        ChangeNotifierProvider(
          create: (context) => ImageGalleryProvider(
            context.read<PermissionService>(),
            context.read<ImageService>(),
          ),
        ),
      ],
      child: const MainApp(),
    ),);
}

///[Atajos]
/* 
Se puede parar encima de un widget y darle a la bombilla amarilla o CTRL + .
para extraer el widget y crearlo como una clase aparte y modularizarlo o lo mismo
con metodos y variables o wrappear facilmente widgets en otros.

Ademas sirve para convertir funciones en async o cambiarlas de funciones con cuerpo
a funciones arrow mas limpias rapidamente.

y con CTRL + ESPACIO sugerencias de propiedades y metodos
*/

class MainApp extends StatelessWidget { //Widget estatico no tiene estados
  const MainApp({super.key});

  @override //Se sobreescribe el metodo build para crear widgets personalizados
  Widget build(BuildContext context) { //Recoge el contexto de los widgets,metodos y propiedades sacados del arbol de widgets
    return const MyMaterials();
  }
}
