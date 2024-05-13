import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    private func validate() -> Bool{
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else{
            errorMessage = "Please fill all the details"
            return false
        }
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Enter a valid email address"
            return false
        }
        guard password.count >= 6 else{
            errorMessage = "Enter a strong password"
            return false
        }
        return true
    }
    
    private func insertUserInRecord(id: String){
        let newUser = User(
            id: id,
            name: name,
            email: email,
            joined: Date().timeIntervalSince1970
        )
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    func register(){
        guard validate() else   {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){
           [weak self] result,error in
            
            guard let userId  = result?.user.uid else{
                print("Error in unid id")
                return
            }
            self?.insertUserInRecord(id: userId)
        }
    }
}
