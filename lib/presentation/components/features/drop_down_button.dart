import 'package:flutter/material.dart';


class DropPage extends StatelessWidget{
  final dropValue = ValueNotifier('_value');
  final dropOptions = ['1','2','3','4','5'];

  DropPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('DropDown Menu'),
        elevation: 0,
      ),

      body: Center(
        child: ValueListenableBuilder(
          valueListenable: dropValue,
          builder: (BuildContext context, String value, _){
            return DropdownButton<String>(
              hint: const Text('Escolha um número'),
              value: (value.isEmpty) ? null : value,
              onChanged: (choice) => dropValue.value = choice.toString(),
              items: dropOptions.map((op) => DropdownMenuItem(
                value: op,
                child: Text(op),
              )).toList(),
            );
          },
        ),
      ),
      
    );
  }
}


/**
 * hint: Text(hint),
  value: (value.isEmpty) ? null : value,
  onChanged: (choice)=> dropValue.value = choice.toString(),
  items: dropOptions.map((op) => DropdownMenuItem(
    value: op,
    child: Text(op),
  )).toList(),
 */