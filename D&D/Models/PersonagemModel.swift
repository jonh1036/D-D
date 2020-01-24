import Foundation
import CoreData

class PersonagemModel: Codable {
    var nome: String = ""
    var raca: String = ""
    var classe: String = ""
    var nivel: Int32 = 0
    var xp: Int32 = 0
    var alinhamento: String = ""
    var antecedente: String = ""
    var speed: Int32 = 0
    var pericias: [String] = []
    var resistencia: [String] = []
    var equipamentos: [String] = []
    var magias: [String] = []
    var vida: Int32 = 0
    var proeficiencia: Int32 = 0
    var colete: Int32 = 0
    var forca: Int32 = 0
    var inteligencia: Int32 = 0
    var destreza: Int32 = 0
    var constituicao: Int32 = 0
    var carisma: Int32 = 0
    var sabedoria: Int32 = 0
}

extension PersonagemModel {
    
}
