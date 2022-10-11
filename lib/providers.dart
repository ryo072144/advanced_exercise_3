import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models.dart';

const List<Pet> initialPets = [
  Pet(name: 'むぎ', breed: 'アメリカンショートヘア', sex: Sex.male),
  Pet(name: 'スーザン', breed: 'コーギー', sex: Sex.female),
  Pet(name: '太郎', breed: '柴犬', sex: Sex.male),
  Pet(name: 'プリンセス', breed: 'ペルシャ', sex: Sex.female),
];


class PetsNotifier extends StateNotifier<List<Pet>> {
  PetsNotifier(): super(initialPets);

  void addPet(Pet pet) {
  }
}

final petsProvider = StateNotifierProvider<PetsNotifier, List<Pet>>((ref) {
  return PetsNotifier();
});