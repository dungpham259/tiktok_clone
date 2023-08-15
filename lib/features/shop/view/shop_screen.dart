import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok/core/utils/helper/bar_helper.dart';
import 'package:tiktok/features/app/cubit/app_cubit.dart';
import 'package:tiktok/features/app/models/alert_model.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<AppCubit, AppState>(
          buildWhen: (previous, current) => previous.num != current.num,
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Shop',
                ),
                AAAA(),
                ABC(),
                ElevatedButton(
                    onPressed: () {
                      context.read<AppCubit>().increase();
                    },
                    child: Icon(Icons.add)),
                TextButton(
                  onPressed: () => BarHelper.showAlert(
                    context,
                    alert: AlertModel(
                      message: 'fdfdfdf',
                      type: AlertType.notification,
                    ),
                  ),
                  child: const Text("Throw Test Exception"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ABC extends StatelessWidget {
  const ABC({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Alllo');
  }
}

class AAAA extends StatelessWidget {
  const AAAA({super.key});

  @override
  Widget build(BuildContext context) {
    final a = context.select((AppCubit bloc) => bloc.state.num);
    return Text(a.toString());
  }
}
