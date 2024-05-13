
import FirebaseFirestore
import Foundation
class ToDoListViewViewModel : ObservableObject{
    
    private let userId : String
    
    init(userId:String) {
        self.userId = userId
    }
    @Published var showNewItemView = false
    
    func delete(id:String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
