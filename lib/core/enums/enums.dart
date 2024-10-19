enum Genero {
  masculino,
  femenino,
}

enum NivelAtividadeFisica {
  sedentario,
  leve,
  moderado,
  ativo,
  muitoIntenso,
}

enum Objetivo {
  ganharPeso,
  perderPeso,
}

Map<String, dynamic> generoMap = {
  'masculino': Genero.masculino,
  'femenino': Genero.femenino,
};

Map<String, dynamic> nivelAtividadeFisicaMap = {
  'sedentario': NivelAtividadeFisica.sedentario,
  'leve': NivelAtividadeFisica.leve,
  'moderado': NivelAtividadeFisica.moderado,
  'ativo': NivelAtividadeFisica.ativo,
  'muitoIntenso': NivelAtividadeFisica.muitoIntenso,
};

Map<String, dynamic> objetivoMap = {
  'ganharPeso': Objetivo.ganharPeso,
  'perderPeso': Objetivo.perderPeso,
};

const String profileKey = 'profile';
const String resultKey = 'result';
