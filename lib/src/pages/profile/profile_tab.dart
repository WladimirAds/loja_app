import 'package:flutter/material.dart';
import 'package:loja_app/src/pages/commom_widgets/custom_text_field.dart';
// ignore: library_prefixes
import 'package:loja_app/src/config/app_data.dart' as appData;

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        title: Text('Perfil do usuário'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          // Email
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.email,
            icon: Icons.email,
            label: 'Email',
          ),
          // Nome
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.name,
            icon: Icons.person,
            label: 'Nome',
          ),
          // Celular
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.phone,
            icon: Icons.phone,
            label: 'Celular',
          ),
          // CPF
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.cpf,
            icon: Icons.copy,
            label: 'CPF',
            isSecret: true,
          ),
          // Botão de atualizar a senha
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.green),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                updatePassword();
              },
              child: Text('Atualizar senha'),
            ),
          ),
        ],
      ),
    );
  }

  // Função Dialog Senha
  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Atualização de senha',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Senha atual
                    CustomTextField(
                      icon: Icons.lock,
                      label: 'Senha atual',
                      isSecret: true,
                    ),
                    // Nova senha
                    CustomTextField(
                      icon: Icons.lock_outline,
                      label: 'Nova senha',
                      isSecret: true,
                    ),
                    // Confirmação nove senha
                    CustomTextField(
                      icon: Icons.lock_outline,
                      label: 'Confirmar nova senha',
                      isSecret: true,
                    ),

                    // Botão de confirmação
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {},
                        child: Text(
                          'Atualizar',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
