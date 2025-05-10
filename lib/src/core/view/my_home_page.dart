import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:reference_app/src/components/app_colors.dart';
import 'package:reference_app/src/core/view/ambar_screen.dart';
import 'package:reference_app/src/core/view/favorite_screen.dart';
import 'package:reference_app/src/core/view/reasons/house_screen.dart';
import 'package:reference_app/src/core/view/reasons/mami_screen.dart';
import 'package:reference_app/src/core/view/reasons/reason_screen.dart';
import 'package:reference_app/src/core/view/reasons/settings_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isSnackBarVisible = false;

  Future<bool> _requestStoragePermission() async {
  if (Platform.isAndroid) {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    final sdkInt = androidInfo.version.sdkInt;

    if (sdkInt >= 33) {
      final status = await Permission.photos.request();
      return status.isGranted;
    } else {
      final status = await Permission.storage.request();
      return status.isGranted;
    }
  }

  return false; // iOS u otro
}




  void _navigateToScreen(BuildContext context,Widget Function() screenBuilder) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screenBuilder())); 
  }


  final ImagePicker _picker = ImagePicker();
  List<XFile> _images = [];

  @override
  void initState() {
    super.initState();
    _loadSavedImages(); // opcional si quieres mostrar aquí también
  }

  Future<void> _loadSavedImages() async {
    final prefs = await SharedPreferences.getInstance();
    final paths = prefs.getStringList('saved_image_paths') ?? [];
    // Si quieres llenar _images con XFile (y mostrarlos en Home)
    setState(() {
      _images = paths.map((p) => XFile(p)).where((xf) => File(xf.path).existsSync()).toList();
    });
  }

