import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/modules/home/controllers/home_controller.dart';
import 'package:pokedex/modules/home/repositories/home_repository.dart';
import 'package:pokedex/shared/core/app_fonts.dart';
import 'package:pokedex/shared/core/app_palette.dart';

import '../models/poke_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Modular.get<HomeController>();
  Pokedex? pokedex;


  @override
  void initState() {
    super.initState();

    getData();

  }

  Future<void> getData() async{
    final data = await homeController.getPokemonsList();
    setState(() {
       pokedex = data;
    });
   
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16,),
              SizedBox(
                height: 150,
                child: Image.asset('assets/images/pokedex_logo.png') ,
              ),
              const SizedBox(height: 16,),
              Expanded(
                child: pokedex != null ? _buildPokedex() : const Center(child: CircularProgressIndicator(),),
              )
            ],
          ),
        ),
      ),
    );
  }


  _buildPokedex() {
    return GridView.builder(
     gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
       crossAxisCount: 2
        
      ) ,
      itemCount: pokedex!.pokemon!.length,
     itemBuilder: (BuildContext context, int index) {
       String type = pokedex!.pokemon![index].type![0].toString();
       return Padding(
         padding: EdgeInsets.all(8),
         child: InkWell(
           child: Container(
             decoration: BoxDecoration(
               color: homeController.backgroundColor(type),
               borderRadius: BorderRadius.circular(24)
             ),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 children: [
                   Text(
                     pokedex!.pokemon![index].name.toString(),
                     style: AppFonts.subtileWhite,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(24),
                           color: AppPalette.black.withOpacity(0.5)
                         ),
                         child: Padding(
                           padding: const EdgeInsets.all(8),
                           child: Text(
                             pokedex!.pokemon![index].type![0].toString(),
                             style: AppFonts.subtitleSmallWhite,
                           ),
                         ),
                       ),
                       Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(50),
                           boxShadow: [
                             BoxShadow(
                               color: AppPalette.white.withOpacity(0.5),
                               spreadRadius: 5,
                               blurRadius: 8,
                               offset: const Offset(0, 3)

                             )
                           ]
                         ),
                         child: Hero(tag: index, child: CachedNetworkImage(
                           placeholder: (context, url) => 
                            const CircularProgressIndicator(),
                          
                          imageUrl: pokedex!.pokemon![index].img ?? '',
                          height: 90,
                          width: 90,
                           
                         )),
                       ),
                       
                     ],
                   )
                 ],
               ),
             ),
           ),
         ),
       );
     }
    );
  }


  
}