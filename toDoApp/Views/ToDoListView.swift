import SwiftUI
import FirebaseFirestore

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    @State private var selectedItem: ToDoListItem? = nil
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/toDos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .onTapGesture {
                            selectedItem = item
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.yellow)
                            .fontWeight(.semibold)
                    }
                }
            }
        }
        // Yeni item ekleme sheet'i
        .sheet(isPresented: $viewModel.showingNewItemView) {
            NewItemView(
                isPresented: $viewModel.showingNewItemView,
                viewModel: NewItemViewViewModel()
            )
        }
        // Düzenleme sheet'i
        .sheet(item: $selectedItem) { item in
            NewItemView(
                isPresented: Binding(
                    get: { selectedItem != nil },
                    set: { if !$0 { selectedItem = nil } }
                ),
                viewModel: NewItemViewViewModel(item: item)
            )
        }
    }
}

#Preview {
    ToDoListView(userId: "vqq0zfEWdvfHoMgm1sNBI983caP2")
}
