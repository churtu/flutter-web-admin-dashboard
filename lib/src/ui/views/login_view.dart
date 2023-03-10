import 'package:admin_dashboard/src/providers/providers.dart';
import 'package:admin_dashboard/src/router/app_router.dart';
import 'package:admin_dashboard/src/ui/buttons/buttons.dart';
import 'package:admin_dashboard/src/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => LoginFormProvider(),
      child: Builder(builder: (context) {
        final loginFormProvider =
            Provider.of<LoginFormProvider>(context, listen: false);
        return Container(
          margin: const EdgeInsets.only(top: 100),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 370),
              child: Form(
                key: loginFormProvider.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormField(
                      onFieldSubmitted: (value) => onSubmit(loginFormProvider, authProvider),
                      validator: (value) {
                        if (!EmailValidator.validate(value ?? '')) {
                          return 'Email no valido';
                        }
                        return null;
                      },
                      onChanged: (value) => loginFormProvider.email = value,
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.authInputDecoration(
                          hint: 'Ingrese su correo',
                          label: 'Email',
                          icon: Icons.email_outlined),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onFieldSubmitted: (value) => onSubmit(loginFormProvider, authProvider),
                      onChanged: (value) => loginFormProvider.password = value,
                      validator: (value) {
                        if (value == null || value.isEmpty){
                          return 'Ingrese su contrase??a.';
                        }
                        if (value.length < 6){
                          return 'La contrase??a debe de ser de 6 car??cteres.';
                        }
                        return null;
                      },
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.authInputDecoration(
                          hint: '******',
                          label: 'Contrase??a',
                          icon: Icons.lock_outline),
                    ),
                    const SizedBox(height: 20),
                    CustomOutlinedButton(
                        onPressed: () => onSubmit(loginFormProvider, authProvider),
                        text: 'Ingresar'),
                    const SizedBox(height: 20),
                    LinkText(
                      text: 'Nueva cuenta',
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, AppRouter.registerRoute);
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
    LoginFormProvider loginFormProvider,
    AuthProvider authProvider
  ) {
    final isFormValid = loginFormProvider.validateForm();
    if (isFormValid) {
      authProvider.login(loginFormProvider.email, loginFormProvider.password);
    }
  }
}
