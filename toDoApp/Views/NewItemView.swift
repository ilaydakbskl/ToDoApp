import SwiftUI

struct NewItemView: View {
    @Binding var isPresented: Bool
    @StateObject var viewModel: NewItemViewViewModel
    @FocusState private var isTextEditorFocused: Bool
    
    // İki farklı init methodu
    init(newItemPresented: Binding<Bool>) {
        self._isPresented = newItemPresented
        self._viewModel = StateObject(wrappedValue: NewItemViewViewModel())
    }
    
    init(isPresented: Binding<Bool>, viewModel: NewItemViewViewModel) {
        self._isPresented = isPresented
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    // Text Editor Section
                    Section {
                        HStack {
                            if viewModel.text.isEmpty && !isTextEditorFocused {
                                Text("Note")
                                    .foregroundStyle(.gray.opacity(0.5))
                                    .frame(alignment: .leading)
                            }
                            TextEditor(text: $viewModel.text)
                                .focused($isTextEditorFocused)
                        }
                    }
                    
                    // Date Picker Section
                    Section {
                        DatePicker("End Date", selection: $viewModel.date, displayedComponents: [.date])
                            .tint(.yellow.opacity(0.5))
                            .datePickerStyle(.graphical)
                    }
                    
                    // Save/Update Button Section
                    Section {
                        Button {
                            if viewModel.canSave {
                                viewModel.save()
                                isPresented = false
                            } else {
                                viewModel.showAlert = true
                            }
                        } label: {
                            Text(viewModel.isEditing ? "Update" : "Save")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.yellow)
                                .cornerRadius(10)
                        }
                    }
                }
            }
            .navigationTitle(viewModel.isEditing ? "Edit Note" : "New Note")
            .navigationBarItems(
                leading: Button("Cancel") {
                    isPresented = false
                }
            )
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please check the accuracy of the data!"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: { return true }, set: { _ in }))
}
