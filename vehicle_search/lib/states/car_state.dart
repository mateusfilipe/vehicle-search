import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../entities/car.dart';

class CarApp extends StatefulWidget {
  const CarApp({super.key});

  @override
  State<CarApp> createState() => _CarState();
}

class _CarState extends State<CarApp> {
  final TextEditingController inputPlaca = TextEditingController();
  Car? futureCar;

  fetchCar() async {
    var placa = inputPlaca.text;
    final response = await http.post(
      Uri.parse('https://placa-fipe.apibrasil.com.br/placa/consulta'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'placa': placa,
      }),
    );
    if (response.statusCode == 200) {
      setState(() {
        futureCar = Car.fromJson(jsonDecode(response.body));
      });
    } else {
      // ignore: use_build_context_synchronously
      exibirAlertaPersonalizado(context, 'Erro na consulta!',
          'O retorno da conslta não foi o esperado.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        color: const Color(0xFF004A65),
                        width: 250,
                        height: 3,
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      // ignore: prefer_const_constructors
                      child: Text(
                        'Safe Vehicle Search',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        color: const Color(0xFFF15A29),
                        width: 250,
                        height: 3,
                      ),
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(
                  top: 50, left: 100, right: 100, bottom: 20),
              child: TextFormField(
                cursorColor: const Color(0xFFF15A29),
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Digite a placa do carro',
                    floatingLabelStyle: TextStyle(color: Color(0xFFF15A29)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF15A29)),
                    ),
                    enabledBorder: UnderlineInputBorder()),
                controller: inputPlaca,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 100),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 40,
                  width: 80,
                  color: const Color(0xFFF15A29),
                  child: TextButton(
                      onPressed: () {
                        if (inputPlaca.text == '') {
                          return exibirAlertaPersonalizado(
                              context,
                              'Input vazio!',
                              'Favor digitar algo no campo de busca.');
                        }
                        fetchCar();
                      },
                      child: const Text(
                        'Buscar',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
            ),
            if (futureCar != null)
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 40, right: 40, bottom: 10),
                child: Center(
                  child: SingleChildScrollView(
                    child: DataTable(
                      // ignore: prefer_const_literals_to_create_immutables
                      columns: [
                        const DataColumn(label: Text('Dado')),
                        const DataColumn(label: Text('Valor')),
                      ],
                      rows: [
                        DataRow(cells: [
                          const DataCell(Text('Marca')),
                          DataCell(Text(futureCar!.marca)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Valor')),
                          DataCell(Text(futureCar!.valor.toString())),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Modelo')),
                          DataCell(Text(futureCar!.modelo)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Ano Modelo')),
                          DataCell(Text(futureCar!.anoModelo)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Combustível')),
                          DataCell(Text(futureCar!.combustivel)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Código FIPE')),
                          DataCell(Text(futureCar!.codigoFipe)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Mês de Referência')),
                          DataCell(Text(futureCar!.mesReferencia)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Autenticação')),
                          DataCell(Text(futureCar!.autenticacao)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Tipo de Veículo')),
                          DataCell(Text(futureCar!.tipoVeiculo.toString())),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Sigla do Combustível')),
                          DataCell(Text(futureCar!.siglaCombustivel)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Data da Consulta')),
                          DataCell(Text(futureCar!.dataConsulta)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Cilindrada')),
                          DataCell(Text(futureCar!.cilindrada)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Potência')),
                          DataCell(Text(futureCar!.potencia)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Chassi')),
                          DataCell(Text(futureCar!.chassi)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Cor')),
                          DataCell(Text(futureCar!.cor)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('UF')),
                          DataCell(Text(futureCar!.uf)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Municipio')),
                          DataCell(Text(futureCar!.municipio)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('RENAVAM')),
                          DataCell(Text(futureCar!.renavam)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Extra')),
                          DataCell(Text(futureCar!.extra.toString())),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('IPVA')),
                          DataCell(Text(futureCar!.ipva)),
                        ]),
                      ],
                    ),
                  ),
                ),
              ),
          ]),
        ),
      ),
    );
  }
}

void exibirAlertaPersonalizado(
    BuildContext context, String titulo, String mensagem) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(titulo),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text(mensagem),
            ],
          ),
        ),
        actions: [
          Container(
            height: 25,
            width: 60,
            color: const Color(0xFFF15A29),
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Fechar',
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ],
      );
    },
  );
}
