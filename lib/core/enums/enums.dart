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

Map<String, Genero> generoEnumMap = {
  'masculino': Genero.masculino,
  'femenino': Genero.femenino,
};

Map<String, String> generoStringMap = {
  'masculino': 'Masculino',
  'femenino': 'Femenino',
};

Map<String, NivelAtividadeFisica> nivelAtividadeFisicaEnumMap = {
  'sedentario': NivelAtividadeFisica.sedentario,
  'leve': NivelAtividadeFisica.leve,
  'moderado': NivelAtividadeFisica.moderado,
  'ativo': NivelAtividadeFisica.ativo,
  'muitoIntenso': NivelAtividadeFisica.muitoIntenso,
};

Map<String, String> nivelAtividadeFisicaStringMap = {
  'sedentario': 'Sedentário',
  'leve': 'Leve',
  'moderado': 'Moderado',
  'ativo': 'Ativo',
  'muitoIntenso': 'Muito Intenso',
};

Map<String, Objetivo> objetivoEnumMap = {
  'ganharPeso': Objetivo.ganharPeso,
  'perderPeso': Objetivo.perderPeso,
};

Map<String, String> objetivoStringMap = {
  'ganharPeso': 'Ganhar Peso',
  'perderPeso': 'Perder Peso',
};

Map<String, String> objetivoTranslateMap = {
  'weight_gain': 'ganharPeso',
  'weight_loss': 'perderPeso',
};

const String profileKey = 'profile';
const String resultKey = 'result';
