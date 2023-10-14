import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rm/cubit/cubit.dart';
import 'package:flutter_rm/cubit/transaction_cubit.dart';
import 'package:flutter_rm/cubit/user_cubit.dart';
import 'package:flutter_rm/models/models.dart';
import 'package:get/get.dart';

import 'ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit()),
        BlocProvider(create: (_) => FoodCubit()),
        BlocProvider(create: (_) => TransactionCubit())
      ],
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false, 
        // home: PaymentPage(transaction: mockTransactions[1], user: mockuser, quantity: 2, total: mockTransactions[1].total),
        home: SignInPage()
        ),
    );
  }
}
