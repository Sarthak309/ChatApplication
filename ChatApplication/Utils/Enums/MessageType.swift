//
//  MessageType.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 04/10/24.
//

import Foundation
import SwiftUI

enum MessageType:String{
    case text
    case image
    case audio
    case video
    case none
    
    var imageName: String {
        switch self {
        case .text:
            return "checkmark"
        case .image:
            return "photo"
        case .audio:
            return "microphone.fill"
        case .video:
            return "video.fill"
        case .none:
            return "xmark.circle.fill"
        }
    }
}
