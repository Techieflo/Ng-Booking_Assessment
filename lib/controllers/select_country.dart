import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryController extends GetxController {
  var selectedCountry = ''.obs;
  var searchText = ''.obs;

  final List<Map<String, String>> countries = [
    {
      'name': 'United States',
      'abbreviation': 'US',
      'flag': 'https://hatscripts.github.io/circle-flags/flags/us.svg'
    },
    {
      'name': 'Canada',
      'abbreviation': 'CA',
      'flag': 'https://hatscripts.github.io/circle-flags/flags/ca.svg'
    },
    {
      'name': 'United Kingdom',
      'abbreviation': 'UK',
      'flag': 'https://hatscripts.github.io/circle-flags/flags/gb.svg'
    },
    {
      'name': 'India',
      'abbreviation': 'IN',
      'flag': 'https://hatscripts.github.io/circle-flags/flags/in.svg'
    },
    {
      'name': 'Australia',
      'abbreviation': 'AU',
      'flag': 'https://hatscripts.github.io/circle-flags/flags/au.svg'
    },
    {
      'name': 'Germany',
      'abbreviation': 'DE',
      'flag': 'https://hatscripts.github.io/circle-flags/flags/de.svg'
    },
    {
      'name': 'France',
      'abbreviation': 'FR',
      'flag': 'https://hatscripts.github.io/circle-flags/flags/fr.svg'
    },
    {
      'name': 'Japan',
      'abbreviation': 'JP',
      'flag': 'https://hatscripts.github.io/circle-flags/flags/jp.svg'
    },
    {
      'name': 'China',
      'abbreviation': 'CN',
      'flag': 'https://hatscripts.github.io/circle-flags/flags/cn.svg'
    },
    {
      'name': 'Brazil',
      'abbreviation': 'BR',
      'flag': 'https://hatscripts.github.io/circle-flags/flags/br.svg'
    },
    {
      'name': 'South Africa',
      'abbreviation': 'ZA',
      'flag': 'https://hatscripts.github.io/circle-flags/flags/za.svg'
    },
    {
      'name': 'Russia',
      'abbreviation': 'RU',
      'flag': 'https://hatscripts.github.io/circle-flags/flags/ru.svg'
    },
    {
      'name': 'Italy',
      'abbreviation': 'IT',
      'flag': 'https://hatscripts.github.io/circle-flags/flags/it.svg'
    },
    {
      'name': 'Spain',
      'abbreviation': 'ES',
      'flag': 'https://hatscripts.github.io/circle-flags/flags/es.svg'
    },
    {
      'name': 'Mexico',
      'abbreviation': 'MX',
      'flag': 'https://hatscripts.github.io/circle-flags/flags/mx.svg'
    },
    {
      'name': 'South Korea',
      'abbreviation': 'KR',
      'flag': 'https://hatscripts.github.io/circle-flags/flags/kr.svg'
    },
    {
      'name': 'Saudi Arabia',
      'abbreviation': 'SA',
      'flag': 'https://hatscripts.github.io/circle-flags/flags/sa.svg'
    },
    {
      'name': 'Argentina',
      'abbreviation': 'AR',
      'flag': 'https://hatscripts.github.io/circle-flags/flags/ar.svg'
    },
    {
      'name': 'Netherlands',
      'abbreviation': 'NL',
      'flag': 'https://hatscripts.github.io/circle-flags/flags/nl.svg'
    },
    {
      'name': 'Sweden',
      'abbreviation': 'SE',
      'flag': 'https://hatscripts.github.io/circle-flags/flags/se.svg'
    },
    {
      'name': 'Nigeria',
      'abbreviation': 'NG',
      'flag': 'https://hatscripts.github.io/circle-flags/flags/ng.svg'
    },
    // Add more countries as needed
  ];

  var filteredCountries = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize filteredCountries with all countries
    filteredCountries.value = countries;
  }

  void selectCountry(String country) {
    selectedCountry.value = country;
  }

  void showCountryList() {
    Get.bottomSheet(
      BottomSheet(
        onClosing: () {},
        builder: (context) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Country',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  searchText.value = value;
                  filterCountries();
                },
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: filteredCountries.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: SvgPicture.network(
                        filteredCountries[index]['flag']!,
                        width: 30,
                        height: 30,
                        placeholderBuilder: (context) =>
                            CircularProgressIndicator(),
                      ),
                      title: Text(filteredCountries[index]['name']!),
                      onTap: () {
                        selectCountry(
                            filteredCountries[index]['abbreviation']!);
                        print(selectedCountry);
                        Get.back();
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void filterCountries() {
    if (searchText.value.isEmpty) {
      filteredCountries.value = countries;
    } else {
      filteredCountries.value = countries
          .where((country) => country['name']!
              .toLowerCase()
              .contains(searchText.value.toLowerCase()))
          .toList();
    }
  }
}
