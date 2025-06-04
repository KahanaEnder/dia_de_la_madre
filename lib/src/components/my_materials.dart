import 'package:flutter/material.dart';
import 'package:reference_app/src/components/app_colors.dart';
import 'package:reference_app/src/core/view/pages/ambar_screen.dart';
import 'package:reference_app/src/core/view/pages/favorite_screen.dart';
import 'package:reference_app/src/core/view/pages/my_home_page.dart';
import 'package:reference_app/src/core/view/pages/reasons/house_screen.dart';
import 'package:reference_app/src/core/view/pages/reasons/mami_screen.dart';
import 'package:reference_app/src/core/view/pages/reasons/settings_screen.dart';

class MyMaterials extends StatelessWidget {
  const MyMaterials({
    super.key,
  });

///Usar bien los [Nullable] [builders] [Const] [Stateful y Stateless widget] en funciones y widgets, aprender a manejar ? ?? y :

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(//Aca definimos los temas de la App y podemos crear una clase para definir los colores como propiedades static
      title: "Para Mamá",
      color: AppColors.primary,
      theme: myAppThemes(),
      //darkTheme: ThemeData.dark(), 
      ///[MODO OSCURO DESACTIVADO]
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      key: const Key("Llave del MaterialApp"),
      home: MyHomePage(),
      routes: {
        ///'/': (_) => const MyHomePage(), [No se puede usar el parametro home: y ruta por defecto '/' porque es redundante y lanza una excepción]
        '/ambar': (_) => const AmbarScreen(),
        '/favorites': (_) => const LoadImagesScreen(),
        '/house': (_) => const HouseScreen(),
        '/settings': (_) => const SettingsScreen(),
        '/mami': (_) => const BeautifulScreen(),
      },
    );
  }




