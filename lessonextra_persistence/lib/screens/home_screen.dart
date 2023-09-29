import 'package:flutter/material.dart';
import 'package:lesson_extra_persistence/db/db_provider.dart';
import 'package:lesson_extra_persistence/utils/colors.dart';
import 'package:lesson_extra_persistence/utils/mydrawal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dbHelper = DatabaseHelper.instance;
  List<Map<String, dynamic>> allCategoryData = [];
  TextEditingController _categoryName = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  
  @override
  void initState() {
    categoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      drawer: MyDrawal(),
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        centerTitle: true,
        title: Text("Categorias"),
      ),
      body: Form(
        key: formGlobalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ignore: sized_box_for_whitespace
                        Container(
                          width: 250,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.greenAccent, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: MyColors.primaryColor, width: 1.0),
                              ),
                              hintText: 'Adicionar Categoria',
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                            ),
                            controller: _categoryName,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Ingresar nombre de categoría';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextButtonTheme(
                      data: TextButtonThemeData(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              MyColors.primaryColor),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (formGlobalKey.currentState!.validate()) {
                            insertCategory();
                          }
                        },
                        child: const Text(
                          "Guardar",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: allCategoryData.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (_, index) {
                          var item = allCategoryData[index];
                          return Container(
                            padding: EdgeInsets.zero,
                            margin: EdgeInsets.zero,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text("${item['name']}"),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        delete(item['_id']);
                                      },
                                      icon: const Icon(Icons.delete),
                                    ),
                                    const SizedBox(width: 20,)
                                  ],
                                ),
                                const Divider(
                                  color: MyColors.primaryColor,
                                  thickness: 1,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void insertCategory() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: _categoryName.text
    };
    int id = await dbHelper.insertCategory(row);
    _categoryName.text = "";
    categoryList();
  }

  void categoryList() async {
    final allRows = await dbHelper.queryAllCategory();
    setState(() {
      allCategoryData = allRows;
    });
  }

  void delete(int id) async {
    final rowDeleted = await dbHelper.deleteCategory(id);
    categoryList();
  }
  
}