//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Micaella Morales on 2/27/22.
//

import SwiftUI

struct NewTaskItemView: View {
  // MARK: - PROPERTY
  @Environment(\.managedObjectContext) private var viewContext
  @State private var task: String = ""
  @Binding var isShowing: Bool
  
  private var isButtonDisabled: Bool {
    return task.isEmpty
  }
  
  // MARK: - FUNCTION
  private func addItem() {
    withAnimation {
      let newItem = Item(context: viewContext)
      newItem.id = UUID()
      newItem.task = task
      newItem.completion = false
      newItem.timestamp = Date()
      
      do {
        try viewContext.save()
      } catch {
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
      
      task = ""
      hideKeyboard()
      isShowing = false
    }
  }
  
  // MARK: - BODY
  var body: some View {
    VStack {
      Spacer()
      
      VStack(spacing: 16) {
        TextField("New Task", text: $task)
          .foregroundColor(.pink)
          .font(.system(size: 24, weight: .bold, design: .rounded))
          .padding()
          .background(
            Color("textFieldColor")
          )
          .cornerRadius(10)
        
        Button(action: addItem) {
          Spacer()
          Text("SAVE")
            .font(.system(size: 24, weight: .bold, design: .rounded))
          Spacer()
        }
        .buttonStyle(.plain)
        .disabled(isButtonDisabled)
        .padding()
        .foregroundColor(.white)
        .background(
          Color.pink
            .opacity(isButtonDisabled ? 0.5 : 1.0)
        )
        .cornerRadius(10)
      } //: VStack
      .padding(.horizontal)
      .padding(.vertical, 20)
      .background(Color("popUpColor"))
      .cornerRadius(16)
      .shadow(color: .black.opacity(0.65), radius: 24)
      .frame(maxWidth: 640)
    } //: VSTACK
    .padding()
  }
}

// MARK: - PREVIEW
struct NewTaskItemView_Previews: PreviewProvider {
  static var previews: some View {
    NewTaskItemView(isShowing: .constant(true))
      .background(Color.gray.ignoresSafeArea())
  }
}
