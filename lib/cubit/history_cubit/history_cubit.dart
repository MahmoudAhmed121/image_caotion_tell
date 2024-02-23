import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';

class HistoryCubit extends Cubit<List<String>> {
  HistoryCubit() : super([]);

  void saveValue(String value) async {
    final box = Hive.box('historyBox');
    final historyList = [...state, value];
    await box.put('historyList', historyList);
    emit(historyList);
  }

  Future<void> loadHistory() async {
    final box = Hive.box('historyBox');
    final historyList = box.get('historyList', defaultValue: []);
    emit(historyList);
  }
}
