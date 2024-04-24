import 'package:flutter/cupertino.dart';
import 'package:smartbid/model/brand.dart';
import 'package:smartbid/model/cars_model.dart';
import 'package:smartbid/model/dummy_brand.dart';

class ManagState extends ChangeNotifier{
  List<CarsModel> listCars= getCarList();
  List<BrandCar> listBrand = listBrandCars();
  List<TabbarNavigationItem> listTab = getTabList();
  TabbarNavigationItem? tabSelected;
  List<Filter> filters = getFilterList();

  Filter? selectedFilter;

}