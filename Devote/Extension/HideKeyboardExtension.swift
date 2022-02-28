//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by Micaella Morales on 2/27/22.
//

import SwiftUI

#if canImport(UIKit)
extension View {
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
#endif
