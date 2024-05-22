// ignore_for_file: unnecessary_string_interpolations
import 'package:do_an_cuoi_ki/authen.dart';
import 'package:do_an_cuoi_ki/components/app_bar.dart';
import 'package:do_an_cuoi_ki/components/app_drawer.dart';
import 'package:do_an_cuoi_ki/components/search_box.dart';
import 'package:do_an_cuoi_ki/pages/home_page.dart';
import 'package:do_an_cuoi_ki/services/local/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/food_item.dart';
import '../models/food_model.dart';
import '../pages/home_page.dart';

class SearchPage extends StatefulWidget {

  
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  TextEditingController editingController = TextEditingController();
  TextEditingController addController = TextEditingController();
  FocusNode addFocus = FocusNode();
  SharedPrefs prefs = SharedPrefs();
  List<TodoModel> todos = [];
  List<TodoModel> searchList = [];
  bool showAddBox = false;

    @override
  void initState() {
    super.initState();
    _getTodoList();
  }

  void _getTodoList() {
    prefs.getList().then((value) {
      todos = value ?? [...todoListA];
      searchList = [...todos];
      setState(() {});
    });
  }

  void _search(String value) {
    value = value.toLowerCase();
    searchList = todos
        .where((e) => (e.text ?? '').toLowerCase().contains(value))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    VoidCallback _closeDrawer = () {
    Navigator.of(context).pop(); // Đóng drawer
    };
    return Scaffold(
      appBar: CustomAppBar(title: 'NHÀ THUỐC XANH'),  
      body: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SearchBox(
                        controller: searchController,
                        onChanged: _search,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    _divider(),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0)
                            .copyWith(top: 16.0, bottom: 98.0),
                        itemBuilder: (context, index) {
                          final todo = searchList.reversed.toList()[index];
                          return TodoItem(
                            todo,
                            onTap: () {
                              todo.isDone = !(todo.isDone ?? false);
                              prefs.saveList(todos);
                              setState(() {});
                            },
                            onEditing: () => _editing(context, todo),
                            onDelete: () => _delete(context, todo),
                          );
                        },
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: 20.0),
                        itemCount: searchList.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
          ],
        ),
      

    endDrawer: const AppDrawer(currentPage: 'InfoPage'),
  );
  }
    Widget _addButton() {
    return GestureDetector(
      onTap: () {
        if (!showAddBox) {
          showAddBox = true;
          setState(() {});
          addFocus.requestFocus();
          return;
        }

        String text = addController.text.trim();
        if (text.isEmpty) {
          showAddBox = false;
          setState(() {});
          addFocus.unfocus();
          return;
        }

        final todo = TodoModel()
          ..id = '${DateTime.now().millisecondsSinceEpoch}'
          ..text = text
          ..isDone = false;

        todos.add(todo);
        prefs.saveList(todos);
        _search('');
        addController.clear();
        searchController.clear();
        addFocus.unfocus();
        showAddBox = false;
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.orange,
          border: Border.all(color: Colors.red, width: 1.2),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0.0, 3.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: const Icon(Icons.add, size: 32.6, color: Colors.white),
      ),
    );
  }

  Widget _addBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.orange, width: 1.2),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0.0, 3.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: TextField(
        controller: addController,
        focusNode: addFocus,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Add a new todo item',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  void _editing(BuildContext context, TodoModel todo) {
    editingController.text = todo.text ?? '';
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundColor: Colors.orange.withOpacity(0.8),
              radius: 14.0,
              child: const Icon(Icons.edit, size: 16.0, color: Colors.white),
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(controller: editingController),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.blue, fontSize: 16.8),
              ),
              onPressed: () {
                todo.text = editingController.text.trim();
                prefs.saveList(todos);
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.blue, fontSize: 16.8),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _delete(BuildContext context, TodoModel todo) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('😐'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Delete this task?',
                  style: TextStyle(color: Colors.brown, fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.blue, fontSize: 16.8),
              ),
              onPressed: () {
                todos.removeWhere((e) => e.id == todo.id);
                searchList.removeWhere((e) => e.id == todo.id);
                prefs.saveList(todos);
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'No',
                style: TextStyle(color: Colors.blue, fontSize: 16.8),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _divider() {
    return const Divider(
      height: 1.2,
      thickness: 1.2,
      indent: 20.0,
      endIndent: 20.0,
      color: Colors.grey,
    );
  }
  
}
    // body:Center(
    //   child: Builder(
    //       builder: (BuildContext context) {
    //         return ElevatedButton(
    //           onPressed: () {
    //             Scaffold.of(context).openDrawer();
    //           },
    //           child: Text('Mở Drawer'),
    //         );
    //       }
    //   ),
    // ),