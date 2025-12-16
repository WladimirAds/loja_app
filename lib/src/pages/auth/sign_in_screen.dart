import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_app/src/pages/commom_widgets/app_name_widget.dart';
import 'package:loja_app/src/pages/commom_widgets/custom_text_field.dart';
import 'package:loja_app/src/pages/base/base_screen.dart';
import 'package:loja_app/src/peges_routes/app_pages.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Nome do App
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppNameWidget(
                          greenTitleColor: Colors.white,
                          textSize: 40,
                        ),
                        SizedBox(
                          height: 50,
                          width: 200,
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                            child: AnimatedTextKit(
                              pause: Duration.zero,
                              repeatForever: true,
                              animatedTexts: [
                                FadeAnimatedText(
                                  'App',
                                  duration: Duration(milliseconds: 3000),
                                ),
                                FadeAnimatedText(
                                  'Qualidade',
                                  duration: Duration(milliseconds: 3000),
                                ),
                                FadeAnimatedText(
                                  'Sempre!',
                                  duration: Duration(milliseconds: 3000),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Formulário
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Email
                      CustomTextField(
                        icon: Icons.email,
                        label: 'Email',
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Digite seu email';
                          }
                          if (!email.isEmail) return 'Digite um email válido';

                          return null;
                        },
                      ),

                      // Senha
                      CustomTextField(
                        icon: Icons.lock,
                        label: 'Senha',
                        isSecret: true,
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return 'Digite sua senha';
                          }
                          if (password.length < 7) {
                            return 'Senha deve ter no mínimo 7 caracteres';
                          }
                          return null;
                        },
                      ),

                      //Botão entrar
                      SizedBox(
                        height: 50,
                        //width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              Colors.green,
                            ),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                          ),
                          onPressed: () {
                            _formKey.currentState!.validate();

                            //Get.offNamed(PagesRoutes.baseRoutes);
                          },
                          child: const Text(
                            'Entrar',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Esqueci minha senha',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),

                      //DIVISOR
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text('OU'),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Botão criar conta
                      SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () {
                            Get.toNamed(PagesRoutes.signUpRoute);
                          },
                          child: const Text(
                            'Criar Conta',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
