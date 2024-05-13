import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            
            VStack{
                //Header
                HeaderView(title: "To Do List", subtitle: "Get things Done", angle: 15, background: .pink)
                
                //LoginForm
                
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address",text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Enter password",text:$viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log In", background: .blue){
                        viewModel.login()
                    }
                }
                .offset(y:-50)
                
                //Create a/c
                VStack{
                    Text("New here ?")
                    NavigationLink("Create an Account", destination: RegisterView())
                }
                .padding(.bottom,50)
                
                Spacer()
            }
            
        }
    }
}

#Preview {
    LoginView()
}
