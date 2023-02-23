class Car {
  final String valor;
  final String marca;
  final String modelo;
  final String anoModelo;
  final String combustivel;
  final String codigoFipe;
  final String mesReferencia;
  final String autenticacao;
  final int tipoVeiculo;
  final String siglaCombustivel;
  final String dataConsulta;
  final String cilindrada;
  final String potencia;
  final String chassi;
  final String cor;
  final String uf;
  final String municipio;
  final String renavam;
  final bool extra;
  final String ipva;

  const Car({
    required this.marca,
    required this.valor,
    required this.modelo,
    required this.anoModelo,
    required this.combustivel,
    required this.codigoFipe,
    required this.mesReferencia,
    required this.autenticacao,
    required this.tipoVeiculo,
    required this.siglaCombustivel,
    required this.dataConsulta,
    required this.cilindrada,
    required this.potencia,
    required this.chassi,
    required this.cor,
    required this.uf,
    required this.municipio,
    required this.renavam,
    required this.extra,
    required this.ipva,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      valor: json['Valor'],
      marca: json['Marca'],
      modelo: json['Modelo'],
      anoModelo: json['AnoModelo'],
      combustivel: json['Combustivel'],
      codigoFipe: json['CodigoFipe'],
      mesReferencia: json['MesReferencia'],
      autenticacao: json['Autenticacao'],
      tipoVeiculo: json['TipoVeiculo'],
      siglaCombustivel: json['SiglaCombustivel'],
      dataConsulta: json['DataConsulta'],
      cilindrada: json['cilindradas'],
      potencia: json['potencia'],
      chassi: json['chassi'],
      cor: json['cor'],
      uf: json['uf'],
      municipio: json['municipio'],
      renavam: json['renavam'],
      extra: json['extra'],
      ipva: json['ipva'],
    );
  }
}
