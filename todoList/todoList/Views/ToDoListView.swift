
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var modelView : ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String){
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._modelView = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                modelView.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    modelView.showNewItemView = true
                }label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $modelView.showNewItemView) {
                NewItemView(newItemPresented: $modelView.showNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "A4ergFzxk9Qha0x6VhASNQaxkxl1")
}
