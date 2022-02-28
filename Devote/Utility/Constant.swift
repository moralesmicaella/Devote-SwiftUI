//
//  Constant.swift
//  Devote
//
//  Created by Micaella Morales on 2/27/22.
//

import SwiftUI

// MARK: - FORMATTER
let itemFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateStyle = .short
  formatter.timeStyle = .medium
  return formatter
}()

// MARK: - UI
let gradientColors: Gradient = Gradient(colors: [Color.pink, Color.blue])
let backgroundGradient: LinearGradient = LinearGradient(gradient: gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing)
