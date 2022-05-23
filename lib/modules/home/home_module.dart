import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/modules/home/repositories/home_repository.dart';

import 'controllers/home_controller.dart';
import 'pages/home_page.dart';



class HomeModule extends Module{
  @override 
  List<Bind> get binds => [
    Bind((i) => HomeController(i())),
    Bind((i) => HomeRepository(i())),
  ];

  @override 
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const HomePage()),
  ];

}