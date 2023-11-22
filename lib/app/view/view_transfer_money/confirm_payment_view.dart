// import 'package:auto_route/auto_route.dart';
// import 'package:banking_mobile_app/app/view/view_transfer_money/bloc/cubit/transfer_view_model.dart';
// import 'package:banking_mobile_app/core/extension/context_extension.dart';
// import 'package:banking_mobile_app/core/widgets/custom_app_bar.dart';
// import 'package:banking_mobile_app/core/widgets/custom_elevated_button.dart';
// import 'package:banking_mobile_app/core/widgets/custom_text_widget.dart';
// import 'package:banking_mobile_app/services/firestore/account_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// @RoutePage()
// class ConfirmPaymentView extends StatelessWidget {
//   const ConfirmPaymentView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(
//         title: 'Confirm Payment',
//       ),
//       body: BlocProvider(
//         create: (context) => TransferViewModel(),
//         child: BlocBuilder<TransferViewModel, TransferState>(
//           builder: (context, state) {
//             return Padding(
//               padding: context.paddingMedium,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Align(
//                     alignment: Alignment.topCenter,
//                     child: Card(
//                       child: SizedBox(
//                         height: context.height * 0.5,
//                         width: context.width * 0.8,
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: context.height * 0.02,
//                             ),
//                             const CircleAvatar(
//                               radius: 40,
//                               backgroundImage: NetworkImage(
//                                 'https://randomuser.me/api/portraits/men/60.jpg',
//                               ),
//                             ),
//                             SizedBox(
//                               height: context.height * 0.02,
//                             ),
//                             const Divider(
//                               indent: 20,
//                               endIndent: 20,
//                               color: Colors.black,
//                             ),
//                             SizedBox(
//                               height: context.height * 0.02,
//                             ),
//                             ListTile(
//                               leading: const Text('Amount'),
//                               trailing: CustomTextWidget(
//                                 text: state.amount.toString(),
//                                 fontsize: 15,
//                               ),
//                             ),
//                             // const ListTile(
//                             //   leading: Text('Name'),
//                             //   trailing: CustomTextWidget(
//                             //     text: 'Ailemnn Fullbright',
//                             //     fontsize: 15,
//                             //   ),
//                             // ),
//                             ListTile(
//                               leading: const Text('Bank Account'),
//                               trailing: CustomTextWidget(
//                                 text: state.accountNumber,
//                                 fontsize: 15,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   CustomElevatedButton(
//                     text: 'Confirm Payment',
//                     onPressed: () async {
//                       await AccountService()
//                           .transferMoney(state.accountNumber, state.amount);
//                     },
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
