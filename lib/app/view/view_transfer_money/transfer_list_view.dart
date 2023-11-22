import 'package:auto_route/auto_route.dart';
import 'package:banking_mobile_app/app/l10n/app_localizations.dart';
import 'package:banking_mobile_app/app/routes/app_router.dart';
import 'package:banking_mobile_app/core/constants/color_constant.dart';
import 'package:banking_mobile_app/core/extension/context_extension.dart';
import 'package:banking_mobile_app/core/widgets/custom_app_bar.dart';
import 'package:banking_mobile_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TransferListView extends StatelessWidget {
  const TransferListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      appBar:  CustomAppBar(
        title: L10n.of(context)!.transferMoney,
      ),
      body: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            const CustomTextField(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search',
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
            const Divider(
              color: Colors.grey,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.grey,
                ),
                itemCount: 10,
                itemBuilder: (context, snapshot) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://randomuser.me/api/portraits/men/14.jpg',
                      ),
                    ),
                    title: const Text('John Doe'),
                    subtitle: const Text('121212232'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.star_border,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
