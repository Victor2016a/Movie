//
//  String+Extensions.swift
//  Rest API
//
//  Created by Victor Vieira on 17/02/22.
//

import Foundation

func convertDateFormater(_ date: String?) -> String {
  var fixDate = ""
  let dateFormatter = DateFormatter()
  dateFormatter.dateFormat = "yyyy-MM-dd"
  if let originalDate = date {
    if let newDate = dateFormatter.date(from: originalDate){
      dateFormatter.dateFormat = "dd.MM.yyyy"
      fixDate = dateFormatter.string(from: newDate)
    }
  }
  return fixDate
}
