import 'package:flutter/material.dart';

class TemperatureConvertor extends StatefulWidget {
  TemperatureConvertor({super.key});

  @override
  State<TemperatureConvertor> createState() => _HomePageState();
}

class _HomePageState extends State<TemperatureConvertor> {
  final tcController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  double? temperatureFaranheit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: tcController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null) {
                      return "Temp is null";
                    } else if (value.trim().isEmpty) {
                      return "Temp required";
                    }
                    return null;
                  },
                  decoration:
                      const InputDecoration(hintText: "Enter Temperature Here"),
                ),
                const SizedBox(height: 20),
                const Text('Type the temperature in Celsius'),
                if (temperatureFaranheit != null)
                  Text('$temperatureFaranheit °Fahrenheit'),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {
                      bool isFormValid = _formKey.currentState!.validate();
                      if (!isFormValid) {
                        return;
                      }
                      temperatureFaranheit =
                          double.parse(tcController.text) * (9 / 5) + 32;
                      setState(() {});
                    },
                    child: const Text(
                      'Convert',
                      style: TextStyle(color: Color(0xff146C94)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
