import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const TextFormFieldExampleApp());

class TextFormFieldExampleApp extends StatelessWidget {
  const TextFormFieldExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Formulario'),
          backgroundColor: Colors.black87,
          centerTitle: true,
        ),
        body: const TextFormFieldExample(),
      ),
    );
  }
}

class TextFormFieldExample extends StatefulWidget {
  const TextFormFieldExample({Key? key}) : super(key: key);

  @override
  State<TextFormFieldExample> createState() => _TextFormFieldExampleState();
}

class _TextFormFieldExampleState extends State<TextFormFieldExample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> nombres = [
    'Digite su nombre',
    'Digite su apellido',
    'Digite su cedula',
    'Digite su telefono',
    'Digite su usuario',
    'Digite su contraseña'
  ];
  final List<String> encabezado = [
    'Nombre',
    'Apellido',
    'Cedula',
    'Teléfono',
    'Usuario',
    'Contraseña'
  ];

  final List<IconData> iconos = [
    Icons.person,
    Icons.person,
    Icons.credit_card,
    Icons.phone,
    Icons.account_circle,
    Icons.lock,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Shortcuts(
            shortcuts: const <ShortcutActivator, Intent>{
              SingleActivator(LogicalKeyboardKey.space): NextFocusIntent(),
            },
            child: FocusTraversalGroup(
              child: Form(
                
                key: _formKey,
                autovalidateMode: AutovalidateMode.disabled,
                onChanged: () {
                  Form.of(primaryFocus!.context!).save();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      children:
                          List<Widget>.generate(nombres.length, (int index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: ConstrainedBox(
                            constraints:
                                BoxConstraints.tight(const Size(300, 60)),
                            child: TextFormField(
                              style: const TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                              decoration: InputDecoration(
                                hintText: encabezado[index],
                                icon: Icon(iconos[index], color: Colors.blue),
                                // labelText: encabezado[index],
                                labelStyle: const TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                hintStyle: const TextStyle(
                                    fontSize: 16.0, color: Colors.grey),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              keyboardType: index == 2 || index == 3
                                  ? TextInputType.number
                                  : TextInputType.text,
                              inputFormatters: [
                                if (index == 2 || index == 3)
                                  FilteringTextInputFormatter.digitsOnly,
                              ],
                              obscureText: index == 5,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, complete el campo ${encabezado[index]}';
                                }        
                                return null;
                              },
                              onSaved: (String? value) {
                                debugPrint(
                                    'Value for field $index saved as "$value"');
                              },
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 15.0),
                    ElevatedButton(
                      onPressed: () {
                         _formKey.currentState?.validate();
                        if (_formKey.currentState?.validate() ?? false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Datos recibidos exitosamente')),
                          );
                        }
                      },
                      child: const Text('Aceptar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
