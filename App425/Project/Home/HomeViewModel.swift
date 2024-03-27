//
//  HomeViewModel.swift
//  App425
//
//  Created by Вячеслав on 3/27/24.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    @Published var current_tab: String = "Active"
    @Published var tabs: [String] = ["Active", "Not Active"]
    
    @Published var isGraph: Bool = false
    @Published var isAdd: Bool = false
    
    @Published var title: String = ""
    @Published var startDate: Date = Date()
    @Published var endDate: Date = Date()
    @Published var price: String = ""
 
    func addItem() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ItemModel", into: context) as! ItemModel
        
        loan.title = title
        loan.startDate = startDate
        loan.endDate = endDate
        loan.price = Int16(price) ?? 0
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchItems() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ItemModel>(entityName: "ItemModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.items = result
            
        } catch _ as NSError {
            
            self.items = []
        }
    }
}
