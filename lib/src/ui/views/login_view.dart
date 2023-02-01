import 'package:admin_dashboard/src/router/app_router.dart';
import 'package:admin_dashboard/src/ui/buttons/buttons.dart';
import 'package:admin_dashboard/src/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.symmetric( horizontal: 20 ),
      decoration: const BoxDecoration(
        color: Colors.black
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 370),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  style: const TextStyle(
                    color: Colors.white
                  ),
                  decoration: CustomInputs.authInputDecoration(
                    hint: 'Ingrese su correo',
                    label: 'Email',
                    icon: Icons.email_outlined
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  style: const TextStyle(
                    color: Colors.white
                  ),
                  decoration: CustomInputs.authInputDecoration(
                    hint: '******',
                    label: 'Contraseña',
                    icon: Icons.lock_outline
                  ),
                ),
                const SizedBox(height: 20),
                CustomOutlinedButton(
                  onPressed: () {
                    
                  },
                  text: 'Ingresar'
                ),
                const SizedBox(height: 20),
                LinkText(text: 'Nueva cuenta', onPressed: () {
                  Navigator.pushNamed(context, AppRouter.registerRoute);
                },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}