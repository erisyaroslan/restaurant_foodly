import 'package:flutter/material.dart';
import 'package:restaurant_foodly/common/background_container.dart';
import 'package:restaurant_foodly/common/custom_appbar.dart';
import 'package:restaurant_foodly/constants/constants.dart';
import 'package:restaurant_foodly/views/widget/home_tabs.dart';
import 'package:restaurant_foodly/views/widget/home_tiles.dart';
import 'package:restaurant_foodly/views/widget/orders/cancelled_orders.dart';
import 'package:restaurant_foodly/views/widget/orders/delivered.dart';
import 'package:restaurant_foodly/views/widget/orders/new_orders.dart';
import 'package:restaurant_foodly/views/widget/orders/picked_orders.dart';
import 'package:restaurant_foodly/views/widget/orders/preparing.dart';
import 'package:restaurant_foodly/views/widget/orders/ready_orders.dart';
import 'package:restaurant_foodly/views/widget/orders/self_deliveries.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  late final TabController _tabController = TabController(
      length: orderList.length,
      vsync: this,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        flexibleSpace: const CustomAppbar(),
      ),
      body: BackGroundContainer(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 15,
            ),
              const HomeTiles(),
            const SizedBox(
              height: 15,
            ),
            HomeTabs(tabController: _tabController),

            const SizedBox(
              height: 15,
            ),

            ClipRRect(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                height: hieght * 0.7,
                color: Colors.transparent,
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    NewOrders(),
                    Preparing(),
                    ReadyOrders(),
                    PickedOrders(),
                    SelfDeliveries(),
                    Delivered(),
                    CancelledOrders(),


                  ],
                ),
              ),
            )
          ],

        )
      ),
    );
  }
}
