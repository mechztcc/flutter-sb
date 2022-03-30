import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/user/components/custom_input_widget.dart';
import 'package:flutter_sb/app/modules/user/components/gradient_button_widget.dart';
import 'package:flutter_sb/app/modules/user/controllers/user_store.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ModularState<LoginPage, UserStore> {
  final _formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  var isSaving = false;

  void validateForm() async {
    final isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      setState(() {
        isSaving = true;
      });

      await controller.login(emailEC.text, passwordEC.text);
      setState(() {
        isSaving = false;
      });
      Modular.to.pushReplacementNamed('dashboard/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => Center(
          child: Container(
            width: constraints.maxWidth * 0.8,
            height: constraints.maxHeight * 0.7,
            padding: const EdgeInsets.only(top: 30),
            child: isSaving == true
                ? Column(
                  children: const [
                    CircularProgressIndicator(),
                    Text('Enviando informações', style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                )
                : Center(
                  child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Text(
                              'Bem-vindo novamente',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomInputWidget(
                              controller: emailEC,
                              validator: Validatorless.multiple([
                                Validatorless.email('E-mail inválido'),
                                Validatorless.required('E-mail é obrigatório')
                              ]),
                              icon: const Icon(Icons.person),
                              label: 'E-mail',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomInputWidget(
                              label: 'Senha',
                              icon: const Icon(Icons.lock),
                              validator: Validatorless.multiple([
                                Validatorless.required('Senha é obrigatório'),
                                Validatorless.min(6,
                                    'A senha deve conter no mínimo 6 caracteres')
                              ]),
                              controller: passwordEC,
                            ),
                            SizedBox(
                              width: constraints.maxWidth * 0.8,
                              child: GradientButtonWidget(
                                func: validateForm,
                                label: 'Entrar',
                                gradient: const [
                                  Color(0xffFB6440),
                                  Color(0xffFBAF40),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: constraints.maxWidth * 0.8,
                              child: GradientButtonWidget(
                                func: () {
                                  Modular.to.pushNamed('/');
                                },
                                label: 'Criar conta gratuita',
                                gradient: const [
                                  Color(0xff5F72E4),
                                  Color(0xff805EE4),
                                ],
                              ),
                            ),
                            Row(
                              children: const [
                                SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                  child: Divider(),
                                ),
                              ],
                            ),
                            const Text(
                              'Ao entrar você concorda com os Termos de acesso & Privacidade',
                              style: TextStyle(color: Colors.black54),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                ),
          ),
        ),
      ),
    );
  }
}
