//
//  StatusMenuController.swift
//  WeekNumber
//
//  Created by Matthew Davies on 10/20/17.
//  Copyright © 2017 Matthew Davies. All rights reserved.
//

import Foundation
import Cocoa

class StatusMenuController: NSObject {

  @IBOutlet weak var statusMenu: NSMenu!
  @IBOutlet weak var showYear: NSMenuItem!
  @IBOutlet weak var weekItem: NSMenuItem!

  let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

  override func awakeFromNib() {
    statusItem.menu = statusMenu
    setTitle()
    showYear.state = Preferences.getShowYear() ? .on : .off
    registerDateObserver()
  }

  @objc func setTitle() {
    print("setting title")
    var titleString = ""
    if(Preferences.getShowYear()) {
      titleString += self.getCurrentYear() + "."
    }
    titleString += self.getCurrentWeek()
    statusItem.title = titleString
    weekItem.title = "Week \(self.getCurrentWeek()) of "
  }

  func getCurrentWeek() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = Preferences.getWeekFormat()
    return dateFormatter.string(from: Date())
  }

  func getCurrentYear() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = Preferences.getYearFormat()
    return dateFormatter.string(from: Date());
  }

  @IBAction func toggleShowYear(_ sender: Any) {
    let showYearPreference = !Preferences.getShowYear()
    Preferences.setShowYear(showYearPreference)
    showYear.state = showYearPreference ? .on : .off
    setTitle()
  }

  @IBAction func quit(_ sender: Any) {
    NSApplication.shared.terminate(self)
  }

  func registerDateObserver() {
//    Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setTitle), userInfo: nil, repeats: true)
    NotificationCenter.default.addObserver(self, selector: #selector(setTitle), name: .NSCalendarDayChanged, object: nil)
  }

}
