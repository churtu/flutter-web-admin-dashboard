import 'package:admin_dashboard/src/models/usuario.dart';
import 'package:admin_dashboard/src/providers/providers.dart';
import 'package:admin_dashboard/src/router/app_router.dart';
import 'package:admin_dashboard/src/services/notifications_service.dart';
import 'package:admin_dashboard/src/services/services.dart';
import 'package:admin_dashboard/src/ui/cards/cards.dart';
import 'package:admin_dashboard/src/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/src/ui/labels/custom_labels.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerView extends StatefulWidget {
  final String uid;
  const CustomerView({super.key, required this.uid});

  @override
  State<CustomerView> createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  Usuario? customer;
  late CustomerFormProvider customerFormProvider;

  @override
  void initState() {
    super.initState();
    final customersProvider = Provider.of<CustomersProvider>(context, listen: false);
    customerFormProvider = Provider.of<CustomerFormProvider>(context, listen: false);
    customersProvider.getUserById(widget.uid)
      .then(
        (response) {
          if(response == null) return NavigationService.pushReplacementNamed(AppRouter.customersRoute);
          setState(() {
            customer = response;
          });
          customerFormProvider.formKey = GlobalKey<FormState>();
          customerFormProvider.customer = response;
        }
      );
  }
  
  @override
  void dispose() {
    customerFormProvider.customer = null;
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Customer view', style: CustomLabels.h1),
          const SizedBox(height: 10),
          ( customer == null)
          ? const _Loading()
          : const _ViewBody()
        ],
      ),
    );
  }
}

class _ViewBody extends StatelessWidget {
  const _ViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0 : FixedColumnWidth(250)
      },
      children: [
        TableRow(
          children: [
            _Avatar(),
            _CustomerForm(),
          ]
        )
      ],
    );
  }
}

class _CustomerForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final customerFormProvider = Provider.of<CustomerFormProvider>(context);
    final customer = customerFormProvider.customer!;
    return WhiteCard(
      title: 'Información general.',
      child: Form(
        key: customerFormProvider.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              initialValue: customer.nombre,
              onChanged: (value) => customerFormProvider.copyWith(nombre: value),
              validator: (value) {
                if( 
                  value == null ||
                  value.isEmpty || 
                  value.length < 2
                ){
                  return 'El nombre no es válido.';
                }
                return null;
              },
              decoration: CustomInputs.formInputDecoration(
                hint: 'Nombre del usuario', 
                label: 'Nombre', 
                icon: Icons.supervised_user_circle_outlined
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: customer.correo,
              onChanged: (value) => customerFormProvider.copyWith(correo: value),
              validator: (value) {
                if( value == null || !EmailValidator.validate(value)){
                  return 'El correo no es válido.';
                }
                return null;
              },
              decoration: CustomInputs.formInputDecoration(
                hint: 'Correo del usuario', 
                label: 'Correo', 
                icon: Icons.mail_outline
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 100,
              child: MaterialButton(
                color: Colors.indigo,
                elevation: 0,
                onPressed: () async {
                  final customersProvider = Provider.of<CustomersProvider>(context, listen: false);
                  final isOk = await customerFormProvider.updateUser();
                  if(!isOk) return NotificationsService.showSnackbarError('No se pudo actualizar el usuario.');
                  NotificationsService.showSnackbarSuccess('Usuario actualizado.');
                  customersProvider.refreshCustomer(customer);
                  
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.save_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    Text(
                      '  Guardar', 
                      style: TextStyle(color: Colors.white)
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

class _Avatar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final customerFormProvider = Provider.of<CustomerFormProvider>(context);
    final customer = customerFormProvider.customer!;
    return WhiteCard(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Profile', style: CustomLabels.h2),
            const SizedBox(height: 20),
            Stack(
              children: [
                ClipOval(child: Image.asset('no-image.jpg', width: double.infinity)),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),
                    child: FloatingActionButton(
                      elevation: 0,
                      onPressed: () {
                        
                      },
                      backgroundColor: Colors.indigo,
                      child: const Icon(Icons.camera_alt_outlined, size: 20),
                    ),
                  )
                )
              ],
            ),
            const SizedBox(height: 20),
            Text(customer.nombre, style: const TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
      )
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WhiteCard(
      child: SizedBox(
        height: 400,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      )
    );
  }
}