import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_darktheme_app/providers/change_theme_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChangeTheme()),
      ],
      child: Builder(builder: (context) {
        final changeTheme = Provider.of<ChangeTheme>(context);
        return MaterialApp(
          theme: changeTheme.isdarktheme ? ThemeData.dark() : ThemeData.light(),
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(changeTheme.isdarktheme
                  ? 'Hola en tema oscuro'
                  : 'Hola en tema claro'),
              actions: [
                Switch(
                    value: changeTheme.isdarktheme,
                    onChanged: (_) {
                      changeTheme.isdarktheme = _;
                    })
              ],
            ),
            body: Center(
              child: Container(
                child: Text('Hello World'),
              ),
            ),
          ),
        );
      }),
    );
  }
}
