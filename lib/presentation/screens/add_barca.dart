import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crud_flutter/presentation/cubit/BarcaCubit.dart';
import 'package:crud_flutter/data/model/Barca.dart';
import 'package:crud_flutter/data/repository/BarcaRepository.dart';

class AddBarcaPage extends StatefulWidget {
  const AddBarcaPage({super.key});

  @override
  _AddBarcaPageState createState() => _AddBarcaPageState();
}

class _AddBarcaPageState extends State<AddBarcaPage> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _tipoController = TextEditingController();
  final _longitudController = TextEditingController();
  final _capacidadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Nueva Barca'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _tipoController,
                decoration: const InputDecoration(labelText: 'Tipo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un tipo';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _longitudController,
                decoration: const InputDecoration(labelText: 'Longitud'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa una longitud';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _capacidadController,
                decoration: const InputDecoration(labelText: 'Capacidad'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa una capacidad';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newBarca = BarcaModel(
                      nombre: _nombreController.text,
                      tipo: _tipoController.text,
                      longitud: double.parse(_longitudController.text),
                      capacidad: int.parse(_capacidadController.text),
                      id: 0,
                    );
                    BlocProvider.of<BarcaCubit>(context).createBarca(newBarca);
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _tipoController.dispose();
    _longitudController.dispose();
    _capacidadController.dispose();
    super.dispose();
  }
}
