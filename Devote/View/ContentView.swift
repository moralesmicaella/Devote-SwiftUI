//
//  ContentView.swift
//  Devote
//
//  Created by Micaella Morales on 2/26/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
  // MARK: - PROPERTY
  @Environment(\.managedObjectContext) private var viewContext
  
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
    animation: .default)
  private var items: FetchedResults<Item>
  
  @AppStorage("isDarkMode") private var isDarkMode: Bool = false
  
  @State private var task: String = ""
  @State var showNewTaskItem: Bool = false
  
  // MARK: - FUNCTION
  private func deleteItems(offsets: IndexSet) {
    withAnimation {
      offsets.map { items[$0] }.forEach(viewContext.delete)
      
      do {
        try viewContext.save()
      } catch {
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }
  
  // MARK: - BODY
  var body: some View {
    NavigationView {
      ZStack {
        // MARK: - MAIN VIEW
        VStack {
          // MARK: - HEADER
          HStack(spacing: 10) {
            Text("Devote")
              .font(.system(.largeTitle, design: .rounded))
              .fontWeight(.heavy)
              .padding(.leading, 4)
            
            Spacer()
            
            EditButton()
              .buttonStyle(.plain)
              .font(.system(size: 16, weight: .semibold, design: .rounded))
              .padding(.horizontal, 10)
              .frame(minWidth: 70, minHeight: 24)
              .background(Capsule().stroke(Color.white, lineWidth: 2))
            
            Button(action: {
              isDarkMode.toggle()
            }) {
              Image(systemName: isDarkMode ? "moon.circle.fill" : "moon.circle")
                .resizable()
                .frame(width: 24, height: 24)
                .font(.system(.title, design: .rounded))
            }
          }
          .buttonStyle(.plain)
          .padding()
          .foregroundColor(.white)
          
          Spacer(minLength: 80)
          
          // MARK: - NEW TASK BUTTON
          Button(action: {
            showNewTaskItem = true
          }) {
            Image(systemName: "plus.circle")
              .font(.system(size: 30, weight: .semibold, design: .rounded))
            Text("New Task")
              .font(.system(size: 24, weight: .bold, design: .rounded))
          }
          .buttonStyle(.plain)
          .foregroundColor(.white)
          .padding(.horizontal, 20)
          .padding(.vertical, 15)
          .background(
            LinearGradient(gradient: gradientColors, startPoint: .leading, endPoint: .trailing)
              .clipShape(Capsule())
          )
          .shadow(color: .black.opacity(0.25), radius: 8, x: 0, y: 4)
          
          
          // MARK: - TASKS
          List {
            ForEach(items) { item in
              ListRowItemView(item: item)
            }
            .onDelete(perform: deleteItems)
          } //: LIST
          .shadow(color: .black.opacity(0.3), radius: 12)
          .padding(.vertical, 0)
          .frame(maxWidth: 640)
        } //: VSTACK
        .blur(radius: showNewTaskItem ? 8 : 0, opaque: false)
        .transition(.move(edge: .bottom))
        .animation(.easeOut(duration: 0.5), value: showNewTaskItem)
        
        // MARK: - NEW TASK ITEM
        if showNewTaskItem {
          BlankView(
            backgroundColor: isDarkMode ? .black : .gray,
            backgroundOpacity: isDarkMode ? 0.3 : 0.5
          )
            .onTapGesture {
              withAnimation {
                hideKeyboard()
                showNewTaskItem = false
              }
            }
    
          NewTaskItemView(isShowing: $showNewTaskItem)
            .transition(.move(edge: .bottom).combined(with: .opacity))
        }
      } //: ZSTACK
      .onAppear(perform: {
        UITableView.appearance().backgroundColor = UIColor.clear
      })
      .navigationBarHidden(true)
      .background(
        BackgroundImageView()
          .blur(radius: showNewTaskItem ? 8 : 0, opaque: false)
      )
      .background(backgroundGradient.ignoresSafeArea())
    } //: NAVIGATION VIEW
    .navigationViewStyle(.stack)
  }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
  }
}
