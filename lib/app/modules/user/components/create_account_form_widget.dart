import 'package:flutter/material.dart';
import 'package:flutter_sb/app/modules/user/components/custom_input_widget.dart';

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
                  const Text(
                    'Crie sua conta gratuitamente',
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
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(),
                            onPressed: () {},
                            child: const Text('Criar conta gratuita'),
                          ),
                        ),
                        SizedBox(
                          width: constraints.maxWidth * 0.8,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xffFB6B40),
                            ),
                            onPressed: () {},
                            child: const Text('Já sou cadastrado'),
                          ),
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
