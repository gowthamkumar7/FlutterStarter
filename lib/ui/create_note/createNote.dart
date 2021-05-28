import 'package:challenge_1/database_play/databaseprovider.dart';
import 'package:challenge_1/database_play/datamodel/noteModel.dart';
import 'package:challenge_1/ui/savemynote.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateNote extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateNoteState();
  }
}

class CreateNoteState extends State<CreateNote> {
  List<Note> notesList = [];
  int notesCount = 0;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print("Triggering");
      fetchNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text("Notes")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SaveNote(),
              )).then((value) => setState(() {
                fetchNotes();
              }));
        },
        child: Icon(Icons.add),
      ),
      body: _buildCreateNote(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    ));
  }

  Widget _buildCreateNote(BuildContext context) {
    return ListView.builder(
      itemCount: notesCount,
      itemBuilder: (context, index) {
        return Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
            constraints: BoxConstraints(
              minHeight: 50,
            ),
            width: double.infinity,
            child: Wrap(
              children: [showListOfNotes(index)],
            ));
      },
    );
  }

  void fetchNotes() async {
    DataBaseHelper.db.retriveData().then((value) => {
          setState(() {
            notesList = value;
            notesCount = value.length;
          })
        });
  }

  Widget showListOfNotes(int index) {
    if (notesList == null && notesList.isEmpty) {
      return Center(
        child: Text("Press '+' to create a Note"),
      );
    } else {
      return Card(
          child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Text(notesList[index].description),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  notesList[index].description,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ));
    }
  }
}
