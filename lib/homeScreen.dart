import 'package:flutter/material.dart';
import 'package:travel_app/profileScreen.dart';

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
            : Text(widget.text, maxLines: 3, overflow: TextOverflow.ellipsis),
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
      "followerCount": 300,
      "followingCount": 500,
      "bio":
          "Hola! I'm a restless Spaniard who ditched the ordinary to chase the extraordinary. I swap routine for impromptu fiestas, savor local flavors that sing, and believe every misadventure is just a plot twist in my ever-unfolding travel saga. Join me as I break the mold, one unforgettable detour at a time.",
    },
    {
      "name": "Jack Smith",
      "pfp": "assets/pfp2.jpg",
      "country": "Iraq 🇮🇶",
      "text":
          "quisquam, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora...",
      "image": "assets/images/images.jpeg",
      "likes": 3000,
      "commentsCount": 1452,
      "isLiked": false,
      "followerCount": 73482,
      "followingCount": 10,
      "bio":
          "An accomplished global traveler, I have had the honor of visiting every recognized country, each journey deepening my understanding of diverse cultures and histories. With a steadfast commitment to fostering cross-cultural dialogue and lifelong learning, I share insights gained from the world's myriad perspectives to inspire unity and informed global citizenship",
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
      "followerCount": 300,
      "followingCount": 500,
      "bio":
          "Hola! I'm a restless Spaniard who ditched the ordinary to chase the extraordinary. I swap routine for impromptu fiestas, savor local flavors that sing, and believe every misadventure is just a plot twist in my ever-unfolding travel saga. Join me as I break the mold, one unforgettable detour at a time.",
    },
    {
      "name": "Alice Johnson",
      "pfp": "assets/pfp3.jpg",
      "country": "United States 🇺🇸",
      "text":
          "Ten Fun Facts About the USA \n 1. It’s the fourth-largest country in the world by land area and third by population \n 2. Despite its size, the USA only shares land borders with Canada and Mexico \n 3. Most of the world’s tornadoes occur in Tornado Alley \n 4. The Mississippi River and the Missouri River combine to form the biggest river system in the USA and the fourth biggest in the world \n 5. Montana has twice as many cows as people \n 6. Over eight million slices of pizza are served in the USA every day \n 7. No grizzly bears have been spotted in California since 1922 \n 8. The seven rays on the crown of the Statue of Liberty have multiple interpretations \n 9. No official language exists in the USA \n 10. It was once illegal to serve cherry pie with ice cream in Kansas",
      "image": "assets/images/usa.jpg",
      "likes": 134,
      "commentsCount": 20,
      "isLiked": false,
      "followerCount": 51,
      "followingCount": 32,
      "bio":
          "New to the passport game but already captivated by the world's wonders. Every trip is a fresh chapter, full of firsts, surprises, and endless learning. Follow my journey as I embrace the thrill of discovery one adventure at a time",
    },
    {
      "name": "Neo Anderson",
      "pfp": "assets/pfp4.jpg",
      "country": "India 🇮🇳",
      "text":
          "Standing in awe of the Taj Mahal’s timeless grandeur. Nothing compares to seeing this marble masterpiece in person! #Agra #TajMahal #IncredibleIndia #Wanderlust #TravelGram",
      "image": "assets/images/inda.jpg",
      "likes": 144,
      "commentsCount": 50,
      "isLiked": false,
      "followerCount": 203,
      "followingCount": 205,
      "bio":
          "27 years old and already 20 stamps deep in my passport—each one a story waiting to be told. I'm a globetrotter chasing the thrill of new cultures, street food adventures, and those unforgettable moments off the beaten path. Join me on this journey of endless discovery",
    },
    {
      "name": "Helena Eagen",
      "pfp": "assets/pfp6.jpg",
      "country": "Canada 🇨🇦",
      "text":
          "Ever had an unexpected detour that turned into the best part of your day? Today, a surprise downpour led me off the beaten path deep in the Rockies. I found shelter in a charming, hidden cabin where a local shared legends of the land and secret spots only known to true adventurers. Now, as the skies clear, I’m soaking in this breathtaking view, reminded that every twist in the journey has its own magic. #CanadaAdventure #TravelStory #HiddenGems #Wanderlust",
      "image": "assets/images/canada.jpg",
      "likes": 2341,
      "commentsCount": 50,
      "isLiked": false,
      "followerCount": 5621,
      "followingCount": 354,
      "bio":
          "A global nomad with a penchant for unpredictable adventures—whether it's exploring bustling cities or wandering through wild, untouched landscapes, every journey transforms me. Join me as I capture the magic that happens when borders blur and the spirit of adventure takes over.",
    },
    {
      "name": "Mark Scout",
      "pfp": "assets/pfp5.jpg",
      "country": "United Kingdom 🇬🇧",
      "text":
          "Cheers from London! Embracing the British weather in style under Big Ben. #LondonCalling #BigBen #UKAdventures #UnionJack \n #TravelBlogger #Wanderlust",
      "image": "assets/images/uk.jpg",
      "likes": 200,
      "commentsCount": 66,
      "isLiked": false,
      "followerCount": 200,
      "followingCount": 400,
      "bio":
          "Born a citizen of the world and now calling the UK my home base, I wander far and wide, collecting unforgettable stories and moments. From London's vibrant streets to hidden corners abroad, I’m all about trading the routine for pure discovery.",
    },
    {
      "name": "Jim Halpert",
      "pfp": "assets/pfp7.jpg",
      "country": "Japan",
      "text":
          "I started my day searching for a hidden teahouse in the backstreets of Kyoto. Along the way, I got lost amid these charming wooden homes and stumbled upon a tiny workshop where a local artisan showed me the art of weaving straw mats. After sharing a cup of matcha and hearing tales of old Kyoto, I stepped back outside, feeling more connected to the history around me. Now, I’m pausing to take in every detail of this quiet lane, reminded that sometimes the best adventures happen when you wander off the map.",
      "image": "assets/images/japan.jpg",
      "likes": 503,
      "commentsCount": 230,
      "isLiked": false,
      "followerCount": 1230,
      "followingCount": 5,
      "bio":
          "Quietly curious and a lover of the offbeat, I'm the guy who wanders Kyoto's hidden lanes in search of untold stories. Passionate about traditional tea houses, local craftsmanship, and spontaneous detours, I believe every unexpected moment is a chance to discover a new piece of Japan's soul. Let’s explore the art of the unplanned together.",
    },
  ];
  bool isCommentsOn = false;
  final List<Map<String, dynamic>> comments = [
    {"comment": "Wow Amazing work keep up!"},
  ];

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
                      child: Icon(
                        item['isLiked']
                            ? Icons.thumb_up
                            : Icons.thumb_up_alt_outlined,
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
