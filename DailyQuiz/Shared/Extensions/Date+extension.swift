import Foundation

extension Date {
    func formattedWithoutYearIfCurrent(locale: Locale = Locale(identifier: "ru_RU")) -> String {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: self)
        let currentYear = calendar.component(.year, from: Date())

        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.setLocalizedDateFormatFromTemplate(year == currentYear ? "d MMMM" : "d MMMM yyyy")
        
        return formatter.string(from: self)
    }

    func formattedTime(locale: Locale = Locale(identifier: "ru_RU")) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.locale = locale
        return formatter.string(from: self)
    }
}

