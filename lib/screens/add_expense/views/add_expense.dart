import 'package:expense_tracker/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
import 'package:expense_tracker/screens/add_expense/views/category_creation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();

    dateController.text = DateFormat('dd/MM/yy').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Add Expense",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  controller: expenseController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                      prefixIcon: const Icon(
                        FontAwesomeIcons.dollarSign,
                        size: 16,
                        color: Colors.grey,
                      )),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                readOnly: true,
                onTap: () {},
                controller: categoryController,
                decoration: InputDecoration(
                  hintText: "Category",
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12)),
                      borderSide: BorderSide.none),
                  prefixIcon: const Icon(
                    FontAwesomeIcons.list,
                    size: 16,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      getCategoryCreation(context);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.plus,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                // color: Colors.red,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
                    builder: (context, state) {
                      if (state is GetCategoriesSuccess) {
                        return ListView.builder(
                            itemCount: state.categories.length,
                            itemBuilder: (context, index) {
                              return Card(
                                  child: ListTile(
                                leading: Image.asset(
                                  'assets/${state.categories[index].icon}.png',
                                  scale: 2,
                                ),
                                title: Text(state.categories[index].name),
                                tileColor: state.categories[index].colors
                                    .substring(10, 16)
                                    .toColor(),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ));
                            });
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: dateController,
                readOnly: true,
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)));

                  if (newDate != null) {
                    setState(() {
                      dateController.text =
                          DateFormat('dd/MM/yy').format(newDate);
                      selectedDate = newDate;
                    });
                  }
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Date",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                    prefixIcon: const Icon(
                      FontAwesomeIcons.clock,
                      size: 16,
                      color: Colors.grey,
                    )),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: double.infinity,
                height: kToolbarHeight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: const Text(
                    "Save Expense",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
