import 'package:auto_route/auto_route.dart';
import 'package:banking_mobile_app/app/repository/user_repository.dart';
import 'package:banking_mobile_app/app/routes/app_router.dart';
import 'package:banking_mobile_app/core/constants/color_constant.dart';
import 'package:banking_mobile_app/core/extension/context_extension.dart';
import 'package:banking_mobile_app/core/widgets/custom_app_bar.dart';
import 'package:banking_mobile_app/core/widgets/custom_elevated_button.dart';
import 'package:banking_mobile_app/core/widgets/custom_text_field.dart';
import 'package:banking_mobile_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AddNewTransferView extends StatelessWidget {
  AddNewTransferView({super.key});

  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Add New Recipient',
      ),
      body: Padding(
        padding: context.paddingLow,
        child: Column(
          children: [
            SizedBox(
              height: context.height * 0.05,
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
            CustomTextField(
              controller: _accountNumberController,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt_outlined),
              ),
              prefixIcon: const Icon(Icons.account_balance_wallet_rounded),
              hintText: 'Account number',
            ),
            SizedBox(
              height: context.height * 0.04,
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
            CustomTextField(
              controller: _amountController,
              prefixIcon: const Icon(Icons.attach_money_outlined),
              hintText: 'Amount',
            ),
            const Spacer(),
            Padding(
              padding: context.onlyBottomPaddingMedium,
              child: CustomElevatedButton(
                text: 'Add Recipient',
                onPressed: () async {
                  final transferResponse = await UserRepository().transferMoney(
                    _accountNumberController.text,
                    double.parse(_amountController.text),
                  );
                  if (transferResponse) {
                    if (!context.mounted) return;
                    await showDialog<Widget>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: DarkColorConstants.cardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: const Text('Success'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(Assets.images.successAmount.path),
                              const Text(
                                'Your transfer has been successfully completed.',
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomElevatedButton(
                                text: 'OK',
                                onPressed: () {
                                  context.router.push(HomeRoute());
                                },
                              ),
                            ],
                          ),
                       
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
