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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final ImagePicker _picker = ImagePicker();
  final List<XFile> _images = [];

  void _navigateToScreen(BuildContext context,Widget Function() screenBuilder) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screenBuilder())); 
  }

  Future<void> _pickImages() async {
    // Solicitar permiso para el almacenamiento/galería
    final status = await Permission.photos.request();
    if (!mounted) return;

    if (!status.isGranted) {
      // Mostrar mensaje si el permiso no es concedido
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permiso de galería denegado')),
      );
      return;
    }

    try {
      // Permite seleccionar múltiples imágenes (o usa pickImage para una sola)
      final List<XFile> selected = await _picker.pickMultiImage();
      if (!mounted) return;

      if (selected.isNotEmpty) {
        setState(() {
          _images.addAll(selected);
        });
      }
    } catch (e) {
      if (!mounted) return;
      // Manejar errores
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error cargando imágenes: \$e')),
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