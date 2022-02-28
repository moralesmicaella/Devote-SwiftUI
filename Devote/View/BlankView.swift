//
//  BlankView.swift
//  Devote
//
//  Created by Micaella Morales on 2/27/22.
//

import SwiftUI

struct BlankView: View {
  // MARK: - PROPERTY
  var backgroundColor: Color
  var backgroundOpacity: Double
  
  // MARK: - BODY
  var body: some View {
    VStack {
      Spacer()
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    .background(backgroundColor)
    .opacity(backgroundOpacity)
    .blendMode(.overlay)
  }
}

// MARK: - PREVIEW
struct BlankView_Previews: PreviewProvider {
  static var previews: some View {
    BlankView(backgroundColor: .black, backgroundOpacity: 0.3)
      .background(BackgroundImageView())
      .background(backgroundGradient.ignoresSafeArea())
  }
}
