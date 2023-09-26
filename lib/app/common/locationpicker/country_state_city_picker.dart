import 'dart:convert';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:river_tulo_book/app/data/app_color.dart';
import 'package:river_tulo_book/app/modules/location/controllers/location_controller.dart';
import './model/location_model.dart';
import 'package:get/get.dart';

class CountryStateCityPicker extends StatefulWidget {
  final TextEditingController country;
  final TextEditingController state;
  final TextEditingController city;
  final InputDecoration? textFieldDecoration;
  final Color? dialogColor;

  const CountryStateCityPicker(
      {super.key,
      required this.country,
      required this.state,
      required this.city,
      this.textFieldDecoration,
      this.dialogColor});

  @override
  State<CountryStateCityPicker> createState() => _CountryStateCityPickerState();
}

class _CountryStateCityPickerState extends State<CountryStateCityPicker> {
  List<Location> _countryList = [];
  List<States> _stateList = [];
  List<Cities> _cityList = [];
  List<Cities> _timeZone = [];
  var locationController = Get.put(LocationController());

  List<Location> _countrySubList = [];

  late String? _title;
  var jsonString;

  @override
  void initState() {
    _getCountry();
    super.initState();
  }

  Future<void> _getCountry() async {
    _countryList.clear();
    jsonString = await rootBundle
        .loadString('assets/country_state_city_pro/location.json');
    List<dynamic> body = json.decode(jsonString);
    setState(() {
      _countryList =
          body.map((dynamic item) => Location.fromJson(item)).toList();
      _countrySubList = _countryList;
    });
  }

  Future<void> _getState(String countryId) async {
    _stateList.clear();
    _cityList.clear();
    for (var element in _countrySubList) {
      if (element.id.toString() == countryId.toString()) {
        setState(() {
          _stateList = element.states!;
        });
      }
    }
  }

  Future<void> _getCity(String stateId) async {
    _cityList.clear();
    for (var element in _stateList) {
      if (element.id.toString() == stateId.toString()) {
        setState(() {
          _cityList = element.cities!;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Country TextField
        TextField(
          controller: widget.country,
          onTap: () {
            setState(() => _title = 'Country');
            _showDialog(context);
          },
          decoration: defaultDecoration.copyWith(hintText: '选择 Country'),
          readOnly: true,
        ),
        const SizedBox(height: 8.0),

        ///State TextField
        TextField(
          controller: widget.state,
          onTap: () {
            setState(() => _title = 'State');
            if (widget.country.text.isNotEmpty) {
              _showDialog(context);
            } else {
              _showSnackBar('Select Country');
            }
          },
          decoration: defaultDecoration.copyWith(hintText: '选择 State'),
          readOnly: true,
        ),
        const SizedBox(height: 8.0),

        ///City TextField
        TextField(
          controller: widget.city,
          onTap: () {
            setState(() => _title = 'City');
            if (widget.state.text.isNotEmpty) {
              _showDialog(context);
            } else {
              _showSnackBar('Select State');
            }
          },
          decoration: defaultDecoration.copyWith(hintText: '选择 City'),
          readOnly: true,
        ),
      ],
    );
  }

  void _showDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final TextEditingController controller2 = TextEditingController();
    final TextEditingController controller3 = TextEditingController();

    showGeneralDialog(
      barrierLabel: _title,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 350),
      context: context,
      pageBuilder: (context, __, ___) {
        return Material(
          color: Colors.transparent,
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * .7,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: widget.dialogColor ?? Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(_title == "Country" ? "国家" : _title == "State" ? "地区" : "城市",
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 17,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(height: 10),

                      ///Text Field
                      TextField(
                        controller: _title == 'Country'
                            ? controller
                            : _title == 'State'
                                ? controller2
                                : controller3,
                        onChanged: (val) {
                          setState(() {
                            if (_title == 'Country') {
                              _countrySubList = _countryList
                                  .where((element) => element.name!
                                      .toLowerCase()
                                      .contains(controller.text.toLowerCase()))
                                  .toList();
                            } else if (_title == 'State') {
                              _stateList = _stateList
                                  .where((element) => element.name!
                                      .toLowerCase()
                                      .contains(controller2.text.toLowerCase()))
                                  .toList();
                            } else if (_title == 'City') {
                              _cityList = _cityList
                                  .where((element) => element.name!
                                      .toLowerCase()
                                      .contains(controller3.text.toLowerCase()))
                                  .toList();
                            }
                          });
                        },
                        style: TextStyle(
                            color: Colors.grey.shade800, fontSize: 16.0),
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: "在这里搜索...",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            isDense: true,
                            prefixIcon: Icon(Icons.search)),
                      ),

                      ///Dropdown Items
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 12),
                          itemCount: _title == 'Country'
                              ? _countrySubList.length
                              : _title == 'State'
                                  ? _stateList.length
                                  : _cityList.length,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () async {
                                setState(() {
                                  if (_title == "Country") {
                                    widget.country.text =
                                        _countrySubList[index].name!;
                                    _getState(_countrySubList[index].id.toString());
                                    _countrySubList = _countryList;
                                    widget.state.clear();
                                    widget.city.clear();
                                  } else if (_title == 'State') {
                                    widget.state.text = _stateList[index].name!;
                                    _getCity(_stateList[index].id.toString());
                                    _stateList = _stateList;
                                    widget.city.clear();
                                  } else if (_title == 'City') {
                                    widget.city.text = _cityList[index].name!;
                                    _cityList = _cityList;
                                    Cities cities = _cityList[index];
                                    locationController.cities.value = cities;
                                    print(locationController.cities.value);
                                  }
                                });
                                controller.clear();
                                controller2.clear();
                                controller3.clear();
                                Navigator.pop(context);
                              },
                              child: ListTile(
                                contentPadding: const EdgeInsets.only(
                                    bottom: 20.0, left: 10.0, right: 10.0),
                                title: Text(
                                    _title! == 'Country'
                                        ? _countrySubList[index].name!
                                        : _title! == 'State'
                                        ? _stateList[index].name!
                                        : _cityList[index].name!,
                                    style: TextStyle(
                                        color: Colors.grey.shade800,
                                        fontSize: 16.0)),
                                leading: _title == 'Country' ? CountryFlag.fromCountryCode(
                                  "${_countrySubList[index].iso2}",
                                  height: 40,
                                  width: 50,
                                  borderRadius: 10,
                                ) : const Text("🌎",style: TextStyle(fontSize: 16)),
                              ),
                            );
                          },
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0))),
                        onPressed: () {
                          if (_title == 'City' && _cityList.isEmpty) {
                            widget.city.text = controller3.text;
                          }
                          _countrySubList = _countryList;
                          _stateList = _stateList;
                          _cityList = _cityList;

                          controller.clear();
                          controller2.clear();
                          controller3.clear();
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.close_fullscreen,color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, -1), end: const Offset(0, 0))
              .animate(anim),
          child: child,
        );
      },
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Theme.of(context).primaryColor,
        content: Text(message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 16.0))));
  }

  InputDecoration defaultDecoration = const InputDecoration(
      isDense: true,
      hintText: 'Select',
      suffixIcon: Icon(Icons.arrow_drop_down,color: AppColors.colorPrimary),
      border: OutlineInputBorder());
}
