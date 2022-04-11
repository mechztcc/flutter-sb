import 'package:flutter/material.dart';
import 'package:flutter_sb/app/modules/user/components/custom_input_widget.dart';
import 'package:flutter_sb/app/modules/user/components/gradient_button_widget.dart';
import 'package:validatorless/validatorless.dart';

class CreateAddressFormWidget extends StatelessWidget {
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
    required this.addAddress, required this.back,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final zipEC = TextEditingController();
    final streetEC = TextEditingController();
    final numberEC = TextEditingController();
    final cityEC = TextEditingController();
    final stateEC = TextEditingController();

    

    const gradient = [Color(0xff5F72E4), Color(0xff805EE4)];

    return Center(
      child: Container(
        width: width,
        height: height,
        // color: Colors.red,
        child: Column(
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
                  [Validatorless.required('Cidade é requerido')]),
              controller: cityEC,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: CustomInputWidget(
                    label: 'Número',
                    icon: const Icon(Icons.home_max_outlined),
                    validator: Validatorless.multiple(
                        [Validatorless.required('Número é requerido')]),
                    controller: streetEC,
                  ),
                ),
                SizedBox(
                  width: width * 0.55,
                  child: CustomInputWidget(
                    label: 'Estado',
                    icon: const Icon(Icons.map_rounded),
                    validator: Validatorless.multiple(
                        [Validatorless.required('Estado é requerido')]),
                    controller: stateEC,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: width,
              child: GradientButtonWidget(
                label: 'Criar conta gratuita',
                gradient: gradient,
                func: () {},
              ),
            ),
            SizedBox(
              width: width,
              child: GradientButtonWidget(
                label: 'Voltar',
                gradient: const [
                  Color(0xffFB6440),
                  Color(0xffFBAF40),
                ],
                func: () {
                  back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
