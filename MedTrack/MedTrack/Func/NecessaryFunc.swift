
import Foundation

func saveContext() {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    if context.hasChanges {
        do {
            try context.save()
        } catch {
            // Обробка помилки збереження
        }
    }
}

func fetchVaccinations() -> [Vaccination] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let fetchRequest: NSFetchRequest<Vaccination> = Vaccination.fetchRequest()
    do {
        return try context.fetch(fetchRequest)
    } catch {
        // Обробка помилки завантаження
        return []
    }
}

