import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'globals.dart' as globals;

class NewPostScreen extends StatefulWidget {
  final String? userName;
  const NewPostScreen({super.key, this.userName});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  String? selectedCountry;
  String? caption = '';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: Image.asset('assets/images/images.jpeg'),
            onTap: () {
              showDialog(
                context: context,
                barrierColor: Color.fromARGB(200, 0, 0, 0),
                builder: (BuildContext context) {
                  return Dialog(
                    insetPadding: EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Image.asset(
                        'assets/images/images.jpeg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              );
            },
          ),
          Divider(color: Colors.grey, thickness: 1),
          TextFormField(
            style: TextStyle(color: Colors.black),
            maxLines: 3,
            onChanged: (value) {
              setState(() {
                caption = value;
              });
            },
            decoration: InputDecoration(
              hintText: "Add a Caption",
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2.0),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 10,
              ),
            ),
          ),
          const SizedBox(height: 16),
          DropdownSearch<String>(
            onChanged: (String? country) {
              setState(() {
                selectedCountry = country;
              });
            },
            items: (filter, infiniteScrollProps) {
              List<String> countries = [
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
                hintText: 'select a country',
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
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              if (selectedCountry == null) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Select a country"),
                      content: Text("Please choose a country before posting"),
                      actions: [
                        TextButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }
              if (selectedCountry != null) {
                globals.myList.insert(0, {
                  "name": "${widget.userName}",
                  "pfp": "assets/pfp0.jpeg",
                  "country": "$selectedCountry",
                  "text": "$caption",
                  "image": "assets/images/images.jpeg",
                  "likes": 0,
                  "commentsCount": 0,
                  "isLiked": false,
                  "followerCount": 130,
                  "followingCount": 10,
                  "bio":
                      "Welcome to my profile \n im 24 \n traveled to 6 countries 🇪🇸 🇺🇸 🇬🇧 🇯🇵 🇫🇷 🇮🇶 \n I share my travel stories with you all",
                });
              }
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 40),
              backgroundColor: Colors.grey[100],
              foregroundColor: Colors.black,
            ),
            child: Text('Post'),
          ),
        ],
      ),
    );
  }
}
