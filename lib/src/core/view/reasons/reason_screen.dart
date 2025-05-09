import 'package:flutter/material.dart';


class ReasonScreen extends StatelessWidget { ///[Pantalla 1]
  const ReasonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  ReasonWidget();
  }
}

class ReasonWidget extends StatelessWidget { ///[Widget personalizado]
  const ReasonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: Navigator.of(context).pop,
            icon: Icon(Icons.arrow_back)
            ),
        ),
        body: Center(
          child: Column(
            children: [
              Text("Razón 1")
            ],
          ),
        ),
      ),
    );
  }
}

class ReasonScreen2 extends StatelessWidget { ///[Pantalla 2]
  const ReasonScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReasonWidget(); //Implementar poder cambiar valores
  }
}