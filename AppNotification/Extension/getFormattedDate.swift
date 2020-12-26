//
//  getFormattedDate.swift
//  AppNotification
//
//  Created by namit on 26/12/2020.
//
import Foundation

extension String {
    func convertDateString() -> String? {
        return convert(dateString: self, fromDateFormat: "yyyy-MM-dd'T'HH:mm:ssZ", toDateFormat: "yyyy-MM-dd")
    }
    func convert(dateString: String, fromDateFormat: String, toDateFormat: String) -> String? {

        let fromDateFormatter = DateFormatter()
        fromDateFormatter.dateFormat = fromDateFormat

        if let fromDateObject = fromDateFormatter.date(from: dateString) {

            let toDateFormatter = DateFormatter()
            toDateFormatter.dateFormat = toDateFormat

            let newDateString = toDateFormatter.string(from: fromDateObject)
            return newDateString
        }

        return nil
    }

}
