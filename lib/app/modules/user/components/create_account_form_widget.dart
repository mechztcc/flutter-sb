import 'package:flutter/material.dart';
import 'package:flutter_sb/app/modules/user/components/custom_input_widget.dart';
import 'package:flutter_sb/app/modules/user/components/gradient_button_widget.dart';

class CreateAccountFormWidget extends StatelessWidget {
  final String title;
  const CreateAccountFormWidget(
      {Key? key, this.title = "CreateAccountFormWidget"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, BoxConstraints constraints) => Material(
        // elevation: 1,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: constraints.maxWidth * 0.8,
          height: constraints.maxHeight * 0.6,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
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
                    child: Column(
                      children: [
                        const CustomInputWidget(
                          label: 'Nome completo',
                          icon: Icon(Icons.person),
                        ),
                        const CustomInputWidget(
                          label: 'Email',
                          icon: Icon(Icons.email),
                        ),
                        const CustomInputWidget(
                          label: 'Senha',
                          icon: Icon(Icons.lock),
                        ),
                        SizedBox(
                          width: constraints.maxWidth * 0.8,
                          child: const GradientButtonWidget(
                            label: 'Criar conta gratuita',
                            gradient: [
                              Color(0xff5F72E4),
                              Color(0xff805EE4),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: constraints.maxWidth * 0.8,
                          child: const GradientButtonWidget(
                            label: 'Já sou cadastrado',
                            gradient: [
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
