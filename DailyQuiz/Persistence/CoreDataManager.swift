import CoreData

struct PersistenceManager {
    
    static let shared = PersistenceManager()
    
    static var preview: PersistenceManager = {
        let instance = PersistenceManager(inMemory: true)
        return instance
    }()
    
    let persistentContainer: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        persistentContainer = NSPersistentContainer(name: "DataModel")
        
        if inMemory {
            if let storeDescription = persistentContainer.persistentStoreDescriptions.first {
                storeDescription.url = URL(fileURLWithPath: "/dev/null")
            } else {
                fatalError("No persistent store descriptions available")
            }
        }
        
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        persistentContainer.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Failed to load persistent stores: \(error), \(error.userInfo)")
            }
        }
    }
    
    func fetchEntities<T: NSManagedObject>(ofType type: T.Type, predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil) throws -> [T] {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<T>(entityName: String(describing: T.self))
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sortDescriptors
        
        return try context.fetch(fetchRequest)
    }
    
    func saveEntity<T: NSManagedObject>(_ entity: T) throws {
        let context = persistentContainer.viewContext
        context.insert(entity)
        try saveChanges()
    }
    
    func deleteEntity<T: NSManagedObject>(_ entity: T) throws {
        let context = persistentContainer.viewContext
        context.delete(entity)
        try saveChanges()
    }
    
    func createEntity<T: NSManagedObject>(ofType type: T.Type) -> T {
        let context = persistentContainer.viewContext
        return T(context: context)
    }
    
    func saveChanges() throws {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            try context.save()
        }
    }
}
