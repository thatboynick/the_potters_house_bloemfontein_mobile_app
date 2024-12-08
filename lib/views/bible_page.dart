import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:xml/xml.dart' as xml;

class Bible extends StatefulWidget {
  const Bible({super.key});

  @override
  State<Bible> createState() => _BibleState();
}

class _BibleState extends State<Bible> {
  // List of available Bible versions
  final List<String> bibleVersions = ['ESV', 'NIV', 'NLT', 'NKJV', 'MSG'];

  // Currently selected version
  String selectedVersion = 'NIV';

  List<String> books = [];
  Map<String, List<String>> chapters = {};
  Map<String, Map<String, List<String>>> verses = {};

  String selectedBook = '';
  List<String> displayedVerses = [];

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    loadBible();
  }

  Future<void> loadBible() async {
    // Dynamically load XML based on selected version
    final xmlString = await rootBundle
        .loadString('assets/Bible_English_${selectedVersion}.xml');
    final document = xml.XmlDocument.parse(xmlString);

    final loadedBooks = <String>[];
    final loadedChapters = <String, List<String>>{};
    final loadedVerses = <String, Map<String, List<String>>>{};

    for (var book in document.findAllElements('BIBLEBOOK')) {
      final bookName = book.getAttribute('bname') ?? 'Unknown';
      loadedBooks.add(bookName);

      final bookChapters = <String>[];
      final chapterVerses = <String, List<String>>{};

      for (var chapter in book.findAllElements('CHAPTER')) {
        final chapterNumber = chapter.getAttribute('cnumber') ?? 'Unknown';
        bookChapters.add(chapterNumber);

        final chapterVerseList = <String>[];
        for (var verse in chapter.findAllElements('VERS')) {
          final verseText = verse.text.trim();
          chapterVerseList.add(verseText);
        }
        chapterVerses[chapterNumber] = chapterVerseList;
      }

      loadedChapters[bookName] = bookChapters;
      loadedVerses[bookName] = chapterVerses;
    }

    setState(() {
      books = loadedBooks;
      chapters = loadedChapters;
      verses = loadedVerses;

      // Set initial selections
      if (books.isNotEmpty) {
        // Check if the previously selected book and chapter exist in the new version
        if (loadedBooks.contains(selectedBook) &&
            loadedChapters[selectedBook]?.contains(_currentChapter()) == true) {
          // Retain the selected book and chapter
          displayedVerses = verses[selectedBook]![_currentChapter()]!;
        } else {
          // Reset to the first book and chapter if not found
          selectedBook = loadedBooks[0];
          displayedVerses = verses[selectedBook]![chapters[selectedBook]![0]]!;
        }
      }
    });
  }

  void _updateVerses(int chapterIndex) {
    setState(() {
      final chapterList = chapters[selectedBook] ?? [];
      if (chapterIndex >= 0 && chapterIndex < chapterList.length) {
        final selectedChapter = chapterList[chapterIndex];
        displayedVerses = verses[selectedBook]![selectedChapter]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Display book and chapter at the top
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$selectedBook ${_currentChapter()}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  selectedVersion,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          // PageView for swiping between chapters
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: chapters[selectedBook]?.length ?? 0,
              onPageChanged: (index) => _updateVerses(index),
              itemBuilder: (context, index) {
                final chapterVerses =
                    verses[selectedBook]?[chapters[selectedBook]![index]] ?? [];
                return ListView.builder(
                  itemCount: chapterVerses.length,
                  itemBuilder: (context, verseIndex) {
                    return ListTile(
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${verseIndex + 1}. ', // Verse number
                            style: TextStyle(
                              fontSize: 12, // Smaller font size
                              color: Colors.grey, // Light gray color
                            ),
                          ),
                          Expanded(
                            child: Text(
                              chapterVerses[verseIndex], // Verse text
                              style: TextStyle(
                                fontSize: 16, // Normal font size for verse text
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showSelectionDialog,
        label: Text(
          selectedBook,
          style: TextStyle(color: Colors.black),
        ),
        icon: const Icon(
          Icons.menu_book,
          color: Colors.black,
        ),
        backgroundColor: Color(0xffb7975b),
      ),
    );
  }

  String _currentChapter() {
    if (_pageController.hasClients) {
      return '${(_pageController.page?.round() ?? 0) + 1}'; // Adjust index to start from 1
    }
    return '1';
  }

  void _showSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Bible Selection', textAlign: TextAlign.center),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Bible Version Selector
                DropdownButton<String>(
                  isExpanded: true,
                  value: selectedVersion,
                  hint: const Text('Select Bible Version'),
                  dropdownColor: Colors.white,
                  items: bibleVersions.map((version) {
                    return DropdownMenuItem(
                      value: version,
                      child: Text(version),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedVersion = value;
                      });
                      // Reload Bible with new version
                      loadBible();
                      Navigator.pop(
                          context); // Close the dialog after selection
                    }
                  },
                ),
                const SizedBox(height: 16),
                // Book Selector
                DropdownButton<String>(
                  isExpanded: true,
                  value: selectedBook,
                  hint: const Text('Select Book'),
                  dropdownColor: Colors.white,
                  items: books.map((book) {
                    return DropdownMenuItem(
                      value: book,
                      child: Text(book),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedBook = value;
                        // Update chapters for the selected book
                        // Automatically reset to first chapter
                        displayedVerses =
                            verses[selectedBook]![chapters[selectedBook]![0]]!;
                        _pageController.jumpToPage(0);
                      });
                      Navigator.pop(context);
                      _showSelectionDialog(); // Reopen dialog
                    }
                  },
                ),
                const SizedBox(height: 16),
                // Chapter Selector
                DropdownButton<String>(
                  isExpanded: true,
                  value: chapters[selectedBook]![
                      _pageController.page?.round() ?? 0],
                  hint: const Text('Select Chapter'),
                  dropdownColor: Colors.white,
                  items: (chapters[selectedBook] ?? []).map((chapter) {
                    return DropdownMenuItem(
                      value: chapter,
                      child: Text('Chapter $chapter'),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      final chapterIndex =
                          chapters[selectedBook]!.indexOf(value);
                      setState(() {
                        displayedVerses = verses[selectedBook]![value]!;
                        _pageController.jumpToPage(chapterIndex);
                      });
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }
}
