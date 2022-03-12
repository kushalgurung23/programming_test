import 'package:flutter/material.dart';
import 'package:programming_test/logic/controllers/map_provider.dart';
import 'package:programming_test/logic/controllers/user_provider.dart';
import 'package:programming_test/presentation/views/map_screen.dart';
import 'package:programming_test/presentation/views/single_user.dart';
import 'package:programming_test/presentation/views/user_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(
            create: (context) => MapProvider(
                userList: Provider.of<UserProvider>(context, listen: false)
                    .userList)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: UserScreen.id,
        routes: {
          UserScreen.id: (context) => const UserScreen(),
          MapScreen.id: (context) => const MapScreen(),
          SingleUser.id: (context) => const SingleUser()
        },
      ),
    );
  }
}
