enum Alinhamento: String{
    case LealBom = "Leal Bom"
    case LealNeutro = "Leal Neutro"
    case LealMau = "Leal Mau"
    case NeutroBom = "Neutro Bom"
    case Neutro = "Neutro"
    case CaoticoBom = "Caótico Bom"
    case CaoticoNeutro = "Caótico Neutro"
    case CaoticoMau = "Caótico Mau"
    
    static let all = [
        LealBom,
        LealMau,
        LealNeutro,
        NeutroBom,
        Neutro,
        CaoticoBom,
        CaoticoNeutro,
        CaoticoMau
    ]
}
