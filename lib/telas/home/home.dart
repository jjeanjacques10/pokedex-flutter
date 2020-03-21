import 'package:flutter/material.dart';
import 'dart:convert';
import '../../modelos/pokemon.dart';
import '../detalhes/detalhes.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return _construirHome();
  }

  Widget _construirHome() {
    return Scaffold(
      body: _construitListaCard(),
      appBar: _construirAppBar(),
    );
  }

  Widget _construitListaCard() {
    return FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('assets/pokemon.json'),
        builder: (context, snapshot) {
          List<dynamic> pokemons = json.decode(snapshot.data.toString());

          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              Pokemon pokemon = Pokemon.fromJson(pokemons[index]);

              return _construirCard(pokemon);
            },
            itemCount: pokemons == null ? 0 : pokemons.length,
          );
        });
  }

  Widget _construirCard(pokemon) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Detalhes(pokemon: pokemon)));
      },
      child: SizedBox(
        height: 232,
        child: Card(
          margin: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  _construirImagemCard('assets/images/${pokemon.id}.png'),
                  _construirGradienteCard(),
                  _construirTextoCard(pokemon.name.english)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _construirGradienteCard() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.7),
          ])),
    );
  }

  Widget _construirTextoCard(texto) {
    return Positioned(
      bottom: 10,
      left: 10,
      child: Text(texto, style: TextStyle(fontSize: 20, color: Colors.white)),
    );
  }

  Widget _construirImagemCard(foto) {
    return Image.asset(foto, fit: BoxFit.fill, height: 200);
  }

  Widget _construirAppBar() {
    return AppBar(
      title: Text('Pokedex do Jean'),
      actions: <Widget>[
        IconButton(
            icon: Icon(
          Icons.tablet_android,
          color: Colors.white,
        ))
      ],
    );
  }
}
