import 'package:dsc_shop/Domain/Models/Product.dart';
import 'package:dsc_shop/Layout/Tools/SearchManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  const SearchBar(this.data, this.results, this.oneResult, this.pageContext);
  final List<Product> data;
  final Function(List<Product>) results;
  final Function(Product) oneResult;
  final BuildContext pageContext;

  @override
  Widget build(BuildContext context) {
    var searchmanager = Provider.of<SearchManager>(context);
    if (searchmanager.data == null) searchmanager.setData(data);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(icon: Icon(Icons.menu), onPressed: () => Scaffold.of(pageContext).openDrawer()),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    color: Colors.grey.shade200,
                    child: TextField(
                      onSubmitted: (value) {
                        List<Product> list = searchmanager.data.where((element) => element.name.startsWith(searchmanager.text)).toList();
                        searchmanager.check(false);
                        results(list);
                      },
                      onChanged: (value) {
                        searchmanager.changeText(value);
                        searchmanager.check(true);
                      },
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(),
                        suffixIcon: IconButton(
                            icon: Icon(Icons.search, color: Colors.black),
                            onPressed: () {
                              List<Product> list = searchmanager.data.where((element) => element.name.startsWith(searchmanager.text)).toList();
                              searchmanager.check(false);
                              results(list);
                            }),
                        hintText: "Search",
                      ),
                    ),
                  ),
                  if (searchmanager.text != "" && searchmanager.stillSearching)
                    Container(
                      height: 150,
                      decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: searchmanager.data
                              .map(
                                (e) => (!e.name.startsWith(searchmanager.text))
                                    ? SizedBox()
                                    : InkWell(
                                        onTap: () {
                                          searchmanager.check(false);
                                          searchmanager.changeText(e.name);
                                          oneResult(e);
                                        },
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              color: Colors.grey.shade200,
                                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                              child: Text(
                                                e.name,
                                                maxLines: 1,
                                                style: TextStyle(color: Colors.black),
                                              ),
                                            ),
                                            Divider(
                                              height: 0,
                                              color: Colors.black,
                                              indent: 5,
                                              endIndent: 5,
                                            )
                                          ],
                                        ),
                                      ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
