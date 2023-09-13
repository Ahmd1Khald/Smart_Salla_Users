import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Core/utiles/app_functions.dart';
import 'package:salla_users/Core/utiles/constance/assets_images.dart';
import 'package:salla_users/Features/root_screens/presentaiton/views/root_screens.dart';

import '../../../../Core/utiles/constance/text_styles/title_text.dart';
import '../../../../Core/utiles/widgets/empty_cart.dart';
import '../../../home/data/models/order_model.dart';
import '../../../home/presentation/controller/provider/order_provider.dart';
import 'order_widget.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool isEmptyOrders = false;
  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<OrdersProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const TitlesTextWidget(
            label: 'Placed orders',
          ),
        ),
        body: FutureBuilder<List<OrdersModel>>(
          future: ordersProvider.fetchOrder(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: SelectableText(
                    "An error has been occured ${snapshot.error}"),
              );
            } else if (!snapshot.hasData || ordersProvider.getOrders.isEmpty) {
              return EmptyCartWidget(
                image: AssetsImages.orderBag,
                title: "No orders has been placed yet",
                subTitle: "",
                buttonText: "Shop now",
                body: '',
                function: () {
                  AppFunction.pushAndRemove(context, const RoutScreens());
                },
              );
            }
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                  child: OrdersWidgetFree(
                      ordersModelAdvanced: ordersProvider.getOrders[index]),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            );
          }),
        ));
  }
}
