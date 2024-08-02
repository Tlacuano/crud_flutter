import 'package:crud_flutter/presentation/cubit/BarcaCubit.dart';
import 'package:crud_flutter/presentation/screens/add_barca.dart';
import 'package:crud_flutter/presentation/screens/update_barca.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crud_flutter/data/repository/BarcaRepository.dart';
import 'package:crud_flutter/presentation/screens/barca_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => BarcaRepository(
              apiUrl:
                  'https://7qu51gmg6j.execute-api.us-east-2.amazonaws.com/Prod'),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BarcaCubit(
                barcaRepository:
                    RepositoryProvider.of<BarcaRepository>(context)),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const BarcaPage(),
          routes: {
            '/addBarca': (context) => const AddBarcaPage(),
          },
        ),
      ),
    );
  }
}
