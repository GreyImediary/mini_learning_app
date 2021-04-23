// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_learning_app/ui/screens/login_screen.dart';
import 'package:mini_learning_app/ui/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MINI Learning App',
      theme: ThemeData(
        primaryColor: primary,
        fontFamily: 'MINIType',
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: textMainColor,
              fontSize: 24,
              fontWeight: FontWeight.w500,
              fontFamily: 'MINIType',
            ),
          ),
          iconTheme: IconThemeData(),
        ),
        colorScheme: ColorScheme(
          primary: primary,
          primaryVariant: primaryVariant,
          secondary: secondary,
          secondaryVariant: secondaryVariant,
          surface: surface,
          background: background,
          error: error,
          onPrimary: onPrimary,
          onSecondary: onSecondary,
          onSurface: onSurface,
          onBackground: onBackground,
          onError: onError,
          brightness: brightness,
        ),
        textTheme: TextTheme(
          headline3: TextStyle(
            fontSize: 48,
            color: textMainColor,
          ),
          headline5: TextStyle(
              color: textMainColor, fontSize: 24, fontWeight: FontWeight.bold),
          headline6: TextStyle(
              color: textMainColor, fontSize: 20, fontWeight: FontWeight.w500),
          subtitle1: TextStyle(
            color: textMainColor,
            fontSize: 16,
          ),
          subtitle2: TextStyle(
              color: textMainColor, fontSize: 14, fontWeight: FontWeight.w500),
          bodyText2: TextStyle(color: textMainColor, fontSize: 16),
          bodyText1: TextStyle(fontSize: 14, color: textSecondaryColor),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          isDense: true
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              textStyle: TextStyle(
                  fontFamily: 'MINIType', fontWeight: FontWeight.w500)),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              side: BorderSide(color: primary),
              textStyle: TextStyle(
                  fontFamily: 'MINIType', fontWeight: FontWeight.w500)),
        ),
        cardTheme: CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          ),
        ),
        iconTheme: IconThemeData(color: onSurface),
      ),
      home: LoginScreen(),
    );
  }
}

class ThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Тренировки',
        ),
        leading: Icon(Icons.arrow_back),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 8,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Hello world",
                  ),
                ),
                Container(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Hello world",
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Hello Flutter'),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text('HELLO WORLD'),
                  ),
                ),
                Icon(Icons.description),
                Text(
                  'Hello world',
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  'Hello world',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  'Hello world',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  'Hello world',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  'Hello world',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  'Hello world',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  'Hello world',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Container(height: 16,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Card(
                            child: SizedBox(
                              width: 156,
                              height: 143,
                            ),
                          ),
                          Card(
                            child: SizedBox(
                              width: 156,
                              height: 143,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Card(
                            child: SizedBox(
                              width: 156,
                              height: 143,
                            ),
                          ),
                          Card(
                            child: SizedBox(
                              width: 156,
                              height: 143,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 156,
                            height: 143,
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.25),
                                      offset: Offset(0, 3),
                                      blurRadius: 4
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(8)
                            ),
                          ),
                          Container(
                            width: 156,
                            height: 143,
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.25),
                                      offset: Offset(0, 3),
                                      blurRadius: 4
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(8)
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 156,
                            height: 143,
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.25),
                                      offset: Offset(0, 3),
                                      blurRadius: 4
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(8)
                            ),
                          ),
                          Container(
                            width: 156,
                            height: 143,
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.25),
                                      offset: Offset(0, 3),
                                      blurRadius: 4
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(8)
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
