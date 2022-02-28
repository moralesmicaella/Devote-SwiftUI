//
//  BlankView.swift
//  Devote
//
//  Created by Micaella Morales on 2/27/22.
//

import SwiftUI

struct BlankView: View {
  var body: some View {
    VStack {
      Spacer()
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    .background(Color.black)
    .opacity(0.65)
  }
}

struct BlankView_Previews: PreviewProvider {
  static var previews: some View {
    BlankView()
  }
}
