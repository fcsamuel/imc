import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Imc extends StatefulWidget {
  @override
  _ImcState createState() => _ImcState();
}

class _ImcState extends State<Imc> {

  TextEditingController _peso = new TextEditingController();
  TextEditingController _altura = new TextEditingController();
  String _resultado = "";

  void _calcularImc() {
    double peso = double.tryParse(_peso.text);
    double altura = double.tryParse(_altura.text);
    double resultado = peso / (altura * altura);

    if (peso == null || altura == null) {
      _resultado = "Os dados informados são inválidos. Preencha os campos corretamente.";
    } else {
      if (resultado < 18.5) {
        _resultado = "Seu IMC é: " + resultado.toStringAsPrecision(2) + ". Você está abaixo do peso!";
      } else if (resultado <= 24.9) {
        _resultado = "Seu IMC é: " + resultado.toStringAsPrecision(2) + ". O seu peso está normal!";
      } else if (resultado <= 29.9) {
        _resultado = "Seu IMC é: " + resultado.toStringAsPrecision(2) + ". Você está com sobrepeso!";
      } else if (resultado <= 34.9) {
        _resultado = "Seu IMC é: " + resultado.toStringAsPrecision(2) + ". Você está com obesidade grau 1!";
      } else if (resultado <= 39.9) {
        _resultado = "Seu IMC é: " + resultado.toStringAsPrecision(2) + ". Você está com obesidade grau 2!";
      } else {
        _resultado = "Seu IMC é: " + resultado.toStringAsPrecision(2) + ". Você está com obesidade grau 3!";
      }
      _limparCampos();
      setState(() {
        "$_resultado";
      });
    }
  }

  void _limparCampos() {
    _peso.text = "";
    _altura.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC")
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Insira sua altura e peso para saber qual o seu IMC",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Informe o seu peso (quilos)"),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                controller: _peso,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Informe a sua altura (metros)"),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                controller: _altura,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white70,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Calcular",
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: _calcularImc
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  "$_resultado",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
