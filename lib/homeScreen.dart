import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  ExpandableText(this.text);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _isExpanded
            ? Text(widget.text)
            : Text(
                widget.text,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
        if (widget.text.split('\n').length > 3 || widget.text.length > 150)
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              _isExpanded ? "Read less" : "Read more",
              style: const TextStyle(color: Colors.blue),
            ),
          ),
      ],
    );
  }
}

class HomeScreen extends StatefulWidget {
  final String? filter;
  final String? searchQuery;
  const HomeScreen({super.key, this.filter, this.searchQuery});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> myList = [
    {
      "name": "John Doe",
      "pfp": "assets/pfp1.jpg",
      "country": "Iraq 🇮🇶",
      "text":
          "ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...",
      "image": "assets/images/Iraq-248.jpg",
      "likes": 50,
      "commentsCount": 10,
      "isLiked": false,
    },
    {
      "name": "Jack Smith",
      "pfp": "assets/pfp2.jpg",
      "country": "Iraq 🇮🇶",
      "text":
          "quisquam, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora...",
      "image": "assets/images/images.jpeg",
      "likes": 11,
      "commentsCount": 4,
      "isLiked": false,
    },
    {
      "name": "John Doe",
      "pfp": "assets/pfp1.jpg",
      "country": "Spain 🇪🇸",
      "text":
          "After centuries of historical upheaval, Madrid has emerged as one of Europe's most progressive, modern, and beautiful cities. With a thriving arts scene, bustling nightlife, and an ever-present nod to its rich history, Madrid is a must-visit destination for travelers seeking to experience the best of European culture.",
      "image": "assets/images/spain.jpg",
      "likes": 15,
      "commentsCount": 3,
      "isLiked": false,
    },
  ];
  bool isCommentsOn = false;
  final List<Map<String, dynamic>> comments = [
    {
      "comment": "Wow Amazing work keep up!",
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<String> filters = [];
    if (widget.filter != null && widget.filter!.isNotEmpty) {
      filters = widget.filter!.split(", ");
    }

    final filteredList = myList.where((item) {
      final nameMatches = widget.searchQuery == null ||
          widget.searchQuery!.isEmpty ||
          item["name"]
              .toLowerCase()
              .contains(widget.searchQuery!.toLowerCase());
      final filterMatches = filters.isEmpty ||
          filters.any((filter) => item['country'].contains(filter));
      return nameMatches && filterMatches;
    }).toList();

    if (filteredList.isEmpty) {
      return const Center(
        child: Text(
          "Sorry, couldn't find any results.\nTry looking for something else.",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      );
    }
    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        final item = filteredList[index];
        return Card(
          margin: const EdgeInsets.all(10.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(item["pfp"]),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item["name"],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Country: ${item['country']}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.blueAccent,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                ExpandableText(item["text"]),
                const SizedBox(height: 10),
                GestureDetector(
                  child: Image.asset(item["image"]),
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
                            child: Container(
                              child: Image.asset(
                                item["image"],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (!item['isLiked']) {
                            item['isLiked'] = true;
                            item["likes"]++;
                          } else {
                            item['isLiked'] = false;
                            item["likes"]--;
                          }
                        });
                      },
                      child: Icon(item['isLiked']
                          ? Icons.thumb_up
                          : Icons.thumb_up_alt_outlined),
                    ),
                    const SizedBox(width: 5),
                    Text('${item["likes"]}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 20),
                    GestureDetector(
                      child: const Icon(Icons.mode_comment_outlined),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 500,
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Comments",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  Expanded(
                                    child: ListView(
                                      children: const [
                                        ListTile(
                                          leading:
                                              CircleAvatar(child: Text("A")),
                                          title: Text("Alice"),
                                          subtitle:
                                              Text("This is a great post!"),
                                        ),
                                        ListTile(
                                          leading:
                                              CircleAvatar(child: Text("B")),
                                          title: Text("Bob"),
                                          subtitle: Text("I totally agree."),
                                        ),
                                        ListTile(
                                          leading:
                                              CircleAvatar(child: Text("C")),
                                          title: Text("Charlie"),
                                          subtitle: Text("Amazing!"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const TextField(
                                    decoration: InputDecoration(
                                      hintText: "Add a comment...",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(width: 5),
                    Text('${item["commentsCount"]}',
                        style: const TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
