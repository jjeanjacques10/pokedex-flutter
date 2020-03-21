import 'package:flutter/material.dart';
import '../../modelos/pokemon.dart';

class Detalhes extends StatelessWidget {
  final Pokemon pokemon;

  Detalhes({Key key, @required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _construirDetalhes();
  }

  Widget _construirDetalhes() {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _construirImagemDetalhes('assets/images/${pokemon.id}.png'),
          _construirTituloDetalhes(pokemon.name.english),
          _construirLinhaIconesDetalhes(
              'ID | ${pokemon.id.toString()}', pokemon.type.toString()),
          _construirSubtituloDetalhes('Base'),
          _construirTextoDetalhes('${pokemon.base.pokemonBases()}')
        ],
      ),
      appBar: _construirAppBar(),
    );
  }

  Widget _construirImagemDetalhes(imagem) {
    return Image.asset(imagem);
  }

  Widget _construirTituloDetalhes(titulo) {
    return Center(
        child: Text(
      titulo,
      style: TextStyle(color: Colors.red, fontSize: 30),
    ));
  }

  Widget _construirLinhaIconesDetalhes(id, type) {
    return Row(
      children: <Widget>[
        _construirColunaIconeDetalhes(Icons.trip_origin, id),
        _construirColunaIconeDetalhes(Icons.assignment, type)
      ],
    );
  }

  Widget _construirColunaIconeDetalhes(icone, texto) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(icone, color: Colors.red),
          Text(texto,
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  Widget _construirSubtituloDetalhes(subtitulo) {
    return Center(child: Text(subtitulo, style: TextStyle(fontSize: 25)));
  }

  Widget _construirTextoDetalhes(texto) {
    return Container(
        padding: EdgeInsets.all(16), child: Center(child: Text(texto, style: TextStyle(fontSize: 20),)));
  }

  Widget _construirAppBar() {
    return AppBar(
      title: Text('Cozinhando em Casa'),
    );
  }
}
