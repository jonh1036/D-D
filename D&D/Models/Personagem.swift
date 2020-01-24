//MARK: - Caracteristicas gerais
class Personagem{
    var nome:String = ""
    var alinhamento: Alinhamento = .CaoticoBom
    var classe: Classe = .Paladino
    var antecedente: Antecedente = .Nobre
    var raca: Raca = .Humano
    var proeficiencia:Int = 2
    var idiomas:[String] = []
    var itens:[String] = []
    var po = 0
    var freePoints:Int = 0
    var freeSkill:Int = 0
    var traits:[String] = []
    var habilidadesClasse:[String] = []
    var espacosMagia: EspacosMagia?
    
    //MARK: - Status
    var status:Status = Status()
    
    //MARK: - Magias
    var magias:[String] = []
    
    //MARK: - Resistencias
    var testeResistenca:TesteResistencia = TesteResistencia()
    
    //MARK: - Pericias
    var testePericias:TestePericias = TestePericias()
    
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
    
    //MARK: - atrubuir satatus ao personagem
    func setPersonagem(status:Status){
        self.status = status
    }
    
    //MARK: - SetPersonagem (1)
    func setPersonagem(nome:String,classe:Classe,raca:Raca,antecedente:Antecedente,alinhamento:Alinhamento){
        self.nome = nome
        self.classe = classe
        self.raca = raca
        self.antecedente = antecedente
        self.alinhamento = alinhamento
    }
    
    //MARK: - Adicionar Bonus de classe
    func setBonusClasse(classeBonusLevelJson:ClasseEspecifica){
        for i in classeBonusLevelJson.features{
            self.habilidadesClasse += [i.name]
        }
        if let habilidades = classeBonusLevelJson.feature_choices{
            for i in habilidades {
                self.habilidadesClasse += [i.name]
            }
        }
        self.espacosMagia = classeBonusLevelJson.spellcasting
    }
    
    //MARK: - Adcionar Pericias e proeficiencias
    func setPericias(classeJson:Class){
        
//        for i in classeJson.proficiency_choices{
//            for j in i.from{
//                if let pericia: Pericias = Pericias(rawValue: j.name) {
//                    print("🧠 \(pericia)")
//                }
//            }
//        }
        
        for i in classeJson.proficiencies{
            self.proeficiencias += [i.name]
        }
        
        for i in classeJson.proficiency_choices{
            for j in i.from{
                switch(j.name) {
                    
                case "Skill: Acrobatics":
                    self.testePericias.acrobacia = true
                case "Skill: Arcana":
                    self.testePericias.arcanismo = true
                case "Skill: Athletics":
                    self.testePericias.atletismo = true
                case "Skill: Performance":
                    self.testePericias.atuacao = true
                case "Skill: Stealth":
                    self.testePericias.furtividade = true
                case "Skill: History":
                    self.testePericias.historia = true
                case "Skill: Animal Handling":
                    self.testePericias.lidarComAnimais = true
                case "Skill: Deception":
                    self.testePericias.enganacao = true
                case "Skill: Insight":
                    self.testePericias.intuicao = true
                case "Skill: Intimidation":
                    self.testePericias.intimidacao = true
                case "Skill: Investigation":
                    self.testePericias.investigacao = true
                case "Skill: Medicine":
                    self.testePericias.medicina = true
                case "Skill: Nature":
                    self.testePericias.natureza = true
                case "Skill: Perception":
                    self.testePericias.percepcao = true
                case "Skill: Persuasion":
                    self.testePericias.persuasao = true
                case "Skill: Religion":
                    self.testePericias.religiao = true
                case "Skill: Sleight of Hand":
                    self.testePericias.prestigitacao = true
                case "Skill: Survival":
                    self.testePericias.sobrevivencia = true
                default:
                    return
                }
            }
        }
        
    }
    
    //MARK: - Adicionar testes de resistencia
    
    func setResistencias(classeJson:Class){
        for i in classeJson.saving_throws{
            switch(i.name){
            case "CHA":
                self.testeResistenca.resistenciaCarisma = true
            case "CON":
                self.testeResistenca.resistenciaConstituicao = true
            case "DEX":
                self.testeResistenca.resistenciaDestreza = true
            case "INT":
                self.testeResistenca.resistenciaInteligencia = true
            case "STR":
                self.testeResistenca.resistenciaForca = true
            case "WIS":
                self.testeResistenca.resistenciaSabedoria = true
            default:
                return
            }
        }
    }
    
    //MARK: - Adcionar Bonus de Raça
    
