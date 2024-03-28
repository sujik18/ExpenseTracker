import 'package:flutter/material.dart';
import 'package:expense_tracker/theme/theme.dart';
import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/services.dart';


var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 77, 243, 44),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 9, 65, 6),
);

//ThemeMode currentThemeMode = ThemeMode.system;
//ThemeMode appMode = ThemeMode.light;
// ThemeMode themeCheck(){
//       if(ThemeMode.system == ThemeMode.light) {
//         appMode = ThemeMode.light;
//       }
//       else {
//         appMode = ThemeMode.dark;
//       }
      
//       return appMode;
      
// }

void main() {
  //****Locking orientation to portrait mode*****
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn){
  runApp(
    MaterialApp(
      
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          elevation: 5,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
            backgroundColor: kDarkColorScheme.primaryContainer,
            elevation: 2,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                color: kDarkColorScheme.onPrimaryContainer,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
              titleSmall: TextStyle(
                color: kDarkColorScheme.onSecondaryContainer,
                fontSize: 14,
              )
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          foregroundColor: kColorScheme.primaryContainer,
          backgroundColor: kColorScheme.onTertiaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          elevation: 5,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: kColorScheme.onPrimaryContainer,
            backgroundColor: kColorScheme.primaryContainer,
            elevation: 2,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
             titleLarge: TextStyle(
                color: kColorScheme.onPrimaryContainer,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
              titleSmall: TextStyle(
                color: kColorScheme.onSecondaryContainer,
                fontSize: 14,
              ),
        ),
        
      ),
      
      //theme: lightMode,
      //darkTheme: darkMode,
      themeMode: ThemeMode.system,
      home: const Expenses(),
      
    ),
    
  );
  //}); 
}
 