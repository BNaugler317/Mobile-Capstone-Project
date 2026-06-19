import Foundation

struct SudokuCellData {
    var value: Int
    var isLocked: Bool
    
    var displayValue: String {
        if value == 0 {
            return ""
        } else {
            return "\(value)"
        }
    }
}
