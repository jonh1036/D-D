import UIKit
import CoreData

class DataManager: NSObject {
    public static let sharedInstance = DataManager()
    
    override init() {}
    
    private func getContext() -> NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return appDelegate.persistentContainer.viewContext
    }
    
    func retriveAllPersonagens() -> [NSManagedObject]? {
        guard let managedContext = getContext() else { return nil }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PersonagemDataModel")
        
        do {
            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            return result
        } catch let error as NSError{
            return nil
        }
    }
    
    func retrivePersonagem(nome: String) -> NSManagedObject?{
        let result = retriveAllPersonagens()
        
        for i in result as! [NSManagedObject] {
            if i.value(forKey: "nome") as! String == nome {
                return i
            }
        }
        
        return nil
    }
        
    func savePersonagem(_ personagem: PersonagemModel) -> Bool{
        guard let managedContext = getContext() else { return false }
        let entity = NSEntityDescription.entity(forEntityName: "PersonagemDataModel", in: managedContext)!
        let char = NSManagedObject(entity: entity, insertInto: managedContext)
        
        char.setValue(personagem.nome, forKeyPath: "nome")
        char.setValue(personagem.raca, forKeyPath: "raca")
        char.setValue(personagem.classe, forKeyPath: "classe")
        char.setValue(personagem.nivel, forKeyPath: "nivel")
        char.setValue(personagem.xp, forKeyPath: "xp")
        char.setValue(personagem.alinhamento, forKeyPath: "alinhamento")
        char.setValue(personagem.antecedente, forKeyPath: "antecedente")
        char.setValue(personagem.speed, forKeyPath: "speed")
        char.setValue(personagem.pericias, forKeyPath: "pericias")
        char.setValue(personagem.resistencia, forKeyPath: "resistencia")
        char.setValue(personagem.equipamentos, forKeyPath: "equipamentos")
        char.setValue(personagem.magias, forKeyPath: "magias")
        char.setValue(personagem.vida, forKeyPath: "vida")
        char.setValue(personagem.proeficiencia, forKeyPath: "proeficiencia")
        char.setValue(personagem.colete, forKeyPath: "colete")
        char.setValue(personagem.forca, forKeyPath: "forca")
        char.setValue(personagem.inteligencia, forKeyPath: "inteligencia")
        char.setValue(personagem.destreza, forKeyPath: "destreza")
        char.setValue(personagem.constituicao, forKeyPath: "constituicao")
        char.setValue(personagem.carisma, forKeyPath: "carisma")
        char.setValue(personagem.sabedoria, forKeyPath: "sabedoria")
        
        do {
            try managedContext.save()
            return true
        } catch {
            return false
        }
    }
    
    func deleteAll() {
        guard let managedContext = getContext() else { return }
        guard let result = retriveAllPersonagens() else { return }
        
        do {
            for i in result as! [NSManagedObject] {
                managedContext.delete(i)
            }
            
            do {
                try managedContext.save()
            } catch {
                return
            }
        } catch {
            return
        }
    }
}
