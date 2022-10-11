import 'package:advanced_exercise_3/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Exercise 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Exercise 3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer(
          builder: (context, ref, _) {
            final List<Pet> pets = ref.watch(petsProvider);
            return ListView(
              children: pets.map((pet) =>
                Card(
                  child: Text('名前:${pet.name}　品種:${pet.breed}　性別:${pet.sex.string}', style: const TextStyle(fontSize: 20),)
                ),
              ).toList(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> showDialog<String>(
          context: context,
          builder: (BuildContext context) {
            return Consumer(
              builder: (context, ref, _) {
                return AlertDialog(
                  title: const Text('ペットを追加'),
                  content: SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          onChanged: (value){
                          },
                          decoration: const InputDecoration(labelText: '名前', border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 10,),
                        TextField(
                          onChanged: (value){
                          },
                          decoration: const InputDecoration(labelText: '品種', border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            const Spacer(),
                            Radio<Sex>(
                              value: Sex.male,
                              groupValue: Sex.female,
                              onChanged: (Sex? value) {
                              },
                            ),
                            const Text('オス'),
                            const Spacer(),
                            Radio<Sex>(
                              value: Sex.female,
                              groupValue: Sex.female,
                              onChanged: (Sex? value) {
                              },
                            ),
                            const Text('メス'),
                            const Spacer(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context, 'OK');
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}