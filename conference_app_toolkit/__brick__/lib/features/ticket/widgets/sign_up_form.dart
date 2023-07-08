import 'package:conference_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TicketSignUpForm extends StatelessWidget {
  const TicketSignUpForm({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  final ValueChanged<String>? email;
  final ValueChanged<String>? password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.logo,
            width: 50,
          ),
          const SizedBox(height: 20),
          const Text(
            AppStrings.eventAndYear,
          ),
          const SizedBox(height: 10),
          const FittedBox(
            child: Text(
              AppStrings.eventDate,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            AppStrings.ticketRegistrationSubtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 20),
          AppTextField(
            hintText: 'Email linked to your ticket',
            autofillHints: const [AutofillHints.email],
            onChanged: email,
            inputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 10),
          AppTextField(
            hintText: 'New password',
            autofillHints: const [AutofillHints.password],
            isPassword: true,
            onChanged: password,
            inputType: TextInputType.visiblePassword,
          ),
        ],
      ),
    );
  }
}
