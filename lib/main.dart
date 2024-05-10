

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/auth/bloc/bloc/auth_bloc.dart';
import 'package:proyecto_final/pages/details_page/details_page.dart';
import 'package:proyecto_final/pages/shopping_cart/shopping_cart_page.dart';
import 'package:proyecto_final/pages/landing_page/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proyecto_final/firebase_options.dart';
import 'package:proyecto_final/pages/login_page/login_page.dart';
import 'package:proyecto_final/providers/manga_prov_class.dart';
import 'package:proyecto_final/shared/widgets/loading_page.dart';



import 'package:provider/provider.dart';
import 'package:proyecto_final/shared/widgets/manga_item.dart';

import 'package:proyecto_final/pages/favorites_page/favorites_page.dart';


final List<String> items =["801513ba-a712-498c-8f57-cae55b38cc92", "52ede55c-1584-4019-b85b-3902a423c3ab","a1c7c817-4e59-43b7-9365-09675a149a6f"];
void main() {
  runApp(
    ChangeNotifierProvider(create: (context)=> MangaClassProvider(),
    child: const MyApp(),)
    
  );
} 
// children: [SizedBox(child:mangaInfo(),width: MediaQuery.of(context).size.width*.99,height:MediaQuery.of(context).size.height*.99,),]
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override


  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      routes: Map<String, WidgetBuilder>.from({
        '/': (context) => BlocConsumer<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthSuccessState) {
                  return const LandingPage();
                } else if (state is UnAuthState ||
                    state is AuthErrorState ||
                    state is SignOutSuccessState) {
                  return const LoginPage();
                }
                return const LoadingPage();
              },
              listener: (context, state) {
                if (state is AuthErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "There was an error",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.black,
                    ),
                  );
                }
              },
            ),
        '/shopping-cart': (context) => BlocConsumer<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthSuccessState) {
                  return const ShoppingCartPage();
                } else if (state is UnAuthState ||
                    state is AuthErrorState ||
                    state is SignOutSuccessState) {
                  return const LoginPage();
                }
                return const LoadingPage();
              },
              listener: (context, state) {
                if (state is AuthErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "There was an error",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.black,
                    ),
                  );
                }
              },
            ),
        '/favorites-page': (context) => BlocConsumer<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthSuccessState) {
                  return const FavoritesPage();
                } else if (state is UnAuthState ||
                    state is AuthErrorState ||
                    state is SignOutSuccessState) {
                  return const LoginPage();
                }
                return const LoadingPage();
              },
              listener: (context, state) {
                if (state is AuthErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "There was an error",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.black,
                    ),
                  );
                }
              },
            ),
      }),
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.red,
          shadowColor: Colors.transparent,

        ),
      





    );
      
     
  }
}