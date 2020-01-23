
struct MagiasModel:Decodable{
    var name:String
    var classes:[BasicStruct]
    
    public static func filtrarMagiaPorClasse(magias:[MagiasModel],personagem:Personagem)->[MagiasModel]{
        var retorno:[MagiasModel] = []
        var filtro:String = ""
        switch personagem.classe {
        case .barbaro:
            filtro = "Barbarian"
        case .bardo:
            filtro = "Bard"
        case .bruxo:
            filtro = "Warlock"
        case.clerigo:
            filtro = "Cleric"
        case .druida:
            filtro = "Druid"
        case .feiticeiro:
            filtro = "Sorcerer"
        case .guerreiro:
            filtro = "Fighter"
        case .ladino:
            filtro = "Rogue"
        case .mago:
            filtro = "Wizard"
        case .monge:
            filtro = "Monk"
        case .paladino:
            filtro = "Paladin"
        case .patrulheiro:
            filtro = "Ranger"
        }
        for i in magias{
            for j in i.classes{
                if j.name == filtro{
                    retorno += [i]
                }
            }
        }
        
        return retorno
    }
}
