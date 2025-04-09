import 'package:flutter/material.dart';
import 'package:travel_app/homeScreen.dart';
import 'package:dropdown_search/dropdown_search.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String? selectedCountry;
  String? _searchFilter;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              setState(() {
                _searchFilter = value;
              });
            },
            decoration: InputDecoration(
              hintText: "Search for a creator or a place",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.cyan, width: 2.0),
              ),
            ),
          ),
          SizedBox(height: 20),
          DropdownSearch<String>(
            
            onChanged: (String? country) {
              setState(() {
                selectedCountry = country;
                if (selectedCountry == "Clear Filter") {
                  selectedCountry = null;
                }
              });
            },
            items: (filter, infiniteScrollProps) {
              List<String> countries = [
                "Clear Filter",
                "Afghanistan 🇦🇫",
                "Albania 🇦🇱",
                "Algeria 🇩🇿",
                "Andorra 🇦🇩",
                "Angola 🇦🇴",
                "Antigua and Barbuda 🇦🇬",
                "Argentina 🇦🇷",
                "Armenia 🇦🇲",
                "Australia 🇦🇺",
                "Austria 🇦🇹",
                "Azerbaijan 🇦🇿",
                "Bahamas 🇧🇸",
                "Bahrain 🇧🇭",
                "Bangladesh 🇧🇩",
                "Barbados 🇧🇧",
                "Belarus 🇧🇾",
                "Belgium 🇧🇪",
                "Belize 🇧🇿",
                "Benin 🇧🇯",
                "Bhutan 🇧🇹",
                "Bolivia 🇧🇴",
                "Bosnia and Herzegovina 🇧🇦",
                "Botswana 🇧🇼",
                "Brazil 🇧🇷",
                "Brunei 🇧🇳",
                "Bulgaria 🇧🇬",
                "Burkina Faso 🇧🇫",
                "Burundi 🇧🇮",
                "Côte d'Ivoire 🇨🇮",
                "Cabo Verde 🇨🇻",
                "Cambodia 🇰🇭",
                "Cameroon 🇨🇲",
                "Canada 🇨🇦",
                "Central African Republic 🇨🇫",
                "Chad 🇹🇩",
                "Chile 🇨🇱",
                "China 🇨🇳",
                "Colombia 🇨🇴",
                "Comoros 🇰🇲",
                "Congo (Brazzaville) 🇨🇬",
                "Costa Rica 🇨🇷",
                "Croatia 🇭🇷",
                "Cuba 🇨🇺",
                "Cyprus 🇨🇾",
                "Czechia 🇨🇿",
                "Democratic Republic of the Congo 🇨🇩",
                "Denmark 🇩🇰",
                "Djibouti 🇩🇯",
                "Dominica 🇩🇲",
                "Dominican Republic 🇩🇴",
                "Ecuador 🇪🇨",
                "Egypt 🇪🇬",
                "El Salvador 🇸🇻",
                "Equatorial Guinea 🇬🇶",
                "Eritrea 🇪🇷",
                "Estonia 🇪🇪",
                "Eswatini 🇸🇿",
                "Ethiopia 🇪🇹",
                "Fiji 🇫🇯",
                "Finland 🇫🇮",
                "France 🇫🇷",
                "Gabon 🇬🇦",
                "Gambia 🇬🇲",
                "Georgia 🇬🇪",
                "Germany 🇩🇪",
                "Ghana 🇬🇭",
                "Greece 🇬🇷",
                "Grenada 🇬🇩",
                "Guatemala 🇬🇹",
                "Guinea 🇬🇳",
                "Guinea-Bissau 🇬🇼",
                "Guyana 🇬🇾",
                "Haiti 🇭🇹",
                "Holy See (Vatican City) 🇻🇦",
                "Honduras 🇭🇳",
                "Hungary 🇭🇺",
                "Iceland 🇮🇸",
                "India 🇮🇳",
                "Indonesia 🇮🇩",
                "Iran 🇮🇷",
                "Iraq 🇮🇶",
                "Ireland 🇮🇪",
                "Israel 🇮🇱",
                "Italy 🇮🇹",
                "Jamaica 🇯🇲",
                "Japan 🇯🇵",
                "Jordan 🇯🇴",
                "Kazakhstan 🇰🇿",
                "Kenya 🇰🇪",
                "Kiribati 🇰🇮",
                "Kuwait 🇰🇼",
                "Kyrgyzstan 🇰🇬",
                "Laos 🇱🇦",
                "Latvia 🇱🇻",
                "Lebanon 🇱🇧",
                "Lesotho 🇱🇸",
                "Liberia 🇱🇷",
                "Libya 🇱🇾",
                "Liechtenstein 🇱🇮",
                "Lithuania 🇱🇹",
                "Luxembourg 🇱🇺",
                "Madagascar 🇲🇬",
                "Malawi 🇲🇼",
                "Malaysia 🇲🇾",
                "Maldives 🇲🇻",
                "Mali 🇲🇱",
                "Malta 🇲🇹",
                "Marshall Islands 🇲🇭",
                "Mauritania 🇲🇷",
                "Mauritius 🇲🇺",
                "Mexico 🇲🇽",
                "Micronesia 🇫🇲",
                "Moldova 🇲🇩",
                "Monaco 🇲🇨",
                "Mongolia 🇲🇳",
                "Montenegro 🇲🇪",
                "Morocco 🇲🇦",
                "Mozambique 🇲🇿",
                "Myanmar 🇲🇲",
                "Namibia 🇳🇦",
                "Nauru 🇳🇷",
                "Nepal 🇳🇵",
                "Netherlands 🇳🇱",
                "New Zealand 🇳🇿",
                "Nicaragua 🇳🇮",
                "Niger 🇳🇪",
                "Nigeria 🇳🇬",
                "North Korea 🇰🇵",
                "North Macedonia 🇲🇰",
                "Norway 🇳🇴",
                "Oman 🇴🇲",
                "Pakistan 🇵🇰",
                "Palau 🇵🇼",
                "Palestine 🇵🇸",
                "Panama 🇵🇦",
                "Papua New Guinea 🇵🇬",
                "Paraguay 🇵🇾",
                "Peru 🇵🇪",
                "Philippines 🇵🇭",
                "Poland 🇵🇱",
                "Portugal 🇵🇹",
                "Qatar 🇶🇦",
                "Romania 🇷🇴",
                "Russia 🇷🇺",
                "Rwanda 🇷🇼",
                "Saint Kitts and Nevis 🇰🇳",
                "Saint Lucia 🇱🇨",
                "Saint Vincent and the Grenadines 🇻🇨",
                "Samoa 🇼🇸",
                "San Marino 🇸🇲",
                "Sao Tome and Principe 🇸🇹",
                "Saudi Arabia 🇸🇦",
                "Senegal 🇸🇳",
                "Serbia 🇷🇸",
                "Seychelles 🇸🇨",
                "Sierra Leone 🇸🇱",
                "Singapore 🇸🇬",
                "Slovakia 🇸🇰",
                "Slovenia 🇸🇮",
                "Solomon Islands 🇸🇧",
                "Somalia 🇸🇴",
                "South Africa 🇿🇦",
                "South Korea 🇰🇷",
                "South Sudan 🇸🇸",
                "Spain 🇪🇸",
                "Sri Lanka 🇱🇰",
                "Sudan 🇸🇩",
                "Suriname 🇸🇷",
                "Sweden 🇸🇪",
                "Switzerland 🇨🇭",
                "Syria 🇸🇾",
                "Taiwan 🇹🇼",
                "Tajikistan 🇹🇯",
                "Tanzania 🇹🇿",
                "Thailand 🇹🇭",
                "Timor-Leste 🇹🇱",
                "Togo 🇹🇬",
                "Tonga 🇹🇴",
                "Trinidad and Tobago 🇹🇹",
                "Tunisia 🇹🇳",
                "Turkey 🇹🇷",
                "Turkmenistan 🇹🇲",
                "Tuvalu 🇹🇻",
                "Uganda 🇺🇬",
                "Ukraine 🇺🇦",
                "United Arab Emirates 🇦🇪",
                "United Kingdom 🇬🇧",
                "United States 🇺🇸",
                "Uruguay 🇺🇾",
                "Uzbekistan 🇺🇿",
                "Vanuatu 🇻🇺",
                "Venezuela 🇻🇪",
                "Vietnam 🇻🇳",
                "Yemen 🇾🇪",
                "Zambia 🇿🇲",
                "Zimbabwe 🇿🇼",
              ];

              if (filter.isNotEmpty) {
                return countries
                    .where(
                      (item) =>
                          item.toLowerCase().contains(filter.toLowerCase()),
                    )
                    .toList();
              } else {
                return countries;
              }
            },
            suffixProps: DropdownSuffixProps(
              dropdownButtonProps: DropdownButtonProps(
                iconClosed: Icon(Icons.keyboard_arrow_down),
                iconOpened: Icon(Icons.keyboard_arrow_up),
              ),
            ),
            decoratorProps: DropDownDecoratorProps(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.filter_alt_rounded),
                hintText: 'Filter country',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
            popupProps: PopupProps.menu(
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  hintText: "Search for a country",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
                onChanged: (value) {},
              ),
              itemBuilder: (context, item, isDisabled, isSelected) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    item,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                );
              },

              menuProps: MenuProps(
                margin: EdgeInsets.only(top: 12),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
          ),
          Expanded(
            child: HomeScreen(
              filter: selectedCountry,
              searchQuery: _searchFilter,
            ),
          ),
        ],
      ),
    );
  }
}
