import 'package:flutter/material.dart';
import 'package:reference_app/src/components/app_colors.dart';

class MyMaterials extends StatelessWidget {
  const MyMaterials({
    super.key,
  });

///Usar bien los [Nullable] [builders] [Const] [Stateful y Stateless widget] en funciones y widgets, aprender a manejar ? ?? y :

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(//Aca definimos los temas de la App y podemos crear una clase para definir los colores como propiedades static
      title: "Proyecto de referencia",
      color: AppColors.primary,
      theme: myAppThemes(),
      //darkTheme: ThemeData.dark(), 
      ///[MODO OSCURO DESACTIVADO]
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      key: const Key("Llave del MaterialApp"),

      home: Scaffold(
        appBar: AppBar(
          title: Text("TITULO",style: myTextThemes().titleLarge,),
        ),
        body: Center(
          child: Text('Hello World!',style: myTextThemes().bodySmall),
        ),
      ),
    );
  }





  ThemeData myAppThemes() {
    return ThemeData(
      useMaterial3: true,
      applyElevationOverlayColor: true,
      appBarTheme: myAppBarThemes(),
      textTheme: myTextThemes(),
      canvasColor: AppColors.primary,
      badgeTheme: myBadgeThemes(),
      bannerTheme: myBannerThemes(),
      bottomAppBarTheme: myBottomAppBarThemes(),
      bottomNavigationBarTheme: myBottomNavigationBarThemes(),
      bottomSheetTheme: myBottomSheetThemes(),
      buttonTheme: myButtonThemes(),
      cardColor: AppColors.backgroundWidget,
      checkboxTheme: myCheckboxThemes(),
      chipTheme: myChipThemes(),
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      ///[EXPLOTO => BUCLE INFINITO => STACK OVERFLOW]cupertinoOverrideTheme: MaterialBasedCupertinoThemeData(materialTheme: myAppThemes()), //Puede que explote
      dataTableTheme: myDataTableThemes(),
      datePickerTheme: myDatePickerThemes(),
      inputDecorationTheme: myInputDecorationThemes(),
      
      
      
      );
  }



  InputDecorationTheme myInputDecorationThemes() => InputDecorationTheme(
        labelStyle: myTextStyles().copyWith(color: AppColors.accent),
        helperStyle: myTextStyles().copyWith(color: AppColors.highlight),
        hintStyle: myTextStyles().copyWith(color: AppColors.backgroundComponent),
        errorStyle: myTextStyles().copyWith(color: AppColors.secondary),
        border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.accent),
        borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.highlight),
        borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.backgroundComponent, width: 2),
        borderRadius: BorderRadius.circular(8),
        ),
        hoverColor: AppColors.accent,
        outlineBorder: BorderSide(),
      );





  DatePickerThemeData myDatePickerThemes() => DatePickerThemeData(

      backgroundColor: AppColors.primary,
      surfaceTintColor: AppColors.backgroundWidget,
      headerBackgroundColor: AppColors.secondary,
      headerForegroundColor: AppColors.highlight,
      elevation: 30,
      dayStyle: myTextStyles().copyWith(color: AppColors.accent),
      weekdayStyle: myTextStyles().copyWith(color: AppColors.highlight),
      rangePickerBackgroundColor: AppColors.backgroundComponent,
      rangePickerSurfaceTintColor: AppColors.secondary,
      yearStyle: myTextStyles().copyWith(color: AppColors.backgroundWidget),
      shape: StadiumBorder(),
      );






  DataTableThemeData myDataTableThemes() => DataTableThemeData(
    dataTextStyle: myTextStyles(),
    decoration: BoxDecoration(
      color: AppColors.primary,
      border: Border.all(color: AppColors.accent),
    ),
    headingRowHeight: 56,
    headingTextStyle: myTextStyles().copyWith(fontWeight: FontWeight.bold, color: AppColors.backgroundComponent),
    horizontalMargin: 24,
    columnSpacing: 50,
    dividerThickness: 2,
    checkboxHorizontalMargin: 12,
    );






  ChipThemeData myChipThemes() => ChipThemeData(
    backgroundColor: AppColors.primary,
      deleteIconColor: AppColors.secondary,
      disabledColor: AppColors.background,
      selectedColor: AppColors.highlight,
      secondarySelectedColor: AppColors.accent,
      labelStyle: myTextStyles(),
      padding: EdgeInsets.all(8),
      shadowColor: AppColors.backgroundWidget,
      shape: StadiumBorder(),
      showCheckmark: true,
      surfaceTintColor: AppColors.backgroundComponent,
      );







  CheckboxThemeData myCheckboxThemes() => CheckboxThemeData( 
    side: BorderSide(color: AppColors.accent, width: 2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    splashRadius: 20,
  );






  ButtonThemeData myButtonThemes() => ButtonThemeData(
    alignedDropdown: true,
    buttonColor: AppColors.primary,
    disabledColor: AppColors.background,
    focusColor: AppColors.highlight,
    hoverColor: AppColors.accent,
    highlightColor: AppColors.backgroundComponent,
    splashColor: AppColors.secondary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(color: AppColors.accent),
    ),
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    textTheme: ButtonTextTheme.primary,
  );






  BottomSheetThemeData myBottomSheetThemes() => BottomSheetThemeData(
    backgroundColor: AppColors.primary,
    constraints: BoxConstraints.tight(Size.square(30)),
    dragHandleColor: AppColors.highlight,
    elevation: 30,
    modalBackgroundColor: AppColors.backgroundComponent,
    modalBarrierColor: AppColors.background,
    modalElevation: 20,
    shadowColor: AppColors.backgroundWidget,
    shape: StadiumBorder(),
    showDragHandle: true,
    surfaceTintColor: AppColors.accent
  );






  BottomNavigationBarThemeData myBottomNavigationBarThemes() => BottomNavigationBarThemeData(
    backgroundColor: AppColors.secondary,
    elevation: 20,
    enableFeedback: true,
    selectedIconTheme: myIconThemes(),
    selectedItemColor: AppColors.highlight,
    selectedLabelStyle: myTextStyles(),
    showSelectedLabels: true,
    showUnselectedLabels: true,
  );






  BottomAppBarTheme myBottomAppBarThemes() => BottomAppBarTheme(
    color: AppColors.secondary,
    elevation: 20,
    height: 100,
    padding: EdgeInsetsDirectional.symmetric(),
    shadowColor: AppColors.backgroundComponent,
    shape: CircularNotchedRectangle(),
    surfaceTintColor: AppColors.primary
  );






  MaterialBannerThemeData myBannerThemes() => MaterialBannerThemeData(
    backgroundColor: AppColors.secondary,
    contentTextStyle: myTextStyles(),
    elevation: 20,
    dividerColor: AppColors.highlight,
    leadingPadding: EdgeInsets.all(8),
    padding: EdgeInsetsDirectional.all(8),
    shadowColor: AppColors.backgroundWidget,
    surfaceTintColor: AppColors.backgroundComponent
  );







  BadgeThemeData myBadgeThemes() => BadgeThemeData(
    backgroundColor: AppColors.secondary,
    largeSize: 40,
    padding: EdgeInsets.symmetric(),
    smallSize: 20,
    textColor: AppColors.accent,
    textStyle: myTextStyles()
  );





  TextTheme myTextThemes() {
    return TextTheme( ///[Configurar un textTheme para titulo, parrafo, y demas] .copyWith sirve para sobreescribir un valor de propiedad
      bodyLarge: myTextStyles().copyWith(fontSize:16),
      bodyMedium: myTextStyles().copyWith(fontSize:14),
      bodySmall: myTextStyles().copyWith(fontSize:12),
      displayLarge: myTextStyles().copyWith(fontSize:57),
      displayMedium: myTextStyles().copyWith(fontSize:45),
      displaySmall: myTextStyles().copyWith(fontSize:36),
      headlineLarge: myTextStyles().copyWith(fontSize:32),
      headlineMedium: myTextStyles().copyWith(fontSize:28),
      headlineSmall: myTextStyles().copyWith(fontSize:24),
      labelLarge: myTextStyles().copyWith(fontSize:14),
      labelMedium: myTextStyles().copyWith(fontSize:12),
      labelSmall: myTextStyles().copyWith(fontSize:11),
      titleLarge: myTextStyles().copyWith(fontSize:22),
      titleMedium: myTextStyles().copyWith(fontSize:16),
      titleSmall: myTextStyles().copyWith(fontSize:14));
  }





  AppBarTheme myAppBarThemes() {
    return AppBarTheme(
      color: AppColors.primary,
      actionsPadding: EdgeInsets.only(top: 8,bottom: 8,left: 16,right: 16),
      centerTitle: true,
      elevation: 16,
      foregroundColor: AppColors.backgroundComponent,
      iconTheme: myIconThemes(),
      shadowColor: AppColors.backgroundComponent,
      shape: Border.all(),
      surfaceTintColor: AppColors.backgroundWidget,
      titleSpacing: 16,
      scrolledUnderElevation: 16,
      titleTextStyle: myTextStyles(),
      toolbarHeight: 40,
      toolbarTextStyle: myTextStyles());
  }





  TextStyle myTextStyles() {
    return TextStyle(
      backgroundColor: AppColors.backgroundComponent,
      color: AppColors.secondary,
      //decoration: TextDecoration.underline,
      decorationColor: AppColors.accent,
      decorationThickness: 4,
      fontFamily: "Monocraft",
      fontSize: 30,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      height: 1,
      letterSpacing: 8,
      overflow: TextOverflow.ellipsis,
      wordSpacing: 8,
      inherit: true
    );
  }





  IconThemeData myIconThemes() {
    return IconThemeData(
      applyTextScaling: true,
      color: AppColors.highlight,
      opacity: 0.8,
      size: 23,
      weight: 300,
      opticalSize: 23,
    );
  }
}