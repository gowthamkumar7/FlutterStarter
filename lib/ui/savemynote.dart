import 'package:challenge_1/database_play/databaseprovider.dart';
import 'package:challenge_1/database_play/datamodel/noteModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SaveNote extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SaveNoteState();
  }
}

class SaveNoteState extends State<SaveNote> {
  TextEditingController notesController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String dataInserted = "";

  int notesCount = 0;
  List<Note> notes = [];
  bool showSaveAnim = false;
  @override
  void dispose() {
    super.dispose();
    notesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Save Note"),
        ),
        body: Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Center(
                child: Column(
                  children: [
                    TextFormField(
                      controller: notesController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please Enter Something";
                        }
                        return null;
                      },
                      maxLines: 5,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Notes'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          print(_formKey.currentState);
                          if (_formKey.currentState.validate()) {
                            savetheNotes();
                          } else {
                            print("Hello");
                          }
                        },
                        child: Text("Save")),

                    SizedBox(
                        height: 200,
                        width: 200,
                        child: showSaveAnim
                            ? showLottieAnime()
                            : SizedBox.shrink()),

                  

                    // SizedBox(
                    //   height: 200,
                    //   width: 200,
                    //   child: ListView.builder(
                    //     itemCount: notes.length,
                    //     itemBuilder: (context, index) {
                    //       return Container(
                    //         height: 50,
                    //         child: Text(getDescription(index)),
                    //       );
                    //     },
                    //   ),
                    // )
                  ],
                ),
              ),
            )),
      ),
    );
  }

  //Save notes & exit
  void savetheNotes() {
    FocusScope.of(context).requestFocus(FocusNode());
    DataBaseHelper.db.insertNote(Note(description: notesController.text));
    setState(() {
      showSaveAnim = true;
    });

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pop(context);
    });
  }

  String getDescription(int index) {
    return this.notes[index].description;
  }

  showLottieAnime() {
    return Lottie.asset("./assets/saveanime.json");
  }
}
