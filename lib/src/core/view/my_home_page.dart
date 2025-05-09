import 'package:flutter/material.dart';
import 'package:reference_app/src/components/app_colors.dart';
import 'package:reference_app/src/core/view/reasons/reason_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _navigateToReasonScreen(BuildContext context,Widget Function() screenBuilder) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screenBuilder())); 
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
                  _navigateToReasonScreen(context,() => ReasonScreen(),);
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite,color: AppColors.primary,),
                trailing: Icon(Icons.favorite,color: AppColors.primary,),
                title: Text('Razón 2',style: Theme.of(context).textTheme.titleLarge,),
                onTap: () {
                  _navigateToReasonScreen(context,() => ReasonScreen2(),);
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite,color: AppColors.primary,),
                trailing: Icon(Icons.favorite,color: AppColors.primary,),
                title: Text('Razón 3',style: Theme.of(context).textTheme.titleLarge,),
                onTap: () {
                  _navigateToReasonScreen(context,() => ReasonScreen3(),);
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite,color: AppColors.primary,),
                trailing: Icon(Icons.favorite,color: AppColors.primary,),
                title: Text('Razón 4',style: Theme.of(context).textTheme.titleLarge,),
                onTap: () {
                  _navigateToReasonScreen(context,() => ReasonScreen4(),);
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite,color: AppColors.primary,),
                trailing: Icon(Icons.favorite,color: AppColors.primary,),
                title: Text('Razón 5',style: Theme.of(context).textTheme.titleLarge,),
                onTap: () {
                  _navigateToReasonScreen(context,() => ReasonScreen5(),);
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite,color: AppColors.primary,),
                trailing: Icon(Icons.favorite,color: AppColors.primary,),
                title: Text('Razón 6',style: Theme.of(context).textTheme.titleLarge,),
                onTap: () {
                  _navigateToReasonScreen(context,() => ReasonScreen6(),);
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite,color: AppColors.primary,),
                trailing: Icon(Icons.favorite,color: AppColors.primary,),
                title: Text('Razón 7',style: Theme.of(context).textTheme.titleLarge,),
                onTap: () {
                  _navigateToReasonScreen(context,() => ReasonScreen7(),);
                },
              ),
              ListTile(
                title: Text('Extra'),
                onTap: () {
                  _navigateToReasonScreen(context,() => ReasonScreenExtra(),);
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
                  onPressed: () {},
                ),
                IconButton(
                  onPressed: (){}, 
                  icon: Icon(Icons.pets),
              ),
                IconButton(
                  onPressed: (){},
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
          onPressed: () {},
          tooltip: "Añadir",
          child: Icon(Icons.add),
          ),
        persistentFooterButtons: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 20,
            children: [
              Expanded(child: Tooltip(message: "Borrar",child: ElevatedButton(onPressed: (){}, child: Icon(Icons.delete)))),
              Expanded(child: Tooltip(message: "Mi Mami",child: ElevatedButton(onPressed: (){}, child: Icon(Icons.account_box)))),
              Expanded(child: Tooltip(message:"Opciones",child: ElevatedButton(onPressed: (){}, child: Icon(Icons.settings))))
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