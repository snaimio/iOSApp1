import Foundation

extension Date {
    
    //  Helper function to format dates any way I want
    //  Used this to show dates nicely in the history view
    
    func formatted(as format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    //  Converts date to just year, month, day for comparing
    //  This was tricky, needed a way to check if two dates are the same day
    
    var yearMonthDay: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy MM dd"
        return dateFormatter.string(from: self)
    }
    
    //  Checks if two dates are the same day (ignores time)
    //  Learned this from the professor Doug's example
    
    func isSameDay(as day: Date) -> Bool {
        return self.yearMonthDay == day.yearMonthDay
    }
    
    //  Gets the full name of the day (Monday, Tuesday, etc.)
    
    var dayName: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
