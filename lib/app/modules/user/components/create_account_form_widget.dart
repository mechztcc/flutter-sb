import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/user/components/custom_input_widget.dart';
import 'package:flutter_sb/app/modules/user/components/gradient_button_widget.dart';
import 'package:flutter_sb/app/modules/user/controllers/user_store.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:validatorless/validatorless.dart';

class CreateAccountFormWidget extends StatefulWidget {
  final String title;

  const CreateAccountFormWidget({
    Key? key,
    this.title = "CreateAccountFormWidget",
  }) : super(key: key);

  @override
  State<CreateAccountFormWidget> createState() =>
      _CreateAccountFormWidgetState();
}

class _CreateAccountFormWidgetState
    extends ModularState<CreateAccountFormWidget, UserStore> {
  final _formKey = GlobalKey<FormState>();

  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  var isSaving = false;

  void validateForm() async {
    var isValid = _formKey.currentState?.validate();
    if (isValid ?? false) {
      setState(() {
        isSaving = true;
      });
      await controller.createAccount(
          nameEC.text, emailEC.text, passwordEC.text);
      setState(() {
        isSaving = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, BoxConstraints constraints) => Material(
        // elevation: 1,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: constraints.maxWidth * 0.8,
          height: constraints.maxHeight * 0.7,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: isSaving == true
                  ? Center(
                      child: LoadingAnimationWidget.inkDrop(
                          color: const Color(0xff805EE4), size: 40))
                  : Column(
                      children: [
                        const Text(
                          'Bem-vindo',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Crie sua conta gratuitamente',
                          style: TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              CustomInputWidget(
                                controller: nameEC,
                                validator: Validatorless.required(
                                  'Nome é Obrigatorio',
                                ),
                                label: 'Nome completo',
                                icon: const Icon(Icons.person),
                              ),
                              CustomInputWidget(
                                controller: emailEC,
                                validator: Validatorless.multiple([
                                  Validatorless.required('Campo obrigatório'),
                                  Validatorless.number('Telefone inválido'),
                                  Validatorless.min(8, 'Telefone inválido')
                                ]),
                                label: 'Telefone',
                                icon: const Icon(Icons.phone),
                              ),
                              CustomInputWidget(
                                controller: passwordEC,
                                validator: Validatorless.multiple([
                                  Validatorless.required('Campo obrigatorio'),
                                  Validatorless.min(
                                    6,
                                    'Tamanho mínimo incorreto',
                                  )
                                ]),
                                label: 'Senha',
                                icon: const Icon(Icons.lock),
                              ),
                              SizedBox(
                                width: constraints.maxWidth * 0.8,
                                child: GradientButtonWidget(
                                  func: validateForm,
                                  label: 'Criar conta gratuita',
                                  gradient: const [
                                    Color(0xff5F72E4),
                                    Color(0xff805EE4),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: constraints.maxWidth * 0.8,
                                child: GradientButtonWidget(
                                  func: () {
                                    Modular.to.pushNamed('/login');
                                  },
                                  label: 'Já sou cadastrado',
                                  gradient: const [
                                    Color(0xffFB6440),
                                    Color(0xffFBAF40),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: const [
                                  Expanded(
                                    child: Divider(),
                                  )
                                ],
                              ),
                              const Text(
                                'Ao criar uma conta você concorda com os Termos de acesso & Privacidade',
                                style: TextStyle(color: Colors.black54),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
