import Foundation

struct SudokuValidator {
    
    // Static function isValidMove checks to see if a move is valid it checks rows columns and big 3x3 boxes
    static func isValidMove(board: [[SudokuCellData]], row: Int, column: Int, value: Int) -> Bool {
        return isRowValid(board: board, row: row, column: column, value: value)
        && isColumnValid(board: board, row: row, column: column, value: value)
        && isBoxValid(board: board, row: row, column: column, value: value)
    }
    
    // static function isRowValid defines what a valid row should be, a valid row should should have either a blank space 0 or numbers 1 through 9
    static func isRowValid(board: [[SudokuCellData]], row: Int, column: Int, value: Int) -> Bool {
        for currentColumn in 0..<9 {
            if currentColumn != column && board[row][currentColumn].value == value {
                return false
            }
        }
        return true
    }
    
    // static function isColumnValid defines what a valid column should be, a valid column should should have either a blank space 0 or numbers 1 through 9
    static func isColumnValid(board: [[SudokuCellData]], row: Int, column: Int, value: Int) -> Bool {
        for currentRow in 0..<9 {
            if currentRow != row && board[currentRow][column].value == value {
                return false
            }
        }
        return true
    }
    
    // static function isBoxValid defines what a valid big 3x3 should be, a valid big 3x3 should have either a blank space 0 or numbers 1 through 9
    static func isBoxValid(board: [[SudokuCellData]], row: Int, column: Int, value: Int) -> Bool {
        let boxStartRow = (row / 3) * 3
        let boxStartColumn = (column / 3) * 3
        
        for currentRow in boxStartRow..<boxStartRow + 3 {
            for currentColumn in boxStartColumn..<boxStartColumn + 3 {
                
                if currentRow != row || currentColumn != column {
                    if board[currentRow][currentColumn].value == value {
                        return false
                    }
                }
            }
        }
        return true
    }
}
