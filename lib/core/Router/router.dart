import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/modules/cart/presentation/addToCart.dart';
import 'package:store_app/modules/cart/presentation/cart.dart';
import 'package:store_app/modules/find_product/presentation/find_product.dart';
import 'package:store_app/modules/layout/presentation/layout.dart';
import 'package:store_app/modules/payment/presentation/payment.dart';
import 'package:store_app/modules/payment/presentation/payment_steps/payment_steps.dart';
import 'package:store_app/modules/payment/presentation/payment_steps/sucess_payment.dart';
import 'package:store_app/modules/search/search.dart';

import '../../modules/home/presentation/home.dart';



class AppRouter {


  static const String layoutRoute = "/layout";
  static const String homeRoute = "/home";
  static const String searchRoute = "/search";
  static const String cartRoute = "/cart";
  static const String addToCartRoute = "/add_to_cart";
  static const String paymentRapRoute = "/payment_rap";
  static const String paymentStepRoute = "/payment_step";
  static const String sucessPaymentRoute = "/sucess_payment";
  static const String findProductRoute = "/find_product";


  GoRouter goRoute = GoRouter(
      initialLocation: AppRouter.layoutRoute,
      routes: [
        GoRoute(
          path: "/layout",
          name: AppRouter.layoutRoute,
           builder: (context, state) => LayoutScreen(),
        ),
        GoRoute(
          path: "/home",
          name: AppRouter.homeRoute,
           builder: (context, state) => MyHome(),
        ),
        GoRoute(
          path: "/search",
          name: AppRouter.searchRoute,
           builder: (context, state) => SearchScreen(),
        ),
        GoRoute(
          path: "/cart",
          name: AppRouter.cartRoute,
           builder: (context, state) => CartScreen(),
        ),
        GoRoute(
          path: "/add_to_cart",
          name: AppRouter.addToCartRoute,
           builder: (context, state) => AddToCartScreen(),
        ),
        GoRoute(
          path: "/payment_rap",
          name: AppRouter.paymentRapRoute,
           builder: (context, state) => PaymentScreen(),
        ),
        GoRoute(
          path: "/payment_step",
          name: AppRouter.paymentStepRoute,
           builder: (context, state) => PaymentStepScreen(),
        ),
        GoRoute(
          path: "/sucess_payment",
          name: AppRouter.sucessPaymentRoute,
           builder: (context, state) => SucessPaymentScreen(),
        ),
        GoRoute(
          path: "/find_product",
          name: AppRouter.findProductRoute,
           builder: (context, state) => FindProductScreen(
            image: state.extra as File,
           ),
        ),

       
      ]);
}
