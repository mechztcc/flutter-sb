import 'package:flutter/material.dart';
import 'package:flutter_sb/app/modules/address/models/address_model.dart';
import 'package:flutter_sb/app/modules/user/components/custom_input_widget.dart';
import 'package:flutter_sb/app/modules/user/components/gradient_button_widget.dart';
import 'package:validatorless/validatorless.dart';

class CreateAddressFormWidget extends StatefulWidget {
  final String title;
  final double width;
  final double height;
  final Function addAddress;
  final Function back;
  const CreateAddressFormWidget({
    Key? key,
    this.title = "CreateAddressFormWidget",
    required this.width,
    required this.height,
    required this.addAddress,
    required this.back,
  }) : super(key: key);

  @override
  State<CreateAddressFormWidget> createState() =>
      _CreateAddressFormWidgetState();
}

class _CreateAddressFormWidgetState extends State<CreateAddressFormWidget> {
  final _formKey1 = GlobalKey<FormState>();
  final zipEC = TextEditingController();
  final streetEC = TextEditingController();
  final numberEC = TextEditingController();
  final cityEC = TextEditingController();
  final stateEC = TextEditingController();



  @override
  Widget build(BuildContext context) {
    const gradient = [Color(0xff5F72E4), Color(0xff805EE4)];

    void validateForm() async {
      var isValid = _formKey1.currentState?.validate();
      if (isValid ?? false) {
        AddressModel address = AddressModel(
          zipCode: zipEC.text,
          number: numberEC.text,
          city: cityEC.text,
          state: stateEC.text,
          street: streetEC.text
        );
        widget.addAddress(address);
      }
    }

    return Center(
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        // color: Colors.red,
        child: Form(
          key: _formKey1,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Adicionar endereço',
                  style: TextStyle(fontSize: 30),
                ),
                CustomInputWidget(
                  label: 'CEP',
                  icon: const Icon(Icons.location_on),
                  validator: Validatorless.multiple([
                    Validatorless.required('Cep é requerido'),
                    Validatorless.min(9, 'formato inválido'),
                  ]),
                  controller: zipEC,
                ),
                CustomInputWidget(
                  label: 'Rua',
                  icon: const Icon(Icons.map_rounded),
                  validator: Validatorless.multiple([
                    Validatorless.required('Rua é requerido'),
                    Validatorless.min(10, 'formato inválido'),
                  ]),
                  controller: streetEC,
                ),
                CustomInputWidget(
                  label: 'Cidade',
                  icon: const Icon(Icons.map_rounded),
                  validator: Validatorless.multiple(
                    [Validatorless.required('Cidade é requerido')],
                  ),
                  controller: cityEC,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: widget.width * 0.4,
                      child: CustomInputWidget(
                        label: 'Número',
                        icon: const Icon(Icons.home_max_outlined),
                        validator: Validatorless.multiple(
                          [Validatorless.required('Número é requerido')],
                        ),
                        controller: numberEC,
                      ),
                    ),
                    SizedBox(
                      width: widget.width * 0.4,
                      child: CustomInputWidget(
                        label: 'Estado',
                        icon: const Icon(Icons.map_rounded),
                        validator: Validatorless.multiple(
                          [Validatorless.required('Estado é requerido')],
                        ),
                        controller: stateEC,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: widget.width,
                  child: GradientButtonWidget(
                    label: 'Criar conta gratuita',
                    gradient: gradient,
                    func: () {
                      validateForm();
                    },
                  ),
                ),
                SizedBox(
                  width: widget.width,
                  child: GradientButtonWidget(
                    label: 'Voltar',
                    gradient: const [
                      Color(0xffFB6440),
                      Color(0xffFBAF40),
                    ],
                    func: () {
                      widget.back();
                    },
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
