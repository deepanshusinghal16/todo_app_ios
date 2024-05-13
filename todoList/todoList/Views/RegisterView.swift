
import SwiftUI

struct RegisterView: View {
    
    @StateObject var modelView = RegisterViewViewModel()
    
    var body: some View {
        VStack{
            HeaderView(title: "Register", subtitle: "Start organizing tools", angle: -15, background: .orange)
        }
        
        Form{
            if !modelView.errorMessage.isEmpty{
                Text(modelView.errorMessage)
                    .foregroundColor(.red)
            }
            
            TextField("Full Name",text:$modelView.name)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
            TextField("Email Address",text:$modelView.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
                .autocorrectionDisabled()
            SecureField("Password",text:$modelView.password)
                .textFieldStyle(DefaultTextFieldStyle())
            TLButton(title: "Create Account", background: .green){
//                print("Hello")
                modelView.register()
            }
        }
        .offset(y:-50)
        
        Spacer()
    }
}

#Preview {
    RegisterView()
}
