import 'package:flutter/material.dart';
import 'package:reference_app/src/components/app_colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.favorite,color: AppColors.primary,),
                trailing: Icon(Icons.favorite,color: AppColors.primary,),
                title: Text('Razón 2',style: Theme.of(context).textTheme.titleLarge,),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.favorite,color: AppColors.primary,),
                trailing: Icon(Icons.favorite,color: AppColors.primary,),
                title: Text('Razón 3',style: Theme.of(context).textTheme.titleLarge,),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.favorite,color: AppColors.primary,),
                trailing: Icon(Icons.favorite,color: AppColors.primary,),
                title: Text('Razón 4',style: Theme.of(context).textTheme.titleLarge,),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.favorite,color: AppColors.primary,),
                trailing: Icon(Icons.favorite,color: AppColors.primary,),
                title: Text('Razón 5',style: Theme.of(context).textTheme.titleLarge,),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.favorite,color: AppColors.primary,),
                trailing: Icon(Icons.favorite,color: AppColors.primary,),
                title: Text('Razón 6',style: Theme.of(context).textTheme.titleLarge,),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.favorite,color: AppColors.primary,),
                trailing: Icon(Icons.favorite,color: AppColors.primary,),
                title: Text('Razón 7',style: Theme.of(context).textTheme.titleLarge,),
                onTap: () {},
              ),
              ListTile(
                title: Text('Extra'),
                onTap: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("PARA MAMI",style: Theme.of(context).textTheme.titleMedium,),
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
        body: Center(child: Column(
          children: [
            Text('Contenido principal'),
          ],
        )),
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
              Expanded(child: ElevatedButton(onPressed: (){}, child: Icon(Icons.delete))),
              Expanded(child: ElevatedButton(onPressed: (){}, child: Icon(Icons.add))),
              Expanded(child: ElevatedButton(onPressed: (){}, child: Icon(Icons.settings)))
            ],
          ),
          
        ],
      ),
    );
  }
}