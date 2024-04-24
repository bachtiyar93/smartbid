import 'package:apphelper/apphelpers.dart';
import 'package:flutter/material.dart';
import 'package:smartbid/controller/managstate.dart';
import 'package:smartbid/model/brand.dart';
import 'package:smartbid/model/cars_model.dart';

Widget buildDealer(BrandCar dealer, int index){
  ManagState state = AppHelpers.getState<ManagState>();
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    padding: const EdgeInsets.all(16),
    margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
    width: 150,
    height: 150,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[

        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(dealer.logo),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          height: 60,
          width: 60,
        ),

        const SizedBox(
          height: 5,
        ),

        Text(
          dealer.brand,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            height: 2,
          ),
        ),

        Text("${state.listCars.where((element) => element.brand==dealer.brand).length} produk",
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),

      ],
    ),
  );
}