// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_learning_app/bloc/user/user_repository.dart';
import 'package:mini_learning_app/dio_client.dart';
import 'package:mini_learning_app/ui/app.dart';

import 'bloc/auth/auth_repository.dart';

void main() async {

  final authRepository = AuthRepository(DioClient.dio);
  final userRepository = UserRepository(DioClient.dio);

  runApp(App(
    authRepository: authRepository,
    userRepository: userRepository,
  ));

  authRepository.checkAuth();
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
                Container(
                  height: 16,
                ),
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
                                      blurRadius: 4),
                                ],
                                borderRadius: BorderRadius.circular(8)),
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
                                      blurRadius: 4),
                                ],
                                borderRadius: BorderRadius.circular(8)),
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
                                      blurRadius: 4),
                                ],
                                borderRadius: BorderRadius.circular(8)),
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
                                      blurRadius: 4),
                                ],
                                borderRadius: BorderRadius.circular(8)),
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
