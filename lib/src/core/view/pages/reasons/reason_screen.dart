import 'package:flutter/material.dart';
import 'package:reference_app/src/components/app_colors.dart';

class ReasonWidget extends StatelessWidget { ///[Widget personalizado]
  final String message;
  final String messagePath;
  final String title;
  const ReasonWidget({
    super.key,
    required this.message,
    required this.messagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: Navigator.of(context).pop,
            icon: const Icon(Icons.arrow_back)
            ),
          title:Text(title),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 400,
                  height: 400,
                  child: Text(message,
                  overflow: TextOverflow.visible,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(backgroundColor: AppColors.accent),),
                ),
                Image.asset(messagePath)
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomAppBar(
          height: 100,
        ),
      ),
    );
  }
}

class ReasonScreen extends StatelessWidget { ///[Pantalla 1] [Aca se guardan los comentarios en rojo para el intellisense, en la primera linea de la clase]
  const ReasonScreen({super.key});

  @override
  Widget build(BuildContext context) { 
    return const ReasonWidget(
    title: "PRIMERO", 
    message: "Siempre recuerda que te amo, tu me das un sentido para vivir y me llenas de inspiración y orgullo para salir adelante",
    messagePath:"assets/images/a (1).jpg" ,);
  }
}

class ReasonScreen2 extends StatelessWidget { ///[Pantalla 2]
  const ReasonScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReasonWidget(
      title: "SEGUNDO",
      message: "Yo no dejare de amarte mami y quiero que siempre estes a mi lado porque tu compañia es mi felicidad <3",
      messagePath: "assets/images/a (2).jpg",); 
  }
}

class ReasonScreen3 extends StatelessWidget { ///[Pantalla 3]
  const ReasonScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReasonWidget(
      title: "TERCERO",
      message: "Me apoyas en todo y valoro muchisimo eso, sé que siempre puedo contar contigo para lo que necesite",
      messagePath: "assets/images/a (3).jpg",); 
  }
}

class ReasonScreen4 extends StatelessWidget { ///[Pantalla 4]
  const ReasonScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReasonWidget(
      title: "CUARTO",
      message: "Amas mucho a los ponchos y tienen una excelente mamá que se preocupa y cuida de ellos",
      messagePath: "assets/images/a (4).jpg",); 
  }
}

class ReasonScreen5 extends StatelessWidget { ///[Pantalla 5]
  const ReasonScreen5({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReasonWidget(
      title: "QUINTO",
      message: "Has sido receptiva y escuchas lo que te digo siempre porque tienes ambiciones y vas centrada en querer ser mejor",
      messagePath: "assets/images/a (5).jpg",); 
  }
}

class ReasonScreen6 extends StatelessWidget { ///[Pantalla 6]
  const ReasonScreen6({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReasonWidget(
      title: "SEXTO",
      message: "Por lo fuerte y berraca que eres, una cualidad que te ha logrado salir adelante",
      messagePath: "assets/images/a (6).jpg",); 
  }
}

class ReasonScreen7 extends StatelessWidget { ///[Pantalla 7]
  const ReasonScreen7({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReasonWidget(
      title: "SEPTIMO",
      message: "Porque siempre has estado presente y has querido lo mejor para mi",
      messagePath: "assets/images/a (7).jpg",); 
  }
}

class ReasonScreenExtra extends StatelessWidget { ///[Pantalla 8]
  const ReasonScreenExtra({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReasonWidget(
      title: "EXTRA",
      message: "Porque siempre habra una razón extra para amarte",
      messagePath: "assets/images/a (8).jpg",);
  }
}

