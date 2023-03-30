import 'package:band_names/models/band_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
   
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BandModel> bands=[
    BandModel(
      id: '1',
      name: 'javier',
      votes: 3
    ),
    BandModel(
      id: '2',
      name: 'javier2',
      votes: 4
    ),
    BandModel(
      id: '3',
      name: 'javier3',
      votes: 3
    ),
    BandModel(
      id: '4',
      name: 'javier4',
      votes: 8
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:AppBar(
    title:Text('HomeScreen')
    ),
    body:ListView.builder(
      itemCount:bands.length,
      itemBuilder: (BuildContext context, int index)=>listTile(bands[index]) 
     
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        final TextEditingController textEditingController=TextEditingController();
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            title: Text('Add bands'),
            content: TextField(
              controller: textEditingController,
            ),
            actions: [
              TextButton(
                onPressed:()=> addBand(textEditingController.text), 
                child: Text('add'))
            ], 
          ),
        );
      },
      child: Icon(Icons.add),
    ),
    );
  }

  Dismissible listTile(BandModel band) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) => print('delete $direction'),
      key: Key(band.id),
      background: Container(
        padding: EdgeInsets.only(left: 16),
        alignment: Alignment.centerLeft,
        color: Colors.red,
        child: Icon(Icons.delete,color: Colors.white,),
      ),
      child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.amber,
            child: Text(band.name.substring(0,2)),
          ),
          title: Text(band.name),
          trailing:Text(band.votes.toString()) ,
          onTap: (){},
        ),
    );
  }
  void addBand(text){
    bands.add(BandModel(name: text, id: DateTime.now.toString(), votes: 5));
    setState(() {});
  }
}