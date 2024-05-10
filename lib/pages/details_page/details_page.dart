import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/bloc/landing_page/landing_page_bloc.dart';
import 'package:proyecto_final/data_models/manga_data.dart';
import 'package:proyecto_final/pages/details_page/details_app_bar.dart';
import 'package:proyecto_final/pages/details_page/details_footer.dart';
import 'package:proyecto_final/pages/details_page/details_header.dart';
import 'package:proyecto_final/pages/details_page/details_list.dart';

class DetailsPageArguments {
  final String mangaId;

  DetailsPageArguments(this.mangaId);
}

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List data = [];
  String id = '';

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () => getD());
    BlocProvider.of<LandingPageBloc>(context).add(CleanLandingPage());
  }

  Future<void> getD() async {
    final DetailsPageArguments args =
        ModalRoute.of(context)!.settings.arguments as DetailsPageArguments;
    MangaModel toAdd = MangaModel();

    this.id = args.mangaId;

    for (var i = 1; i < 6; i++) {
      data.add(await toAdd.getDataById(args.mangaId, i.toString()));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailsAppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DetailsHeader(),
            DetailsList(data: data, id: id),
            DetailsFooter(),
          ],
        ),
      ),
    );
  }
}
