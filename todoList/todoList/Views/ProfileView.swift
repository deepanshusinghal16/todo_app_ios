import SwiftUI

struct ProfileView: View {
    @StateObject var modelView = ProfileViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                
                if let user = modelView.user{
                    profile(user: user)
                }else{
                    Text("Loading Profile...")
                }
                
                
            }
            .navigationTitle("My Profile")
        }
        .onAppear{
            modelView.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View{
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .frame(width: 125, height: 125)
            .padding()
        
        
        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding(2)
            
            HStack{
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding(2)

            
            HStack{
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding(2)

            
        }
        .padding()
        
        Button("Log Out"){
            modelView.logout()
        }
        .tint(.red)
        .padding()
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
