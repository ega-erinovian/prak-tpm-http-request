import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http_request/controller/covid_data_source.dart';
import 'package:http_request/model/countries.dart';

class PageDetailCountries extends StatefulWidget {
  const PageDetailCountries({Key? key}) : super(key: key);

  @override
  _PageDetailCountriesState createState() => _PageDetailCountriesState();
}

class _PageDetailCountriesState extends State<PageDetailCountries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Countries List"),
      ),
      body: _buildDetailCountriesBody(),
    );
  }

  Widget _buildDetailCountriesBody() {
    return Container(
      // FutureBuilder() membentuk hasil Future dari request API kita
      child: FutureBuilder(
        future: CovidDataSource.instance.loadCountries(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            CountriesModel countriesModel =
                CountriesModel.fromJson(snapshot.data);
            return _buildSuccessSection(countriesModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  // Jika API sedang dipanggil
  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildEmptySection() {
    return Text("Empty");
  }

  // Jika data ada
  Widget _buildSuccessSection(CountriesModel data) {
    return ListView.builder(
      itemCount: data.countries?.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: _buildItemCountries("${data.countries?[index].iso3}"),
          subtitle: _buildItemCountries("${data.countries?[index].name}"),
        );
      },
    );
  }

  Widget _buildItemCountries(String value) {
    return Text(value);
  }

  Widget _floatingButton() {
    return FloatingActionButton(
        tooltip: 'Add Todo', onPressed: () {}, child: Icon(Icons.add));
  }
}
