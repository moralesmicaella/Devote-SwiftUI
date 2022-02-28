//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Micaella Morales on 2/27/22.
//

import SwiftUI

struct BackgroundImageView: View {
  var body: some View {
    Image("rocket")
      .antialiased(true)
      .resizable()
      .scaledToFill()
      .ignoresSafeArea()
  }
}

struct BackgroundImageView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundImageView()
  }
}
