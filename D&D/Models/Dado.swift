class Dado{
  var valorDado:Int = 0
  var valorModificador:Int = 0
  var numeroFaces:Int = 0
  var valorProeficiencia:Int = 0
  var total:Int = 0

  init(numeroFaces:Int){
    self.numeroFaces = numeroFaces
  }

  func row()->Void{
    valorDado = Int.random(in: 1...numeroFaces)
  }

  func row(personagem:Personagem,atributo:Atributo)->Void{
    switch(atributo){
      case Atributo.forca:
      valorModificador = personagem.getMod(numero:personagem.forca)

      case Atributo.destreza:
      valorModificador = personagem.getMod(numero:personagem.destreza)

      case Atributo.inteligencia:
      valorModificador = personagem.getMod(numero:personagem.inteligencia)

      case Atributo.sabedoria:
      valorModificador = personagem.getMod(numero:personagem.sabedoria)

      case Atributo.carisma:
      valorModificador = personagem.getMod(numero:personagem.carisma)

      case Atributo.constituicao:
      valorModificador = personagem.getMod(numero:personagem.constituicao)
    }

    valorDado = Int.random(in:1...numeroFaces)
    total = valorDado + valorModificador
  }

  func row(personagem:Personagem,pericia:Pericias){
    switch(pericia){

      case Pericias.acrobacia:
        calculo(verificacao:personagem.acrobacia,personagem:personagem)
        valorModificador = personagem.getMod(numero:personagem.destreza)
    

    case Pericias.arcanismo:
      calculo(verificacao:personagem.arcanismo,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.inteligencia)
    

    case Pericias.atletismo:
      calculo(verificacao:personagem.atletismo,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.forca)
    

    case Pericias.atuacao:
      calculo(verificacao:personagem.atuacao,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.carisma)
    

    case Pericias.enganacao:
      calculo(verificacao:personagem.enganacao,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.carisma)
    
  
    case Pericias.furtividade:
      calculo(verificacao:personagem.furtividade,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.destreza)
    

    case Pericias.historia:
      calculo(verificacao:personagem.historia,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.inteligencia)
    

    case Pericias.intimidacao:
      calculo(verificacao:personagem.intimidacao,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.carisma)
    
  

    case Pericias.intuicao:
      calculo(verificacao:personagem.intuicao,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.sabedoria)

    case Pericias.investigacao:
      calculo(verificacao:personagem.investigacao,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.inteligencia)

    case Pericias.lidarComAnimais:
      calculo(verificacao:personagem.lidarComAnimais,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.sabedoria)

    case Pericias.meidicina:
      calculo(verificacao:personagem.medicina,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.sabedoria)

    case Pericias.natureza:
      calculo(verificacao:personagem.natureza,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.inteligencia)  

    case Pericias.percepcao:
      calculo(verificacao:personagem.percepcao,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.sabedoria)

    case Pericias.persuasao:
      calculo(verificacao:personagem.persuasao,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.carisma)

    case Pericias.prestigitacao:
        calculo(verificacao:personagem.prestigitacao,personagem:personagem)
        valorModificador = personagem.getMod(numero:personagem.destreza)

    case Pericias.religiao:
        calculo(verificacao:personagem.religiao,personagem:personagem)
        valorModificador = personagem.getMod(numero:personagem.inteligencia)

    case Pericias.sobrevivencia:
        calculo(verificacao:personagem.sobrevivencia,personagem:personagem)
        valorModificador = personagem.getMod(numero:personagem.sabedoria)
  }

  valorDado = Int.random(in: 1...numeroFaces)
  total = valorDado + valorModificador + valorProeficiencia

  }

  func row(personagem:Personagem,resistencia:Resistencia){
    switch resistencia{
      case Resistencia.forca:
        calculo(verificacao:personagem.resistenciaForca,personagem:personagem)

        valorModificador = personagem.getMod(numero:personagem.forca)

      case Resistencia.destreza:
        calculo(verificacao:personagem.resistenciaDestreza,personagem:personagem)

        valorModificador = personagem.getMod(numero:personagem.destreza)

      case Resistencia.sabedoria:
        calculo(verificacao:personagem.resistenciaSabedoria,personagem:personagem)

        valorModificador = personagem.getMod(numero:personagem.sabedoria)

      case Resistencia.inteligencia:
        calculo(verificacao:personagem.resistenciaInteligencia,personagem:personagem)

        valorModificador = personagem.getMod(numero:personagem.inteligencia)

      case Resistencia.carisma:
        calculo(verificacao:personagem.resistenciaCarisma,personagem:personagem)

        valorModificador = personagem.getMod(numero:personagem.carisma)

      case Resistencia.constituicao:
        calculo(verificacao:personagem.resistenciaConstituicao,personagem:personagem)
        
        valorModificador = personagem.getMod(numero:personagem.constituicao)

    }

    valorDado = Int.random(in:1...numeroFaces)
    total = valorDado + valorModificador + valorProeficiencia

  }

  func calculo(verificacao:Bool,personagem:Personagem){
    if(verificacao){
      valorProeficiencia = personagem.proeficiencia
    }else{
      valorProeficiencia = 0
    }

  }
}
