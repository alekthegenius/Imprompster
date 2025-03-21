//
//  hexColorExtension.swift
//  Imprompster
//
//  Created by Alek Vasek on 3/5/25.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: Int, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
