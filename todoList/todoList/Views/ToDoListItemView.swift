import SwiftUI

struct ToDoListItemView: View {
    @StateObject var modelView = ToDoListItemViewViewModel()
    let item: ToDoListItem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button{
                modelView.toggleIsDone(item:item)
            }label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
ToDoListItemView(item:.init(
    id: "123",
    title: "Title",
    dueDate: Date().timeIntervalSince1970,
    createdDate: Date().timeIntervalSince1970,
    isDone: false))
}
