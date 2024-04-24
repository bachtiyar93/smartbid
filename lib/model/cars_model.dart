import 'package:flutter/material.dart';

class TabbarNavigationItem {

  IconData iconData;

  TabbarNavigationItem(this.iconData);

}

List<TabbarNavigationItem> getTabList(){
  return <TabbarNavigationItem>[
    TabbarNavigationItem(Icons.home),
    TabbarNavigationItem(Icons.calendar_today),
    TabbarNavigationItem(Icons.notifications),
    TabbarNavigationItem(Icons.person),
  ];
}

class CarsModel {

  String brand;
  String model;
  double price;
  double discount;
  bool condition;
  List<String> images;

  CarsModel(this.brand, this.model, this.price, this.discount,this.condition, this.images);

}

List<CarsModel> getCarList(){
  return <CarsModel>[
    CarsModel(
      "Land Rover",
      "Discovery",
      2580,
      20,
      true,
      [
        "assets/images/land_rover_0.png",
        "assets/images/land_rover_1.png",
        "assets/images/land_rover_2.png",
      ],
    ),
    CarsModel(
      "Alfa Romeo",
      "C4",
      3580,
      15,
      true,
      [
        "assets/images/alfa_romeo_c4_0.png",
      ],
    ),
    CarsModel(
      "Nissan",
      "GTR",
      1100,
      10,
      true,
      [
        "assets/images/nissan_gtr_0.png",
        "assets/images/nissan_gtr_1.png",
        "assets/images/nissan_gtr_2.png",
        "assets/images/nissan_gtr_3.png",
      ],
    ),
    CarsModel(
      "Acura",
      "MDX 2020",
      2200,
      10,
      true,
      [
        "assets/images/acura_0.png",
        "assets/images/acura_1.png",
        "assets/images/acura_2.png",
      ],
    ),
    CarsModel(
      "Chevrolet",
      "Camaro",
      3400,
      5,
      false,
      [
        "assets/images/camaro_0.png",
        "assets/images/camaro_1.png",
        "assets/images/camaro_2.png",
      ],
    ),
    CarsModel(
      "Ferrari",
      "Spider 488",
      4200,
      10,
      true,
      [
        "assets/images/ferrari_spider_488_0.png",
        "assets/images/ferrari_spider_488_1.png",
        "assets/images/ferrari_spider_488_2.png",
        "assets/images/ferrari_spider_488_3.png",
        "assets/images/ferrari_spider_488_4.png",
      ],
    ),
    CarsModel(
      "Ford",
      "Focus",
      2300,
      30,
      false,
      [
        "assets/images/ford_0.png",
        "assets/images/ford_1.png",
      ],
    ),
    CarsModel(
      "Fiat",
      "500x",
      1450,
      20,
      true,
      [
        "assets/images/fiat_0.png",
        "assets/images/fiat_1.png",
      ],
    ),
    CarsModel(
      "Honda",
      "Civic",
      900,
      25,
      true,
      [
        "assets/images/honda_0.png",
      ],
    ),
    CarsModel(
      "Citroen",
      "Picasso",
      1200,
      35,
      true,
      [
        "assets/images/citroen_0.png",
        "assets/images/citroen_1.png",
        "assets/images/citroen_2.png",
      ],
    ),
  ];
}




class Filter {

  String name;

  Filter(this.name);

}

List<Filter> getFilterList(){
  return <Filter>[
    Filter("Best Match"),
    Filter("Highest Price"),
    Filter("Lowest Price"),
  ];
}