///[Temas de los widgets]

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
      disabledColor: AppColors.highlight,
      dividerColor: AppColors.backgroundWidget,
      dividerTheme: myDividerThemes(),
      drawerTheme: myDrawerThemes(),
      dropdownMenuTheme: myDropdownMenuThemes(),
      elevatedButtonTheme: myElevatedButtonThemes(),
      filledButtonTheme: myFilledButtonThemes(),
      floatingActionButtonTheme: myFloatingActionButtonThemes(),
      focusColor: AppColors.highlight,
      fontFamily: "Monocraft",
      highlightColor: AppColors.highlight,
      hintColor: AppColors.backgroundWidget,
      hoverColor: AppColors.backgroundComponent,
      indicatorColor: AppColors.primary,
      iconButtonTheme: myIconButtonThemes(),
      iconTheme: myIconThemes(),
      navigationBarTheme: myNavigationBarThemes(),
      navigationDrawerTheme: myNavigationDrawerThemes(),
      expansionTileTheme: myExpansionTileThemes(),
      listTileTheme: myListTileThemes(),
      unselectedWidgetColor: AppColors.background,
      splashColor: AppColors.accent,
      primaryColor: AppColors.primary,
      primaryColorDark: AppColors.primary,
      primaryColorLight: AppColors.primary,
      scaffoldBackgroundColor: AppColors.secondary,
      shadowColor: AppColors.background,
      tooltipTheme: myTooltipThemes(),
      navigationRailTheme: myNavigationRailThemes(),
      outlinedButtonTheme: myOutlinedButtonThemes(),
      popupMenuTheme: myPopupMenuThemes(),
      primaryIconTheme: myIconThemes(),
      primaryTextTheme: myTextThemes(),
      progressIndicatorTheme: myProgressIndicatorThemes(),
      radioTheme: myRadioThemes(),
      secondaryHeaderColor: AppColors.background,
      scrollbarTheme: myScrollbarThemes(),
      searchViewTheme: mySearchViewThemes(),
      segmentedButtonTheme: mySegmentedButtonThemes(),
      sliderTheme: mySliderThemes(),
      snackBarTheme: mySnackBarThemes(),
      switchTheme: mySwitchThemes(),
      textButtonTheme: myTextButtonThemes(),
      textSelectionTheme: myTextSelectionThemes(),
      timePickerTheme: myTimePickerThemes(),
      toggleButtonsTheme: myToggleButtonThemes(),
      );
  }





  ToggleButtonsThemeData myToggleButtonThemes() => ToggleButtonsThemeData(
    borderColor: AppColors.background,
    borderRadius: BorderRadius.circular(4),
    borderWidth: 20,
    color: AppColors.backgroundWidget,
    disabledBorderColor: AppColors.background,
    disabledColor: AppColors.background,
    fillColor: AppColors.secondary,
    focusColor: AppColors.highlight,
    highlightColor: AppColors.highlight,
    hoverColor: AppColors.backgroundComponent,
    selectedBorderColor: AppColors.backgroundWidget,
    selectedColor: AppColors.primary,
    splashColor: AppColors.accent,
    textStyle: myTextStyles()
  );




  TimePickerThemeData myTimePickerThemes() => TimePickerThemeData(
    backgroundColor: AppColors.secondary,
    dayPeriodColor: AppColors.accent,
    dayPeriodTextColor: AppColors.backgroundWidget,
    dialHandColor: AppColors.highlight,
    dayPeriodTextStyle: myTextStyles(),
    dialBackgroundColor: AppColors.background,
    dialTextColor: AppColors.backgroundComponent,
    dialTextStyle: myTextStyles(),
    elevation: 30,
    entryModeIconColor: AppColors.backgroundWidget,
    hourMinuteColor: AppColors.primary,
    helpTextStyle: myTextStyles(),
    hourMinuteTextColor: AppColors.accent,
    hourMinuteTextStyle: myTextStyles(),
    hourMinuteShape: StadiumBorder(),
    shape: StadiumBorder(),
  );



  TextSelectionThemeData myTextSelectionThemes() => TextSelectionThemeData(
    cursorColor: AppColors.backgroundComponent,
    selectionColor: AppColors.backgroundWidget,
    selectionHandleColor: AppColors.highlight
  );

  TextButtonThemeData myTextButtonThemes() => TextButtonThemeData(
    style: ButtonStyle(
      enableFeedback: true
    )
  );



  SwitchThemeData mySwitchThemes() => SwitchThemeData(
    padding: EdgeInsets.all(8),
    splashRadius: 20,
  );



  SnackBarThemeData mySnackBarThemes() => SnackBarThemeData(
    actionBackgroundColor: AppColors.secondary,
    actionTextColor: AppColors.accent,
    backgroundColor: AppColors.backgroundWidget,
    closeIconColor: AppColors.highlight,
    contentTextStyle: myTextStyles(),
    disabledActionBackgroundColor: AppColors.background,
    disabledActionTextColor: AppColors.background,
    elevation: 20,
    insetPadding: EdgeInsets.all(8),
    shape: StadiumBorder(),
    showCloseIcon: true,
  );



  SliderThemeData mySliderThemes() => SliderThemeData(
    activeTickMarkColor: AppColors.accent,
    activeTrackColor: AppColors.highlight,
    disabledActiveTickMarkColor: AppColors.background,
    disabledActiveTrackColor: AppColors.background,
    disabledInactiveTickMarkColor: AppColors.background,
    disabledInactiveTrackColor: AppColors.background,
    disabledSecondaryActiveTrackColor: AppColors.background,
    disabledThumbColor: AppColors.background,
    inactiveTickMarkColor: AppColors.background,
    inactiveTrackColor: AppColors.background,
    minThumbSeparation: 30,
    overlappingShapeStrokeColor: AppColors.accent,
    overlayColor: AppColors.backgroundWidget,
    padding: EdgeInsets.all(8),
    secondaryActiveTrackColor: AppColors.highlight,
    thumbColor: AppColors.primary,
    trackGap: 20,
    trackHeight: 20,
    valueIndicatorColor: AppColors.backgroundComponent,
    valueIndicatorTextStyle: myTextStyles(),
    valueIndicatorStrokeColor: AppColors.backgroundWidget
  );




  SegmentedButtonThemeData mySegmentedButtonThemes() => SegmentedButtonThemeData(
    style: ButtonStyle(
      enableFeedback: true
    )
  );



  SearchViewThemeData mySearchViewThemes() => SearchViewThemeData(
    backgroundColor: AppColors.background,
    barPadding: EdgeInsets.all(8),
    dividerColor: AppColors.backgroundWidget,
    elevation: 20,
    headerHeight: 30,
    headerHintStyle: myTextStyles(),
    headerTextStyle: myTextStyles(),
    padding: EdgeInsets.all(8),
    shape: CircleBorder(),
    shrinkWrap: true,
    side: BorderSide(),
    surfaceTintColor: AppColors.accent
  );



  ScrollbarThemeData myScrollbarThemes() => ScrollbarThemeData(
    crossAxisMargin: 20,
    interactive: true,
    mainAxisMargin: 20,
    minThumbLength: 20,
    radius: Radius.circular(5),
  );




  RadioThemeData myRadioThemes() => RadioThemeData(
    splashRadius: 30
  );



  ProgressIndicatorThemeData myProgressIndicatorThemes() => ProgressIndicatorThemeData(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    circularTrackColor: AppColors.accent,
    circularTrackPadding: EdgeInsets.all(8),
    color: AppColors.highlight,
    linearMinHeight: 30,
    linearTrackColor: AppColors.backgroundWidget,
    refreshBackgroundColor: AppColors.background,
    stopIndicatorColor: AppColors.primary,
    stopIndicatorRadius: 20,
    strokeAlign: 30,
    strokeWidth: 30,
    trackGap: 20,
  );




  PopupMenuThemeData myPopupMenuThemes() => PopupMenuThemeData(
    color: AppColors.secondary,
    elevation: 30,
    enableFeedback: true,
    iconColor: AppColors.backgroundWidget,
    iconSize: 30,
    menuPadding: EdgeInsets.all(8),
    shadowColor: AppColors.accent,
    shape: StadiumBorder(),
    surfaceTintColor: AppColors.backgroundComponent,
    textStyle: myTextStyles(),
  );



  OutlinedButtonThemeData myOutlinedButtonThemes() => OutlinedButtonThemeData(
    style: ButtonStyle(
      enableFeedback: true
    )
  );



  NavigationRailThemeData myNavigationRailThemes() => NavigationRailThemeData(
    backgroundColor: AppColors.backgroundWidget,
    elevation: 30,
    groupAlignment: 20,
    indicatorColor: AppColors.highlight,
    indicatorShape: StadiumBorder(),
    minExtendedWidth: 20,
    minWidth: 10,
    selectedIconTheme: myIconThemes(),
    selectedLabelTextStyle: myTextStyles(),
    unselectedLabelTextStyle: myTextStyles(),
    unselectedIconTheme: myIconThemes(),
    useIndicator: true
  );



  TooltipThemeData myTooltipThemes() => TooltipThemeData(
    decoration: BoxDecoration(color: AppColors.background,borderRadius: BorderRadius.circular(5)),
    enableFeedback: true,
    excludeFromSemantics: false,
    height: 20,
    margin: EdgeInsets.all(12),
    preferBelow: false,
    verticalOffset: 10,
    textStyle: myTextStyles().copyWith(fontSize: 16),
  );



  ListTileThemeData myListTileThemes() => ListTileThemeData(
    dense: false,
    enableFeedback: false,
    horizontalTitleGap: 30,
    contentPadding: EdgeInsets.all(8),
    iconColor: AppColors.highlight,
    minLeadingWidth: 30,
    minVerticalPadding: 35,
    minTileHeight: 30,
    selectedColor: AppColors.backgroundWidget,
    selectedTileColor: AppColors.accent,
    shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)),
    subtitleTextStyle: myTextStyles(),
    textColor: AppColors.background, //Se camufla y solo es visible al presionar
    tileColor: AppColors.background,
    titleTextStyle: myTextStyles(),
  );



  ExpansionTileThemeData myExpansionTileThemes() => ExpansionTileThemeData(
    backgroundColor: AppColors.secondary,
    collapsedBackgroundColor: AppColors.backgroundWidget,
    collapsedShape: BeveledRectangleBorder(),
    collapsedIconColor: AppColors.accent,
    iconColor: AppColors.backgroundComponent,
    childrenPadding: EdgeInsets.all(8),
    collapsedTextColor: AppColors.background,
    shape: LinearBorder.end(),
    textColor: AppColors.background,
    tilePadding: EdgeInsets.all(8)
  );



  NavigationDrawerThemeData myNavigationDrawerThemes() => NavigationDrawerThemeData(
    backgroundColor: AppColors.secondary,
    elevation: 30,
    indicatorColor: AppColors.highlight,
    indicatorShape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
    shadowColor: AppColors.backgroundWidget,
    surfaceTintColor: AppColors.primary,
    tileHeight: 20
  );



  NavigationBarThemeData myNavigationBarThemes() => NavigationBarThemeData(
    backgroundColor: AppColors.secondary,
    elevation: 20,
    height: 50,
    indicatorColor: AppColors.highlight,
    indicatorShape: StadiumBorder(),
    labelPadding: EdgeInsets.all(8),
    shadowColor: AppColors.backgroundWidget,
    surfaceTintColor: AppColors.backgroundComponent
  );




  IconButtonThemeData myIconButtonThemes() => IconButtonThemeData(
    style: ButtonStyle(
      enableFeedback: true,
    )
  );



  FloatingActionButtonThemeData myFloatingActionButtonThemes() => FloatingActionButtonThemeData(
    backgroundColor: AppColors.background,
    elevation: 20,
    disabledElevation: 10,
    enableFeedback: true,
    extendedIconLabelSpacing: 10,
    extendedPadding: EdgeInsets.all(8),
    extendedTextStyle: myTextStyles(),
    focusColor: AppColors.highlight,
    focusElevation: 40,
    foregroundColor: AppColors.primary,
    highlightElevation: 20,
    hoverColor: AppColors.backgroundWidget,
    hoverElevation: 30,
    iconSize: 30,
    shape: StadiumBorder(),
    splashColor: AppColors.backgroundComponent
  );



  FilledButtonThemeData myFilledButtonThemes() => FilledButtonThemeData(
    style: ButtonStyle(
      enableFeedback: true,
    )
  );



  ElevatedButtonThemeData myElevatedButtonThemes() => ElevatedButtonThemeData(
      style: ButtonStyle(
        enableFeedback: true,
      )
    );



  DropdownMenuThemeData myDropdownMenuThemes() => DropdownMenuThemeData(
    inputDecorationTheme: myInputDecorationThemes(),
    textStyle: myTextStyles()
  );




  DrawerThemeData myDrawerThemes() => DrawerThemeData(
    backgroundColor: AppColors.secondary,
    elevation: 20,
    endShape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
    scrimColor: Color.fromARGB(155, 0, 0, 0),
    shadowColor: AppColors.primary,
    shape: BeveledRectangleBorder(),
    surfaceTintColor: AppColors.backgroundComponent,
    width: 300,
  );




  DividerThemeData myDividerThemes() => DividerThemeData(
    color: AppColors.secondary,
    endIndent: 20,
    indent: 20,
    space: 20,
    thickness: 10
  );




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
        isCollapsed: true,
        filled: true,
        suffixStyle: myTextStyles(),
        floatingLabelStyle: myTextStyles(),
        focusColor: AppColors.highlight,
        fillColor: AppColors.backgroundWidget,
        counterStyle: myTextStyles(),
        alignLabelWithHint: true,
        iconColor: AppColors.highlight,
        isDense: true,
        prefixIconColor: AppColors.backgroundWidget,
        errorMaxLines: 2,
        suffixIconColor: AppColors.accent,
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
    color: AppColors.primary,
    elevation: 20,
    height: 48,
    padding: EdgeInsetsDirectional.symmetric(),
    shadowColor: AppColors.darkText,
    shape: CircularNotchedRectangle(),
    surfaceTintColor: AppColors.accent
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
      //actionsPadding: EdgeInsets.only(top: 8,bottom: 8,left: 16,right: 16),
      centerTitle: true,
      elevation: 16,
      foregroundColor: AppColors.backgroundComponent,
      iconTheme: myIconThemes(),
      shadowColor: AppColors.darkText,
      shape: Border.all(),
      surfaceTintColor: AppColors.backgroundWidget,
      titleSpacing: 16,
      scrolledUnderElevation: 16,
      titleTextStyle: myTextStyles(),
      toolbarHeight: 48,
      toolbarTextStyle: myTextStyles());
  }





  TextStyle myTextStyles() {
    return TextStyle(
      //backgroundColor: AppColors.backgroundComponent,
      color: AppColors.darkText,
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
      //applyTextScaling: true,
      color: AppColors.background,
      opacity: 1,
      //size: 23,
      //weight: 300,
      //opticalSize: 23,
    );
  }
}