import 'package:flutter/material.dart';
import 'package:travel_app/profileScreen.dart';
import 'globals.dart' as globals;

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
            ? Text(widget.text, textAlign: TextAlign.start)
            : Text(
              widget.text,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
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
  final myList = globals.myList;
  bool isCommentsOn = false;

  @override
  Widget build(BuildContext context) {
    List<String> filters = [];
    if (widget.filter != null && widget.filter!.isNotEmpty) {
      filters = widget.filter!.split(", ");
    }

    final filteredList =
        myList.where((item) {
          final nameMatches =
              widget.searchQuery == null ||
              widget.searchQuery!.isEmpty ||
              item["name"].toLowerCase().contains(
                widget.searchQuery!.toLowerCase(),
              );
          final filterMatches =
              filters.isEmpty ||
              filters.any((filter) => item['country'].contains(filter));
          return nameMatches && filterMatches;
        }).toList();

    if (filteredList.isEmpty) {
      return const Center(
        child: Text(
          "There are no posts.",
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
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => ProfileScreen(
                              userName: item["name"],
                              pfp: item["pfp"],
                              followerCount: item["followerCount"],
                              bio: item["bio"],
                              followingCount: item["followingCount"],
                              postsCount: filteredList.length,
                            ),
                      ),
                    );
                  },
                  child: Row(
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
                          ),
                        ],
                      ),
                    ],
                  ),
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
                          Padding: EdgeInsets.all(10),
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
                      child: Icon(
                        item['isLiked']
                            ? Icons.favorite
                            : Icons.favorite_border_rounded,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${item["likes"]}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
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
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Expanded(
                                    child: ListView(
                                      children: const [
                                        ListTile(
                                          leading: CircleAvatar(
                                            child: Text("A"),
                                          ),
                                          title: Text("Alice"),
                                          subtitle: Text(
                                            "This is a great post!",
                                          ),
                                        ),
                                        ListTile(
                                          leading: CircleAvatar(
                                            child: Text("B"),
                                          ),
                                          title: Text("Bob"),
                                          subtitle: Text("I totally agree."),
                                        ),
                                        ListTile(
                                          leading: CircleAvatar(
                                            child: Text("C"),
                                          ),
                                          title: Text("Charlie"),
                                          subtitle: Text(
                                            "Amazing, I'd love to go there one day.",
                                          ),
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
                    Text(
                      '${item["commentsCount"]}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
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
