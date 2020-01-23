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
        valorModificador = personagem.getMod(numero:personagem.status.forca)

      case Atributo.destreza:
      valorModificador = personagem.getMod(numero:personagem.status.destreza)

      case Atributo.inteligencia:
      valorModificador = personagem.getMod(numero:personagem.status.inteligencia)

      case Atributo.sabedoria:
      valorModificador = personagem.getMod(numero:personagem.status.sabedoria)

      case Atributo.carisma:
      valorModificador = personagem.getMod(numero:personagem.status.carisma)

      case Atributo.constituicao:
      valorModificador = personagem.getMod(numero:personagem.status.constituicao)
    }

    valorDado = Int.random(in:1...numeroFaces)
    total = valorDado + valorModificador
  }

  func row(personagem:Personagem,pericia:Pericias){
    switch(pericia){

      case Pericias.acrobacia:
        calculo(verificacao:personagem.testePericias.acrobacia,personagem:personagem)
        valorModificador = personagem.getMod(numero:personagem.status.destreza)
    

    case Pericias.arcanismo:
      calculo(verificacao:personagem.testePericias.arcanismo,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.status.inteligencia)
    

    case Pericias.atletismo:
      calculo(verificacao:personagem.testePericias.atletismo,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.status.forca)
    

    case Pericias.atuacao:
      calculo(verificacao:personagem.testePericias.atuacao,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.status.carisma)
    

    case Pericias.enganacao:
      calculo(verificacao:personagem.testePericias.enganacao,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.status.carisma)
    
  
    case Pericias.furtividade:
      calculo(verificacao:personagem.testePericias.furtividade,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.status.destreza)
    

    case Pericias.historia:
      calculo(verificacao:personagem.testePericias.historia,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.status.inteligencia)
    

    case Pericias.intimidacao:
      calculo(verificacao:personagem.testePericias.intimidacao,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.status.carisma)
    
  

    case Pericias.intuicao:
      calculo(verificacao:personagem.testePericias.intuicao,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.status.sabedoria)

    case Pericias.investigacao:
      calculo(verificacao:personagem.testePericias.investigacao,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.status.inteligencia)

    case Pericias.lidarComAnimais:
      calculo(verificacao:personagem.testePericias.lidarComAnimais,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.status.sabedoria)

    case Pericias.meidicina:
      calculo(verificacao:personagem.testePericias.medicina,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.status.sabedoria)

    case Pericias.natureza:
      calculo(verificacao:personagem.testePericias.natureza,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.status.inteligencia)

    case Pericias.percepcao:
      calculo(verificacao:personagem.testePericias.percepcao,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.status.sabedoria)

    case Pericias.persuasao:
      calculo(verificacao:personagem.testePericias.persuasao,personagem:personagem)
      valorModificador = personagem.getMod(numero:personagem.status.carisma)

    case Pericias.prestigitacao:
        calculo(verificacao:personagem.testePericias.prestigitacao,personagem:personagem)
        valorModificador = personagem.getMod(numero:personagem.status.destreza)

    case Pericias.religiao:
        calculo(verificacao:personagem.testePericias.religiao,personagem:personagem)
        valorModificador = personagem.getMod(numero:personagem.status.inteligencia)

    case Pericias.sobrevivencia:
        calculo(verificacao:personagem.testePericias.sobrevivencia,personagem:personagem)
        valorModificador = personagem.getMod(numero:personagem.status.sabedoria)
  }

  valorDado = Int.random(in: 1...numeroFaces)
  total = valorDado + valorModificador + valorProeficiencia

  }

  func row(personagem:Personagem,resistencia:Resistencia){
    switch resistencia{
      case Resistencia.forca:
        calculo(verificacao:personagem.testeResistenca.resistenciaForca,personagem:personagem)

        valorModificador = personagem.getMod(numero:personagem.status.forca)

      case Resistencia.destreza:
        calculo(verificacao:personagem.testeResistenca.resistenciaDestreza,personagem:personagem)

        valorModificador = personagem.getMod(numero:personagem.status.destreza)

      case Resistencia.sabedoria:
        calculo(verificacao:personagem.testeResistenca.resistenciaSabedoria,personagem:personagem)

        valorModificador = personagem.getMod(numero:personagem.status.sabedoria)

      case Resistencia.inteligencia:
        calculo(verificacao:personagem.testeResistenca.resistenciaInteligencia,personagem:personagem)

        valorModificador = personagem.getMod(numero:personagem.status.inteligencia)

      case Resistencia.carisma:
        calculo(verificacao:personagem.testeResistenca.resistenciaCarisma,personagem:personagem)

        valorModificador = personagem.getMod(numero:personagem.status.carisma)

      case Resistencia.constituicao:
        calculo(verificacao:personagem.testeResistenca.resistenciaConstituicao,personagem:personagem)
        
        valorModificador = personagem.getMod(numero:personagem.status.constituicao)

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
