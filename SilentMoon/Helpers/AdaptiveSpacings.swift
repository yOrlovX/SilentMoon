//
//  AdaptivePaddings.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 19.06.2023.
//

import UIKit

struct SignUpViewAdaptiveSpacing {
  
 static var spacing: CGFloat {
    if UIScreen.main.bounds.height > 667 {
      return 35
    } else {
      return 15
    }
  }
}

struct RemindersViewAdaptiveSpacing {
  
 static var spacing: CGFloat {
    if UIScreen.main.bounds.height > 667 {
      return 40
    } else {
      return 10
    }
  }
}
