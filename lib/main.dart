import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/shop',
    defaultTransition: Transition.fade,
    getPages: AppRoutes.pages,
    home: Shop(),
  ));
}

abstract class Routes {
  static const Shop = '/shop';
  static const ShopCart = '/shopcart';
  static const CheckOut = '/checkout';
  static const Payment = '/payment';
}

abstract class AppRoutes {
  static final pages = [
    GetPage(
      name: Routes.Shop,
      page: () => Shop(),
    ),
    GetPage(
      name: Routes.ShopCart, 
      page: () => ShopCart()
    ),
    GetPage(
      name: Routes.CheckOut,
      page: () => CheckOut(),
    ),
    GetPage(
      name: Routes.Payment,
      page: () => Payment(),
    ),
  ];
}

class Shop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text('商品列表'),
        ),
        body: new ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                    height: 50,
                    color: Colors.amber[600],
                    child: const Center(
                      child: Text('眼鏡'),
                    )),
                TextButton(
                    onPressed: () {
// 導航到下一個頁面
                      Get.toNamed(Routes.ShopCart, arguments: '眼鏡');
                    },
                    child: Text('加入購物車')),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    height: 50,
                    color: Colors.amber[300],
                    child: const Center(
                      child: Text('項鍊'),
                    )),
                TextButton(
                    onPressed: () {
// 導航到下一個頁面
                      Get.toNamed(Routes.ShopCart, arguments: '項鍊');
                    },
                    child: Text('加入購物車')),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(
                      child: Text('手錶'),
                    )),
                TextButton(
                    onPressed: () {
// 導航到下一個頁面
                      Get.toNamed(Routes.ShopCart, arguments: '手錶');
                    },
                    child: Text('加入購物車')),
              ],
            ),
          ],
        ));
  }
}

class ShopCart extends StatelessWidget {
  late String cartList = '';

  @override
  Widget build(BuildContext context) {
    String name = Get.arguments;
    cartList = cartList + name;

    return Scaffold(
      appBar: new AppBar(
        title: Text('購物車'),
      ),
      body: new Column(
        children: <Widget>[
          Text(cartList.toString()),
          TextButton(
              onPressed: () {
                // 導航到下一個頁面並刪除前一個頁面
                Get.offNamed(Routes.CheckOut);
              },
              child: Text('進行結帳'))
        ],
      ),
    );
  }
}

class CheckOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text('結帳頁面'),
        ),
        body: new Column(
          children: <Widget>[
            TextButton(
                onPressed: () {
                  Get.offAllNamed(Routes.Payment);
                  // Navigator.of(context).pushNamedAndRemoveUntil(
                  //     '/payment', (Route<dynamic> route) => false);
                },
                child: Text('確定結帳')),
            TextButton(
                onPressed: () {
                  Get.back();
                  //Navigator.of(context).pop();
                },
                child: Text('繼續購物'))
          ],
        ));
  }
}

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('結帳完成'),
      ),
      body: new Column(
        children: <Widget>[
          Text('恭喜您，已成功完成此訂單'),
          TextButton(
              onPressed: () {
                Get.offAllNamed(Routes.Shop);
              },
              child: Text('重新購物'))
        ],
      ),
    );
  }
}
