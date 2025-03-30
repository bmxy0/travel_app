import 'package:flutter/material.dart';
import 'package:travel_app/homeScreen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String? _filterValue;
  String? _searchFilter;
  List<String> _selectedFilters = [];
  List<String> _countries = [
    'Iraq',
    'USA',
    'Canada',
    'UK',
    'Japan',
    'France',
    'Spain'
  ];
  bool _isFilterListVisible = false;

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
              print(_searchFilter);
            },
            decoration: InputDecoration(
              hintText: "Search for a creator or a place",
              prefixIcon: Icon(Icons.search),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.cyan, width: 2.0),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isFilterListVisible = !_isFilterListVisible;
                if (_selectedFilters.isNotEmpty) {
                  _filterValue = _selectedFilters.join(", ");
                } else {
                  _filterValue = null;
                }
              });
            },
            child: Row(
              children: [
                Icon(Icons.filter_alt_outlined),
                SizedBox(width: 5),
                Flexible(
                  child: Text(
                    'Filter: ${_selectedFilters.isEmpty ? "All" : _selectedFilters.join(", ")}',
                  ),
                ),
              ],
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[100],
              foregroundColor: Colors.black,
            ),
          ),
          if (_isFilterListVisible)
            Container(
              margin: EdgeInsets.only(top: 8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: _countries.map((country) {
                  return FilterChip(
                    label: Text(country, style: TextStyle(fontSize: 12)),
                    selected: _selectedFilters.contains(country),
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          _selectedFilters.add(country);
                        } else {
                          _selectedFilters.remove(country);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          Expanded(
              child: HomeScreen(
            filter: _filterValue,
            searchQuery: _searchFilter,
          ))
        ],
      ),
    );
  }
}
