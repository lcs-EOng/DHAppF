//
//  MenuHistoryView.swift
//  DHApp
//
//  Created by Ong Eason on 6/6/2024.
//

import SwiftUI
import SwiftData


struct BMenu: View {
    //MARK: Stored properties
    @State private var presentingNewItemSheet = false
    @State var searchText = ""
    @State private var meal = 1
    //List of Food Items
    @Query var menus: [MenuItem]
    //Access the model context
    @Environment(\.modelContext) var modelContext
    
    //MARK: Computed properties
    var body: some View{
        NavigationView{
            VStack{
                List{
                    ForEach(menus){ menu in
                        ItemView(currentItem: menu)
                    }
                    .onDelete(perform:  removeRows)
                    
                }
                .searchable(text: $searchText)
                .navigationTitle("Menus")
                .sheet(isPresented: $presentingNewItemSheet) {
                    NewItemView(showSheet: $presentingNewItemSheet)

                }
            }
            .toolbar {
                // Add a button to trigger showing the sheet
                ToolbarItem(placement: .automatic) {
                    Button {
                        presentingNewItemSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
        }
       
    }
    
    
    //    var body: some View {
    //        NavigationView {
    //            List {
    //                ForEach(menus) {item in
    //                    NavigationLink(destination: MenuDetailView(menuDetail: item)) {
    //                        VStack(alignment: .leading) {
    //                            Text("\(formatDate(item.dateOfFood)): \(item.mealType)")
    //                                .font(.headline)
    //                                .font(.headline)
    //                            Text(item.nameOfMeal)
    //                            if item.hasAllergens == true{
    //                                Text("Food has allergens")
    //                            } else
    //                            {
    //                                Text("No allergens")
    //                            }
    //                        }
    //                        .contentShape(Rectangle())
    //                    }
    //                }
    //            }
    //            .searchable(text: $searchText)
    //            .navigationTitle("Menus")
    //            .sheet(isPresented: $presentingNewItemSheet) {
    //                NewItemView(showSheet: $presentingNewItemSheet)
    //
    //            }
    //
    //            .toolbar {
    //                // Add a button to trigger showing the sheet
    //                ToolbarItem(placement: .automatic) {
    //                    Button {
    //                        presentingNewItemSheet = true
    //                    } label: {
    //                        Image(systemName: "plus")
    //                    }
    //
    //                }
    //            }
    //
    //
    //        }
    //    }
    //MARK: Functions
    func removeRows(at offsets: IndexSet) {
        
        // Accept the offset within the list
        // (the position of the item being deleted)
        //
        // Then ask the model context to delete this
        // for us, from the 'todos' array
        for offset in offsets {
            modelContext.delete(menus[offset])
        }
    }
}

    

#Preview {
    BMenu()
        .modelContainer(MenuItem.preview)

}
