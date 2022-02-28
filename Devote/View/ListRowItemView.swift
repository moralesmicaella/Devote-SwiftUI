//
//  ListRowItemView.swift
//  Devote
//
//  Created by Micaella Morales on 2/28/22.
//

import SwiftUI

struct ListRowItemView: View {
  @Environment(\.managedObjectContext) private var viewContext
  @ObservedObject var item: Item
  
  var body: some View {
    withAnimation {
      Toggle(isOn: $item.completion) {
        Text(item.task ?? "")
          .font(.system(.title2, design: .rounded))
          .fontWeight(.heavy)
          .foregroundColor(item.completion ? .pink : .primary)
          .padding(.vertical, 12)
      } //: TOGGLE
      .toggleStyle(CheckboxStyle())
      .onReceive(item.objectWillChange) { _ in
        if viewContext.hasChanges {
          do {
            try viewContext.save()
          } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
          }
        }
      }
    }
  }
}
