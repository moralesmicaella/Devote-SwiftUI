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

