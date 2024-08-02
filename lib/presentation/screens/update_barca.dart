import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crud_flutter/presentation/cubit/BarcaCubit.dart';
import 'package:crud_flutter/data/model/Barca.dart';

class UpdateBarcaPage extends StatefulWidget {
  final BarcaModel barca;

  const UpdateBarcaPage({super.key, required this.barca});

  @override
  _UpdateBarcaPageState createState() => _UpdateBarcaPageState();
}

class _UpdateBarcaPageState extends State<UpdateBarcaPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nombreController;
  late TextEditingController _tipoController;
  late TextEditingController _longitudController;
  late TextEditingController _capacidadController;

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(text: widget.barca.nombre);
    _tipoController = TextEditingController(text: widget.barca.tipo);
    _longitudController =
        TextEditingController(text: widget.barca.longitud.toString());
    _capacidadController =
        TextEditingController(text: widget.barca.capacidad.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actualizar Barca'),
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
                    final updatedBarca = BarcaModel(
                      id: widget.barca.id, // Incluye el ID aquí
                      nombre: _nombreController.text,
                      tipo: _tipoController.text,
                      longitud: double.parse(_longitudController.text),
                      capacidad: int.parse(_capacidadController.text),
                    );
                    BlocProvider.of<BarcaCubit>(context)
                        .updateBarca(updatedBarca);
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Actualizar'),
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
