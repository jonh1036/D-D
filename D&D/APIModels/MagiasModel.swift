
struct MagiasModel: Decodable{
    var name: String
    var classes:[BasicStruct]
    
    public static func filtrarMagiaPorClasse(magias: [MagiasModel], personagem: Personagem)->[MagiasModel]{
        var retorno: [MagiasModel] = []
        let filtro: String = personagem.classe.rawValue
     
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