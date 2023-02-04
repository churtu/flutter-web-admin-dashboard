import 'package:admin_dashboard/src/providers/providers.dart';
import 'package:admin_dashboard/src/router/router.dart';
import 'package:admin_dashboard/src/ui/buttons/buttons.dart';
import 'package:admin_dashboard/src/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterFormProvider(),
      child: Builder(builder: (context) {
        final registerFormProvider =
            Provider.of<RegisterFormProvider>(context, listen: false);
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        return Container(
          margin: const EdgeInsets.only(top: 50),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 370),
              child: Form(
                key: registerFormProvider.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormField(
                      onFieldSubmitted: (value) => onSubmit(registerFormProvider, authProvider),
                      validator: (value) {
                        if (value == null || value.isEmpty){
                          return 'Ingrese un nombre.';
                        }
                        return null;
                      },
                      onChanged: (value) => registerFormProvider.name = value,
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.authInputDecoration(
                          hint: 'Ingrese su nombre',
                          label: 'Nombre',
                          icon: Icons.supervised_user_circle_outlined),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onFieldSubmitted: (value) => onSubmit(registerFormProvider, authProvider),
                      validator: (value) {
                        if (value == null || value.isEmpty){
                          return 'Ingrese su email.';
                        }
                        if (!EmailValidator.validate(value)){
                          return 'Email no válido.';
                        }
                        return null;
                      },
                      onChanged: (value) => registerFormProvider.email = value,
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.authInputDecoration(
                          hint: 'Ingrese su correo',
                          label: 'Email',
                          icon: Icons.email_outlined),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onFieldSubmitted: (value) => onSubmit(registerFormProvider, authProvider),
                      validator: (value) {
                        if (value == null || value.isEmpty){
                          return 'Ingrese su contraseña.';
                        }
                        if (value.length < 6){
                          return 'La contraseña debe de ser de 6 carácteres.';
                        }
                        return null;
                      },
                      onChanged: (value) =>
                          registerFormProvider.password = value,
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.authInputDecoration(
                          hint: '******',
                          label: 'Contraseña',
                          icon: Icons.lock_outline),
                    ),
                    const SizedBox(height: 20),
                    CustomOutlinedButton(onPressed: () => onSubmit(registerFormProvider, authProvider), 
                    text: 'Registrar'),
                    const SizedBox(height: 20),
                    LinkText(
                      text: 'Ir al login',
                      onPressed: () {
                        Navigator.pushNamed(context, AppRouter.loginRoute);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void onSubmit(
      RegisterFormProvider registerFormProvider, AuthProvider authProvider) {
    if (!registerFormProvider.validateForm()) return;
    authProvider.register(registerFormProvider.name, registerFormProvider.email,
        registerFormProvider.password);
  }
}
