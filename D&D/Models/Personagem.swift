class Personagem{
  //MARK: - Caracteristicas geriasi
  var nome:String = ""
  var alinhamento:Alinhamento = Alinhamento.lealBom
  var classe:Classe = Classe.paladino
  var antecedente:Antecedente = Antecedente.nobre
  var raca:Raca = Raca.humano
  var xp:Int = 0
  var proeficiencia:Int = 2
  var idiomas:[String] = []
  var itens:[String] = []
  var po = 0
  var freePoints:Int = 0
  var freeSkill:Int = 0
  var traits:[String] = []
  var habilidadesClasse:[String] = []
  var espacosMagia:EspacosMagia?
  var subclass:Subclasse?
  
  
  //MARK: - Status
  public var forca:Int = 0
  var destreza:Int = 0
  var sabedoria:Int = 0
  var inteligencia:Int = 0
  var carisma:Int = 0
  var constituicao:Int = 0
  var vidaAtual:Int = 0
  var vidaMax:Int = 0
  var armadura:Int = 0
  var magias:[String] = []

  //MARK: - Resistencias
  var resistenciaForca:Bool = false
  var resistenciaDestreza:Bool = false
  var resistenciaInteligencia:Bool = false
  var resistenciaSabedoria:Bool = false
  var resistenciaConstituicao:Bool = false
  var resistenciaCarisma:Bool = false

  //MARK: - Pericias
  var acrobacia:Bool = false
  var arcanismo:Bool = false
  var atletismo:Bool = false
  var atuacao:Bool = false
  var enganacao:Bool = false
  var furtividade:Bool = false
  var historia:Bool = false
  var intimidacao:Bool = false
  var intuicao:Bool = false
  var investigacao:Bool = false
  var lidarComAnimais:Bool = false
  var medicina:Bool = false
  var natureza:Bool = false
  var percepcao:Bool = false
  var persuasao:Bool = false
  var prestigitacao:Bool = false
  var religiao:Bool = false
  var sobrevivencia:Bool = false
  var deslocamento:Float = 0

  //MARK: - proeficiencias



  var proeficiencias:[String] = []



  //MARK: - calcilo de modificadores

  public func getMod(numero:Int)->Int{
    switch(numero){
      case 0,1:
      return -5
      case 2,3:
      return -4
      case 4,5:
      return -3
      case 6,7:
      return -2
      case 8,9:
      return -1
      case 10,11:
      return 0
      case 12,13:
      return 1
      case 14,15:
      return 2
      case 16,17:
      return 3
      case 18,19:
      return 4
      case 20:
      return 5
      default:
      return 0
    }
  }

  func setPersonagem(nome:String,classe:Classe,raca:Raca,antecedente:Antecedente,alinhamento:Alinhamento){
    self.nome = nome
    self.classe = classe
    self.raca = raca
    self.antecedente = antecedente
    self.alinhamento = alinhamento
  }

    
    //MARK: - SetPersonagem 2
    func setPersonagem(forca:Int,destreza:Int,inteligencia:Int,sabedoria:Int,constituicao:Int,carisma:Int,traits:[String],magias:[String]?,classeJson:Class,classeBonusLevelJson:ClasseEspecifica){
        
        for i in classeBonusLevelJson.features{
            self.habilidadesClasse += [i.name]
        }
        
        if let habilidades = classeBonusLevelJson.feature_choices{
            for i in habilidades {
                self.habilidadesClasse += [i.name]
            }
        }
        
        self.espacosMagia = classeBonusLevelJson.spellcasting
        
        self.forca = forca
        self.destreza = destreza
        self.inteligencia = inteligencia
        self.sabedoria = sabedoria
        self.carisma = carisma
        self.constituicao = constituicao
        

        
        self.vidaMax = classeJson.hit_die + getMod(numero: self.constituicao)
        for i in classeJson.proficiencies{
            self.proeficiencias += [i.name]
        }
        
        for i in classeJson.proficiency_choices{
                   for j in i.from{
                       if let pericia: Pericias = Pericias(rawValue: j.name) {
                           print("🧠 \(pericia)")
                       }
                   }
               }
        
        for i in classeJson.proficiency_choices{
            for j in i.from{
                switch(j.name) {
                
                case "Skill: Acrobatics":
                    self.acrobacia = true
                case "Skill: Arcana":
                    self.arcanismo = true
                case "Skill: Athletics":
                    self.atletismo = true
                case "Skill: Performance":
                    self.atuacao = true
                case "Skill: Stealth":
                    self.furtividade = true
                case "Skill: History":
                    self.historia = true
                case "Skill: Animal Handling":
                    self.lidarComAnimais = true
                case "Skill: Deception":
                    self.enganacao = true
                case "Skill: Insight":
                    self.intuicao = true
                case "Skill: Intimidation":
                    self.intimidacao = true
                case "Skill: Investigation":
                    self.investigacao = true
                case "Skill: Medicine":
                    self.medicina = true
                case "Skill: Nature":
                    self.natureza = true
                case "Skill: Perception":
                    self.percepcao = true
                case "Skill: Persuasion":
                    self.persuasao = true
                case "Skill: Religion":
                    self.religiao = true
                case "Skill: Sleight of Hand":
                    self.prestigitacao = true
                case "Skill: Survival":
                    self.sobrevivencia = true
                default:
                    return
                }
            }
        }
        
        for i in classeJson.saving_throws{
            switch(i.name){
                case "CHA":
                    self.resistenciaCarisma = true
                case "CON":
                    self.resistenciaConstituicao = true
                case "DEX":
                    self.resistenciaDestreza = true
                case "INT":
                    self.resistenciaInteligencia = true
                case "STR":
                    self.resistenciaForca = true
                case "WIS":
                    self.resistenciaSabedoria = true
                default:
                    return
                }
        }
        
        

        switch raca{
          case Raca.anaoMontanha:
            self.forca += 2
            self.constituicao += 2
            self.deslocamento = 7.5
          
          case Raca.anaoColina:
            self.sabedoria += 1
            self.constituicao += 2
            self.deslocamento = 7.5
            self.vidaMax += 1
            self.vidaAtual += 1

          case Raca.elfoAlto:
            self.destreza += 2
            self.deslocamento = 9
            self.percepcao = true
            self.inteligencia += 1
            self.proeficiencias += ["Espada Longa","Espada Curta","Arco Curto","Arco Longo"]

            if let spells:[String] = magias {
              self.magias += spells
            }

            //Adcionar truque a proxima função

          case Raca.elfoFloresta:
            self.destreza += 2
            self.deslocamento = 9
            self.percepcao = true
            self.sabedoria += 1
            self.deslocamento = 10.5
            self.traits += ["Mask of the Wild","Flet of Foot"]
            self.proeficiencias += ["Espada Longa","Espada Curta","Arco Curto","Arco Longo"]
            

          case Raca.elfoNegro:
            self.destreza += 2
            self.deslocamento = 9
            self.percepcao = true
            self.carisma += 1
            self.traits += ["Superior Dark Vision","Sunlinght Sentivity", "Drow Magic"]
            self.proeficiencias = ["Rapirs", "Shortswords", "Hand Crossbows"]

            // Adicionar magias no level UP

          case Raca.halflingLeve:
            self.destreza += 2
            self.deslocamento = 7.5
            self.carisma += 1
            self.traits += ["Naturally Stealthy"]


          case Raca.halflingRobusto:
            self.destreza += 2
            self.deslocamento = 7.5
            self.constituicao += 1
            self.traits += ["South Resilience"]

          case Raca.humano:
            self.forca += 1
            self.destreza += 1
            self.carisma += 1
            self.constituicao += 1
            self.sabedoria += 1
            self.inteligencia += 1
            self.deslocamento = 9

          case Raca.draconato:
            self.forca += 2
            self.carisma += 1
            self.deslocamento = 9

          case Raca.gnomoFloresta:
            self.inteligencia += 2
            self.deslocamento = 7.5
            self.destreza += 1
            self.traits += ["Natural illusionnist","Speak With Small Beasts"]

          case Raca.gnomoRocha:
            self.inteligencia += 2
            self.deslocamento = 7.5
            self.constituicao += 1
            self.traits += ["Artficer's Lore","Tinker"]


          case Raca.meioElfo:
            self.carisma += 2
            self.freePoints += 2
            self.freeSkill += 2

          case Raca.meioOrc:
            self.forca += 2
            self.constituicao += 2
            self.intimidacao = true
            
          case Raca.tielfing:
            self.carisma += 2
            self.inteligencia += 2
        }
        self.traits += traits


    }

  func setPersonagem(pericias:[Pericias]){
      for i in pericias{
        switch i{
          case Pericias.acrobacia:
            self.acrobacia = true

          case Pericias.arcanismo:
            self.arcanismo = true

          case Pericias.atletismo:
            self.atletismo = true
            
          case Pericias.atuacao:
            self.atuacao = true

          case Pericias.enganacao:
            self.enganacao = true

          case Pericias.furtividade:
            self.furtividade = true

          case Pericias.historia:
            self.historia = true

          case Pericias.intimidacao:
            self.intimidacao = true

          case Pericias.intuicao:
            self.intuicao = true

          case Pericias.investigacao:
            self.investigacao = true

          case Pericias.lidarComAnimais:
            self.lidarComAnimais = true

          case Pericias.meidicina:
            self.medicina = true

          case Pericias.natureza:
            self.natureza = true

          case Pericias.percepcao:
            self.percepcao = true 

          case Pericias.persuasao:
            self.persuasao = true 

          case Pericias.prestigitacao:
            self.prestigitacao = true

          case Pericias.religiao:
            self.religiao = true

          case Pericias.sobrevivencia:
            self.sobrevivencia = true
        
        }
    }
  }


}
