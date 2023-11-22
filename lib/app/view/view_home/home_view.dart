import 'package:auto_route/auto_route.dart';
import 'package:banking_mobile_app/app/model/account_model.dart';
import 'package:banking_mobile_app/app/model/transaction_model.dart';
import 'package:banking_mobile_app/app/routes/app_router.dart';
import 'package:banking_mobile_app/app/view/view_auth/bloc/auth_bloc.dart';
import 'package:banking_mobile_app/core/constants/color_constant.dart';
import 'package:banking_mobile_app/core/extension/context_extension.dart';
import 'package:banking_mobile_app/core/widgets/custom_elevated_button.dart';
import 'package:banking_mobile_app/core/widgets/custom_text_widget.dart';
import 'package:banking_mobile_app/gen/assets.gen.dart';
import 'package:banking_mobile_app/services/firestore/account_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  HomeView({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const _CustomDrawerWidget(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          IconButton(
            onPressed: () async {
              context.read<AuthBloc>().add(SignOutEvent(context: context));
            },
            icon: const Icon(Icons.power_settings_new_outlined),
          ),
        ],
      ),
      body: FutureBuilder<Account>(
        future: AccountService().getAccount(),
        builder: (context, snapshot) {
          return Padding(
            padding: context.paddingMedium,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //const _BankAndCrediCartButton(),
                SizedBox(
                  height: context.height * 0.02,
                ),
                Container(
                  width: context.width * 0.9,
                  height: context.height * 0.3,
                  decoration: BoxDecoration(
                    color: DarkColorConstants.cardColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      _CardInfoWidget(
                        accountNumber: snapshot.data?.accountNumber ?? '',
                      ),
                      _BalanceWidget(balance: snapshot.data?.totalMoney ?? ''),
                      const Divider(
                        indent: 20,
                        endIndent: 20,
                        color: Colors.white,
                      ),
                      const _CardItemsWidget(),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),

                SizedBox(
                  height: context.height * 0.03,
                ),
                const CustomTextWidget(text: 'Transactions'),
                const _TransactionListView(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _TransactionListView extends StatelessWidget {
  const _TransactionListView();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<TransactionModel>>(
        future: AccountService().getTransaction(),
        builder: (context, snapshot) {
          final transactionList = snapshot.data ?? [];
          return Card(
            color: DarkColorConstants.cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.zero,
            child: ListView.builder(
              itemCount: transactionList.length,
              itemBuilder: (context, index) {
                final transactionModel =
                    snapshot.data?[index] ?? const TransactionModel();
                const checkAccount = false;

                return FutureBuilder<bool>(
                  future: AccountService()
                      .checkAccount(transactionModel.fromAccountID ?? ''),
                  builder: (context, snapshot1) {
                    final isFromAccount = snapshot1.data ?? checkAccount;
                    return Column(
                      children: [
                        ListTile(
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                transactionModel.date!.year.toString(),
                              ),
                              Text(
                                ' ${transactionModel.date!.month} / ${transactionModel.date!.day}',
                              ),
                              Text(
                                '${transactionModel.date!.hour} : ${transactionModel.date!.minute}',
                              ),
                            ],
                          ),
                          title: const CustomTextWidget(
                            text: 'Hesap Numarası',
                            fontsize: 15,
                          ),
                          subtitle: CustomTextWidget(
                            text: transactionModel.fromAccountID ?? '',
                            fontsize: 15,
                          ),
                          trailing: CustomTextWidget(
                            text: isFromAccount
                                ? '- ${transactionModel.amount}'
                                : '+ ${transactionModel.amount}',
                            fontsize: 15,
                          ),
                        ),
                        const Divider(
                          indent: 20,
                          endIndent: 20,
                          color: Colors.white,
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _SendMoneyListView extends StatelessWidget {
  const _SendMoneyListView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.12,
      child: Card(
        color: DarkColorConstants.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(5),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return SizedBox(
              child: SizedBox(
                width: context.width * 0.20,
                child: Center(
                  child: ListTile(
                    contentPadding: context.onlyRightPaddingNormal,
                    title: const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                        'https://randomuser.me/api/portraits/men/87.jpg',
                      ),
                    ),
                    subtitle: const CustomTextWidget(
                      text: 'Ahmet.K',
                      fontsize: 12,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CardItemsWidget extends StatelessWidget {
  const _CardItemsWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.8,
      height: context.height * 0.1,
      decoration: BoxDecoration(
        color: const Color(0xff20222a),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _CustomFloatButton(
            onPressed: () {
              context.router.push(AddNewTransferRoute());
            },
            child: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
          _CustomFloatButton(
            backgroundColor: Colors.grey,
            onPressed: () {},
            child: const Icon(
              Icons.document_scanner,
              color: Colors.white,
            ),
          ),
          _CustomFloatButton(
            backgroundColor: Colors.grey,
            onPressed: () {},
            child: const Icon(
              Icons.compare_arrows_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _BankAndCrediCartButton extends StatelessWidget {
  const _BankAndCrediCartButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.9,
      height: 30,
      child: Row(
        children: [
          Expanded(
            child: CustomElevatedButton(
              backgroundColor: DarkColorConstants.cardColor,
              text: 'Banka Kartları',
              fontWeight: FontWeight.normal,
              onPressed: () {},
            ),
          ),
          Expanded(
            child: CustomElevatedButton(
              fontWeight: FontWeight.normal,
              backgroundColor: DarkColorConstants.cardColor.withOpacity(0.3),
              text: 'Kredi Kartları',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomDrawerWidget extends StatelessWidget {
  const _CustomDrawerWidget();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: context.height * 0.1,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: Image.network(
                  'https://randomuser.me/api/portraits/women/79.jpg',
                ),
              ),
              title: const CustomTextWidget(
                text: 'Angle',
              ),
              subtitle: const CustomTextWidget(
                text: 'Anglee',
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Ana Sayfa',
            ),
            leading: const Icon(Icons.home),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Hesaplarım'),
            leading: const Icon(Icons.account_balance_wallet),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Kartlarım'),
            leading: const Icon(Icons.credit_card),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Para Transferi'),
            leading: const Icon(Icons.send),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Belge Tarama'),
            leading: const Icon(Icons.document_scanner),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _CustomFloatButton extends StatelessWidget {
  const _CustomFloatButton({
    required this.child,
    required this.onPressed,
    this.backgroundColor,
  });
  final Widget child;
  final void Function() onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      elevation: 0,
      backgroundColor:
          backgroundColor ?? DarkColorConstants.elevatedButtonColor,
      onPressed: onPressed,
      child: child,
    );
  }
}

class _BalanceWidget extends StatelessWidget {
  const _BalanceWidget({required this.balance});
  final String balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.8,
      height: context.height * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: const CustomTextWidget(text: 'Bakiye'),
        trailing: CustomTextWidget(text: balance),
      ),
    );
  }
}

class _CardInfoWidget extends StatelessWidget {
  const _CardInfoWidget({required this.accountNumber});
  final String accountNumber;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: context.onlyLeftPaddingNormal,
      leading: Image.asset(
        Assets.images.crediCart.path,
      ),
      title: Text(
        'Vadesiz TL Hesabı',
        style: context.textTheme.titleMedium?.copyWith(
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        accountNumber,
        style: context.textTheme.titleMedium?.copyWith(
          color: Colors.white,
        ),
      ),
      trailing: IconButton(
        splashRadius: 0.1,
        onPressed: () {},
        icon: const Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
      ),
    );
  }
}
