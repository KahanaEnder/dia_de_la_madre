import 'package:flutter/material.dart';
import 'package:reference_app/src/components/app_colors.dart';
import 'package:reference_app/src/core/view/reasons/reason_screen.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:reference_app/src/core/providers/image_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //bool _isSnackBarVisible = false;


  void _navigateTo(String route) => Navigator.pushNamed(context, route); ///[Navegación PushNamed definida en MaterialApp]

  void _navigateToScreen(BuildContext context,Widget Function() screenBuilder) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screenBuilder())); ///[Navegaciíon simple usada en ListTiles]
  }


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ImageGalleryProvider>().initialize();
    });
    
  }

  @override
  Widget build(BuildContext context) {
    final gallery = context.watch<ImageGalleryProvider>();
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
              listReasons(context, tituloRazon: 'Razón 1', reasonScreen: () => ReasonScreen()),
              listReasons(context, tituloRazon: 'Razón 2', reasonScreen: () => ReasonScreen2()),
              listReasons(context, tituloRazon: 'Razón 3', reasonScreen: () => ReasonScreen3()),
              listReasons(context, tituloRazon: 'Razón 4', reasonScreen: () => ReasonScreen4()),
              listReasons(context, tituloRazon: 'Razón 5', reasonScreen: () => ReasonScreen5()),
              listReasons(context, tituloRazon: 'Razón 6', reasonScreen: () => ReasonScreen6()),
              listReasons(context, tituloRazon: 'Razón 7', reasonScreen: () => ReasonScreen7()),
              listReasons(context, tituloRazon: 'Extra', reasonScreen: () => ReasonScreenExtra()),
            ],
          ),
        ),
        appBar: _buildAppBar(),/*AppBar(
          title: Text("TUS HIJOS",style: Theme.of(context).textTheme.titleMedium,),
          // No se especifica 'leading' para mantener el ícono de menú predeterminado
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_outline_sharp),
                  onPressed: () {
                    _navigateTo("/favorites");
                  },
                ),
                IconButton(
                  onPressed: (){
                    _navigateTo("/ambar");
                  }, 
                  icon: Icon(Icons.pets),
              ),
                IconButton(
                  onPressed: (){
                    _navigateTo("/house");
                  },
                  icon: Icon(Icons.house),
              ),
              ],
            ),
          ],
        ),*/
        body:_buildBody(gallery), /*const SingleChildScrollView(
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
        ),*/
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<ImageGalleryProvider>().pickAndSave(),
          tooltip: "Añadir",
          child: Icon(Icons.add),
          ),
        persistentFooterButtons: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 20,
            children: [
              //Expanded(child: Tooltip(message: "Borrar",child: ElevatedButton(onPressed: (){}, child: Icon(Icons.delete)))),
              Expanded(child: Tooltip(message: "Mi Mami",child: ElevatedButton(onPressed: (){_navigateTo("/mami");}, child: Icon(Icons.account_box)))),
              Expanded(child: Tooltip(message:"Opciones",child: ElevatedButton(onPressed: (){_navigateTo("/settings");}, child: Icon(Icons.settings))))
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
  AppBar _buildAppBar() => AppBar(
        title: Text('TUS HIJOS',style:Theme.of(context).textTheme.labelLarge),
        actions: [
          IconButton(icon: const Icon(Icons.favorite_outline), onPressed: () => _navigateTo('/favorites')),
          IconButton(icon: const Icon(Icons.pets), onPressed: () => _navigateTo('/ambar')),
          IconButton(icon: const Icon(Icons.house), onPressed: () => _navigateTo('/house')),
        ],
      );

  Widget _buildBody(ImageGalleryProvider gallery) {
    if (gallery.loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (gallery.error != null) {
      return Center(child: Text('Error: \${gallery.error}'));
    }
    if (gallery.images.isEmpty) {
      return  Center(child: Text('No hay imágenes.\nPresiona + para añadir.',));
    }
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: gallery.images.length,
      itemBuilder: (_, idx) {
        final file = gallery.images[idx];
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.file(File(file.path), fit: BoxFit.cover),
        );
      },
    );
  }

  Widget listReasons(BuildContext context, {required String tituloRazon, required Widget Function() reasonScreen}) {
    return ListTile(
      leading: Icon(Icons.favorite, color: AppColors.primary,),
      trailing: Icon(Icons.favorite, color: AppColors.primary,),
      title: Text(tituloRazon, style: Theme.of(context).textTheme.titleLarge,),
      onTap: () {
        _navigateToScreen(context, reasonScreen);
      },
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