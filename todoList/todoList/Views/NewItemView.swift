
import SwiftUI

struct NewItemView: View {
    @StateObject var modelView = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Item")
                .bold()
                .font(.system(size: 32))
                .padding(.top, 100)
            
            Form{
                
                TextField("Title",text: $modelView.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $modelView.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(title: "Save", background: .pink){
                    if modelView.canSave{
                        modelView.save()
                        newItemPresented = false
                    }else{
                        modelView.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $modelView.showAlert) {
                Alert(title: Text("Error"),message: Text("Please fill all details and select due date")
                )
            }
        }
    }
}
    
#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set:{ _ in
    } ))
}

