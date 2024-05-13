
import FirebaseAuth
import FirebaseFirestore
import Foundation
class ToDoListItemViewViewModel : ObservableObject{
    
    init() {}
    
    func toggleIsDone(item:ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
}
