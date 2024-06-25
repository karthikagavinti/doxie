import 'package:flutter/material.dart';

class History extends StatefulWidget {
  History({super.key});

  final List<String> pdfFiles = [
    'assets/history_pdf/history1.pdf',
    'assets/history_pdf/history2.pdf',
    'assets/history_pdf/history3.pdf',
    'assets/history_pdf/history4.pdf',
    'assets/history_pdf/history5.pdf',
    'assets/history_pdf/history6.pdf',
  ];

  @override
  // ignore: library_private_types_in_public_api
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<String> displayedPdfs = [];
  List<String> selectedPdfs = [];
  List<String> favoritePdfs = [];
  bool isSelectionMode = false;
  String searchQuery = "";
  bool isGridView = true;

  @override
  void initState() {
    super.initState();
    displayedPdfs = widget.pdfFiles;
  }

  void _filterPdfs(String query) {
    setState(() {
      searchQuery = query;
      displayedPdfs = widget.pdfFiles
          .where((pdf) => pdf.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _toggleSelectionMode(String pdf) {
    setState(() {
      if (selectedPdfs.contains(pdf)) {
        selectedPdfs.remove(pdf);
      } else {
        selectedPdfs.add(pdf);
      }
      isSelectionMode = selectedPdfs.isNotEmpty;
    });
  }

  void _clearSelection() {
    setState(() {
      selectedPdfs.clear();
      isSelectionMode = false;
    });
  }

  void _showPdfDetails(String pdf) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('PDF Details'),
        content: Text('Details for $pdf'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  // void _toggleFavorite(String pdf) {
  //   setState(() {
  //     if (favoritePdfs.contains(pdf)) {
  //       favoritePdfs.remove(pdf);
  //     } else {
  //       favoritePdfs.add(pdf);
  //     }
  //   });
  // }

  void _showSettings() {
    // Logic to show settings
  }

  void _sortPdfs() {
    // Logic to sort PDFs
  }

  void _toggleViewMode() {
    setState(() {
      isGridView = !isGridView;
    });
  }

  Widget _buildPdfCard(String pdf, int index) {
    final isSelected = selectedPdfs.contains(pdf);
    //final isFavorite = favoritePdfs.contains(pdf);

    return GestureDetector(
      onTap: () {
        // Navigate to PDF viewer on tap
      },
      onLongPress: () {
        _toggleSelectionMode(pdf);
      },
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        color: isSelected ? Colors.blue.withOpacity(0.3) : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.picture_as_pdf,
                  size: 48,
                  color: Theme.of(context).primaryColor,
                ),
                if (isSelected)
                  Icon(
                    Icons.check_circle,
                    size: 48,
                    color: Colors.green.withOpacity(0.8),
                  ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'PDF ${index + 1}',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Size: 1.2MB',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            // if (isFavorite)
            //   Icon(
            //     Icons.favorite,
            //     color: Colors.red,
            //   ),
            // IconButton(
            //   icon: Icon(
            //     isFavorite ? Icons.favorite : Icons.favorite_border,
            //     color: isFavorite ? Colors.red : Colors.grey,
            //   ),
            //   onPressed: () => _toggleFavorite(pdf),
            // ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF7C7C),
        title: Text('Previous PDFs'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: _showSettings,
          ),
          IconButton(
            icon: Icon(isGridView ? Icons.list : Icons.grid_view),
            onPressed: _toggleViewMode,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterPdfs,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search PDFs',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(26),
                ),
              ),
            ),
          ),
          Expanded(
            child: isGridView
                ? GridView.builder(
                    padding: const EdgeInsets.all(16.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio:
                          0.7, // Adjust aspect ratio for better visual appeal
                    ),
                    itemCount: displayedPdfs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final pdf = displayedPdfs[index];
                      return _buildPdfCard(pdf, index);
                    },
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: displayedPdfs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final pdf = displayedPdfs[index];
                      return _buildPdfCard(pdf, index);
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: isSelectionMode
          ? BottomAppBar(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: _clearSelection,
                    child: Text('Clear Selection'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Logic for bulk action (like delete)
                    },
                    child: Text('Delete Selected'),
                  ),
                ],
              ),
            )
          : SizedBox.shrink(),
    );
  }
}
