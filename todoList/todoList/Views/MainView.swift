import SwiftUI

struct MainView: View {
    
    @StateObject var modelView = MainViewViewModel()
    
    var body: some View {
        if modelView.isSignedIn, !modelView.currUserId.isEmpty{
            accountView
        }else{
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View{
        TabView{
            ToDoListView(userId:modelView.currUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
            
        }
    }
}

#Preview {
    MainView()
}
