import Foundation
import UIKit
import CoreData

class CoreDataManager {

    static let shared = CoreDataManager()

    let context = (UIApplication.shared.delegate as! AppDelegate)
        .persistentContainer.viewContext

    // MARK: Save Watch
    func saveWatch(watch: HomeViewController.Watch) -> WatchEntity {

        let entity = WatchEntity(context: context)

        entity.name = watch.name
        entity.price = watch.price
        entity.image = watch.image
        entity.category = watch.category
        entity.watchdescription = watch.description

        try? context.save()

        return entity
    }

    // MARK: Fetch Watches
    func fetchWatches() -> [NSManagedObject] {

        let request = NSFetchRequest<NSManagedObject>(entityName: "WatchEntity")

        do {
            return try context.fetch(request)
        } catch {
            print("❌ Fetch error: \(error)")
            return []
        }
    }
}
