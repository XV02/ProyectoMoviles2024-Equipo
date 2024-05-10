import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/auth/bloc/bloc/auth_bloc.dart';
import 'package:proyecto_final/bloc/favorites_page/favorites_page_bloc.dart';
import 'package:proyecto_final/bloc/shopping_cart/shopping_cart_bloc.dart';
import 'package:proyecto_final/code_scanner/code_scanner.dart';
import 'package:proyecto_final/pages/favorites_page/favorites_page.dart';
import 'package:proyecto_final/pages/individual_item/manga.dart';
import 'package:proyecto_final/pages/shopping_cart/shopping_cart_page.dart';
import 'package:proyecto_final/pages/landing_page/landing_page.dart';
import 'package:proyecto_final/pages/login_page/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proyecto_final/shared/widgets/loading_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => AuthBloc()..add(VerifyAuthEvent())),
    BlocProvider(create: (context) => FavoritesPageBloc()),
    BlocProvider(create: (context) => ShoppingCartBloc())
  ], child: const MyApp()));
}

// children: [SizedBox(child:mangaInfo(),width: MediaQuery.of(context).size.width*.99,height:MediaQuery.of(context).size.height*.99,),]
class MyApp extends StatelessWidget {
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
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
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
                    BlocProvider.of<ShoppingCartBloc>(context)
                        .add(LoadShoppingCart());
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
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
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
          '/QR-Scanner': (context) => BlocConsumer<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthSuccessState) {
                    return const CodeScanner();
                  } else if (state is UnAuthState ||
                      state is AuthErrorState ||
                      state is SignOutSuccessState) {
                    return const LoginPage();
                  }
                  return const LoadingPage();
                },
                listener: (context, state) {
                  if (state is AuthErrorState) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
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
                    BlocProvider.of<FavoritesPageBloc>(context)
                        .add(LoadFavorites());
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
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
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
          '/MangaItem': (context) => BlocConsumer<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthSuccessState) {
                    return const MangaItem();
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
        ));
  }
}