Future<void> _pickImages() async {
  // 1. Solicitar permisos según versión de Android
  final hasPermission = await _requestStoragePermission();
  if (!mounted) return;

if (!hasPermission) {
  if (!_isSnackBarVisible) {
    _isSnackBarVisible = true;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sin Permiso'),
        duration: Duration(seconds: 2),
      ),
    ).closed.then((_) {
      if (mounted) {
        setState(() {
          _isSnackBarVisible = false;
        });
      }
    });
  }
  return;
}

    try {
      // 2. Selección
      final List<XFile> selected = await _picker.pickMultiImage();
      if (!mounted) return;
      if (selected.isEmpty) return;

      // 3. Guardar en tu estado local (opcional si no los muestras aquí)
      setState(() {
        _images.addAll(selected);
      });

      // 4. Guardar rutas en SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      // Si quieres **añadir** a las rutas existentes:
      final old = prefs.getStringList('saved_image_paths') ?? [];
      final added = selected.map((xf) => xf.path).toList();
      await prefs.setStringList('saved_image_paths', [...old, ...added]);

      /// ignore: use_build_context_synchronously [Ignorado el context que puede ser peligroso necesita refactor]
      ScaffoldMessenger.of(context).showSnackBar(
        /// ignore: use_build_context_synchronously [Ignorado el context que puede causar un crash]
        SnackBar(content: Text('Imágenes Guardadas',style:Theme.of(context).textTheme.bodySmall)),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error seleccionando imágenes: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          elevation: 10,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: AppColors.primary),
                child: Center(
                  child: Text(
                    '7 Razones\nPor las que\nTe amo',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center)),
              ),
                ListTile(
                leading: Icon(Icons.favorite,color: AppColors.primary,),
                trailing: Icon(Icons.favorite,color: AppColors.primary,),
                title: Text('Razón 1',style: Theme.of(context).textTheme.titleLarge,),
                onTap: () {
                  _navigateToScreen(context,() => ReasonScreen(),);
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite,color: AppColors.primary,),
                trailing: Icon(Icons.favorite,color: AppColors.primary,),
                title: Text('Razón 2',style: Theme.of(context).textTheme.titleLarge,),
                onTap: () {
                  _navigateToScreen(context,() => ReasonScreen2(),);
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite,color: AppColors.primary,),
                trailing: Icon(Icons.favorite,color: AppColors.primary,),
                title: Text('Razón 3',style: Theme.of(context).textTheme.titleLarge,),
                onTap: () {
                  _navigateToScreen(context,() => ReasonScreen3(),);
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite,color: AppColors.primary,),
                trailing: Icon(Icons.favorite,color: AppColors.primary,),
                title: Text('Razón 4',style: Theme.of(context).textTheme.titleLarge,),
                onTap: () {
                  _navigateToScreen(context,() => ReasonScreen4(),);
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite,color: AppColors.primary,),
                trailing: Icon(Icons.favorite,color: AppColors.primary,),
                title: Text('Razón 5',style: Theme.of(context).textTheme.titleLarge,),
                onTap: () {
                  _navigateToScreen(context,() => ReasonScreen5(),);
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite,color: AppColors.primary,),
                trailing: Icon(Icons.favorite,color: AppColors.primary,),
                title: Text('Razón 6',style: Theme.of(context).textTheme.titleLarge,),
                onTap: () {
                  _navigateToScreen(context,() => ReasonScreen6(),);
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite,color: AppColors.primary,),
                trailing: Icon(Icons.favorite,color: AppColors.primary,),
                title: Text('Razón 7',style: Theme.of(context).textTheme.titleLarge,),
                onTap: () {
                  _navigateToScreen(context,() => ReasonScreen7(),);
                },
              ),
              ListTile(
                title: Text('Extra'),
                onTap: () {
                  _navigateToScreen(context,() => ReasonScreenExtra(),);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("TUS HIJOS",style: Theme.of(context).textTheme.titleMedium,),
          // No se especifica 'leading' para mantener el ícono de menú predeterminado
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_outline_sharp),
                  onPressed: () {
                    _navigateToScreen(context,() => LoadImagesScreen(),);
                  },
                ),
                IconButton(
                  onPressed: (){
                    _navigateToScreen(context,() => AmbarScreen(),);
                  }, 
                  icon: Icon(Icons.pets),
              ),
                IconButton(
                  onPressed: (){
                    _navigateToScreen(context,() => HouseScreen(),);
                  },
                  icon: Icon(Icons.house),
              ),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  FourContainers(imagePath: "assets/images/poncho.jpg",),
                  FourContainers(imagePath: "assets/images/poncha_candy.jpg",),
                ],
              ),
              Row(
                children: [
                  FourContainers(imagePath: "assets/images/poncha_ambar.jpg",),
                  FourContainers(imagePath: "assets/images/ponchitos.jpg",),
                ],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _pickImages,
          tooltip: "Añadir",
          child: Icon(Icons.add),
          ),
        persistentFooterButtons: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 20,
            children: [
              //Expanded(child: Tooltip(message: "Borrar",child: ElevatedButton(onPressed: (){}, child: Icon(Icons.delete)))),
              Expanded(child: Tooltip(message: "Mi Mami",child: ElevatedButton(onPressed: (){_navigateToScreen(context,() => BeautifulScreen(),);}, child: Icon(Icons.account_box)))),
              Expanded(child: Tooltip(message:"Opciones",child: ElevatedButton(onPressed: (){_navigateToScreen(context,() => SettingsScreen(),);}, child: Icon(Icons.settings))))
            ],
          ),
          
        ],
        bottomNavigationBar:BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text("CON AMOR DE JUAN",textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleMedium,),
          ),
        ),
      ),
    );
  }
}

class FourContainers extends StatelessWidget {
  final String imagePath;
  const FourContainers({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 32,right: 16,left: 32,bottom: 32),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(32),color: AppColors.background),
          clipBehavior: Clip.antiAlias,
          height: 256,
          width: 192,
          child: Transform.scale(
            scale: 2.0,
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,)),
        ),
      ),
    );
  }
}