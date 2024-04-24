import 'package:apphelper/apphelpers.dart';
import 'package:flutter/material.dart';
import 'package:smartbid/controller/managstate.dart';
import 'package:smartbid/model/cars_model.dart';
import 'package:smartbid/ui/home/book_car.dart';
import 'package:smartbid/ui/home/car_widget.dart';

class AvailableCars extends StatelessWidget {
  const AvailableCars({super.key});

  Widget build(BuildContext context) {
    ManagState state = AppHelpers.getState<ManagState>();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(
                      color: Colors.grey[300]!,
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.black,
                    size: 28,
                  )
                ),
              ),

              SizedBox(
                height: 16,
              ),

              Text(
                "Unit Tersedia (" + state.listCars.length.toString() + ")",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 16,
              ),

              Expanded(
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  childAspectRatio: 1 / 1.55,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: state.listCars.map((item) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BookCar(car: item)),
                        );
                      },
                      child: buildCar(item, null)
                    );
                  }).toList(),
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            buildFilterIcon(context),
            Row(
              children: buildFilters(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFilterIcon(BuildContext context){
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Center(
        child: Icon(
          Icons.filter_list,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }

  List<Widget> buildFilters(BuildContext context){
    ManagState state = AppHelpers.getState<ManagState>();
    List<Widget> list = [];
    for (var i = 0; i < state.filters.length; i++) {
      list.add(buildFilter(state.filters[i], context));
    }
    return list;
  }

  Widget buildFilter(Filter filter, BuildContext context){
    ManagState state = AppHelpers.getState<ManagState>();
    return GestureDetector(
      onTap: (){},
      child: Padding(
        padding: EdgeInsets.only(right: 16),
        child: Text(
          filter.name,
          style: TextStyle(
            color: state.selectedFilter == filter ? Theme.of(context).primaryColor : Colors.grey[300],
            fontSize: 16,
            fontWeight: state.selectedFilter == filter ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}