    func setRaca(raca:String){
        switch raca{
        case Raca.AnaoMontanha.rawValue:
                self.status.forca += 2
                self.status.constituicao += 2
                self.status.deslocamento = 7.5
                
            case Raca.AnaoColina.rawValue:
                self.status.sabedoria += 1
                self.status.constituicao += 2
                self.status.deslocamento = 7.5
                self.status.vidaMax += 1
                self.status.vida += 1
                
            case Raca.ElfoAlto.rawValue:
                self.status.destreza += 2
                self.status.deslocamento = 9
                self.testePericias.percepcao = true
                self.status.inteligencia += 1
                self.proeficiencias += ["Espada Longa","Espada Curta","Arco Curto","Arco Longo"]
                
                if let spells:[String] = magias {
                    self.magias += spells
                }
                
                //Adcionar truque a proxima função
            case Raca.ElfoFloresta.rawValue:
                self.status.destreza += 2
                self.status.deslocamento = 9
                self.testePericias.percepcao = true
                self.status.sabedoria += 1
                self.status.deslocamento = 10.5
                self.traits += ["Mask of the Wild","Flet of Foot"]
                self.proeficiencias += ["Espada Longa","Espada Curta","Arco Curto","Arco Longo"]
                
                
            case Raca.ElfoNegro.rawValue:
                self.status.destreza += 2
                self.status.deslocamento = 9
                self.testePericias.percepcao = true
                self.status.carisma += 1
                self.traits += ["Superior Dark Vision","Sunlinght Sentivity", "Drow Magic"]
                self.proeficiencias = ["Rapirs", "Shortswords", "Hand Crossbows"]
                
                // Adicionar magias no level UP
                
            case Raca.HalflingLeve.rawValue:
                self.status.destreza += 2
                self.status.deslocamento = 7.5
                self.status.carisma += 1
                self.traits += ["Naturally Stealthy"]
                
                
            case Raca.HalflingRobusto.rawValue:
                self.status.destreza += 2
                self.status.deslocamento = 7.5
                self.status.constituicao += 1
                self.traits += ["South Resilience"]
                
            case Raca.Humano.rawValue:
                self.status.forca += 1
                self.status.destreza += 1
                self.status.carisma += 1
                self.status.constituicao += 1
                self.status.sabedoria += 1
                self.status.inteligencia += 1
                self.status.deslocamento = 9
                
            case Raca.Draconato.rawValue:
                self.status.forca += 2
                self.status.carisma += 1
                self.status.deslocamento = 9
                
            case Raca.GnomoFloresta.rawValue:
                self.status.inteligencia += 2
                self.status.deslocamento = 7.5
                self.status.destreza += 1
                self.traits += ["Natural illusionnist","Speak With Small Beasts"]
                
            case Raca.GnomoRocha.rawValue:
                self.status.inteligencia += 2
                self.status.deslocamento = 7.5
                self.status.constituicao += 1
                self.traits += ["Artficer's Lore","Tinker"]
                
            case Raca.MeioElfo.rawValue:
                self.status.carisma += 2
                self.freePoints += 2
                self.freeSkill += 2
                
            case Raca.MeioOrc.rawValue:
                self.status.forca += 2
                self.status.constituicao += 2
                self.testePericias.intimidacao = true
                
            case Raca.Tielfing.rawValue:
                self.status.carisma += 2
                self.status.inteligencia += 2
        default:
            return 
        }
    }
    
    //MARK: - Adiconar Magias
    
    func setMagias(magias:[String]?){
        guard let magias = magias else {return}
        self.magias += magias
    }
    //MARK: - Adicionar pericias
    func setPersonagem(pericias:[Pericias]){
        for i in pericias{
            switch i{
            case Pericias.acrobacia:
                self.testePericias.acrobacia = true
                
            case Pericias.arcanismo:
                self.testePericias.arcanismo = true
                
            case Pericias.atletismo:
                self.testePericias.atletismo = true
                
            case Pericias.atuacao:
                self.testePericias.atuacao = true
                
            case Pericias.enganacao:
                self.testePericias.enganacao = true
                
            case Pericias.furtividade:
                self.testePericias.furtividade = true
                
            case Pericias.historia:
                self.testePericias.historia = true
                
            case Pericias.intimidacao:
                self.testePericias.intimidacao = true
                
            case Pericias.intuicao:
                self.testePericias.intuicao = true
                
            case Pericias.investigacao:
                self.testePericias.investigacao = true
                
            case Pericias.lidarComAnimais:
                self.testePericias.lidarComAnimais = true
                
            case Pericias.meidicina:
                self.testePericias.medicina = true
                
            case Pericias.natureza:
                self.testePericias.natureza = true
                
            case Pericias.percepcao:
                self.testePericias.percepcao = true
                
            case Pericias.persuasao:
                self.testePericias.persuasao = true
                
            case Pericias.prestigitacao:
                self.testePericias.prestigitacao = true
                
            case Pericias.religiao:
                self.testePericias.religiao = true
                
            case Pericias.sobrevivencia:
                self.testePericias.sobrevivencia = true
                
            }
        }
    }
    //MARK: - SetPersonagem (2)
    func setPersonagem(status:Status,classeJson:Class,classeBonusLevelJson:ClasseEspecifica){
        self.setPersonagem(status: status)
        self.setBonusClasse(classeBonusLevelJson: classeBonusLevelJson)
        self.setPericias(classeJson: classeJson)
        self.setResistencias(classeJson: classeJson)
//        self.setBonusRaca(magias: magias)
//        self.traits += traits
        self.setMagias(magias: magias)
    }
    
    func setStatus(forca:Int,destreza:Int,sabedoria:Int,inteligencia:Int,carisma:Int,constituicao:Int) -> Status{
        var status:Status = Status()
        status.forca = forca
        status.destreza = destreza
        status.inteligencia = inteligencia
        status.sabedoria = sabedoria
        status.carisma = carisma
        status.constituicao = constituicao
        self.status = status
        return status
    }
    

}
