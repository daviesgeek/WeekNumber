//
//  Preferences.swift
//  WeekNumber
//
//  Created by Matthew Davies on 10/30/17.
//  Copyright © 2017 Matthew Davies. All rights reserved.
//

import Foundation
class Preferences {

  static func getShowYear() -> Bool {
    return UserDefaults.standard.bool(forKey: "showYear");
  }

  static func setShowYear(_ showYear: Bool) {
    UserDefaults.standard.set(showYear, forKey: "showYear");
  }

  static func getYearFormat() -> String {
    return "YY";
  }

  static func getWeekFormat() -> String {
    return "w";
  }

}
