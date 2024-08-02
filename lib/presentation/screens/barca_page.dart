import 'package:crud_flutter/presentation/screens/add_barca.dart';
import 'package:crud_flutter/presentation/screens/update_barca.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crud_flutter/presentation/cubit/BarcaCubit.dart';
import 'package:crud_flutter/presentation/cubit/BarcaState.dart';
import 'package:crud_flutter/data/repository/BarcaRepository.dart';

class BarcaPage extends StatelessWidget {
  const BarcaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BarcaCubit(barcaRepository: context.read<BarcaRepository>())
            ..getBarcas(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Barca Page'),
        ),
        body: const Center(
          child: BarcaList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                  value: BlocProvider.of<BarcaCubit>(context),
                  child: const AddBarcaPage(),
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class BarcaList extends StatelessWidget {
  const BarcaList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BarcaCubit, BarcaState>(
      builder: (context, state) {
        // Mostrar spinner de carga si el estado es BarcaLoading
        if (state is BarcaLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is BarcaSuccess) {
          return LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount;
              if (constraints.maxWidth >= 1200) {
                crossAxisCount = 5;
              } else if (constraints.maxWidth >= 800) {
                crossAxisCount = 3;
              } else {
                crossAxisCount = 2;
              }

              return GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: state.barcas.length,
                itemBuilder: (context, index) {
                  final barca = state.barcas[index];

                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Nombre: ${barca.nombre}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('Tipo: ${barca.tipo}',
                              style: const TextStyle(fontSize: 14)),
                          Text('Longitud: ${barca.longitud}',
                              style: const TextStyle(fontSize: 14)),
                          Text('Capacidad: ${barca.capacidad}',
                              style: const TextStyle(fontSize: 14)),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => BlocProvider.value(
                                        value: BlocProvider.of<BarcaCubit>(
                                            context),
                                        child: UpdateBarcaPage(barca: barca),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  BlocProvider.of<BarcaCubit>(context)
                                      .deleteBarca(barca);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        } else if (state is BarcaFailure) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: Text('No data'),
          );
        }
      },
    );
  }
}
