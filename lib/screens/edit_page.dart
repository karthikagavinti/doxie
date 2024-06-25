import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:doxie/home_screen.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool _isSubscribed = false;
  String _selectedOption = 'Option 1';
 // double _sliderValue = 0.0;
  FlutterTts flutterTts = FlutterTts();

  String? pdfAsset = 'assets/sample.pdf'; // Replace with your PDF asset path

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'EDIT',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF7C7C),
                      shadows: [
                        Shadow(
                          color: Color(0xFFFF7C7C),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  CheckboxListTile(
                    title: Text(
                      'Newsletter',
                      style: TextStyle(color: Color(0xFFFF7C7C)),
                    ),
                    value: _isSubscribed,
                    onChanged: (value) {
                      setState(() {
                        _isSubscribed = value ?? false;
                      });
                    },
                    activeColor: Colors.white,
                    checkColor: Colors.lightBlue.withOpacity(0.8),
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value ?? 'Option 1';
                      });
                    },
                    decoration: InputDecoration(
                      // labelText: 'Select Option',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    items: ['Option 1', 'Option 2', 'Option 3']
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 16),
                  // Slider(
                  //   value: _sliderValue,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       _sliderValue = value;
                  //     });
                  //   },
                  //   min: 0,
                  //   max: 100,
                  //   divisions: 100,
                  //   label: _sliderValue.toString(),
                  // ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () async {
                      // Save changes logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Changes saved!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF7C7C),
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 32,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 3,
                    ),
                    child: Text(
                      'Save Changes',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Go Back',
                      style: TextStyle(fontSize: 18, color: Color(0xFFFF7C7C)),
                    ),
                  ),
                  // SizedBox(height: 24),
                  // Expanded(
                  //   child: pdfAsset != null
                  //       ? PDFView(
                  //           filePath: pdfAsset!,
                  //           enableSwipe: true,
                  //           swipeHorizontal: true,
                  //         )
                  //       : Center(
                  //           child: CircularProgressIndicator(),
                  //         ),
                  // ),
                  // SizedBox(height: 24),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Basic AI functionality - Text to Speech
                  //     _speak('Hello, I am your AI assistant!');
                  //   },
                  //   child: Text('Speak'),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    flutterTts.stop();
    super.dispose();
  }
}
