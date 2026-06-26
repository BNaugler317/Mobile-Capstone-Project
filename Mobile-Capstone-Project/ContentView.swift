import SwiftUI

struct ContentView: View {
    
    @State private var selectedCell : (row: Int, column: Int)? = nil
    @State private var board = createdBoard()
    @State private var showInvalidMoveAlert = false
    @State private var invalidMoveMessage = ""
    
    func isCellSelected(row: Int, column: Int) -> Bool {
        return selectedCell?.row == row && selectedCell?.column == column
    }
    
    func isCellHighlighted(row: Int, column: Int) -> Bool {
        return selectedCell?.row == row || selectedCell?.column == column
    }
    
    func enterNumber(_ number: Int) {
        guard let selectedCell = selectedCell else { return }
        
        let row = selectedCell.row
        let column = selectedCell.column
        
        if board[row][column].isLocked {
            return
        }
        
        board[row][column].value = number
        
        if SudokuValidator.isValidMove(
            board: board,
            row: row,
            column: column,
            value: number
        ) {
            board[row][column].isInvalid = false
        } else {
            board[row][column].isInvalid = true
            invalidMoveMessage = "Invalid move. This number already exists in the same row, column or 3x3 box."
            showInvalidMoveAlert = true
        }
    }
        var body: some View {
            VStack(spacing: 20) {
                VStack {
                    HStack {
                        ForEach(1...4, id: \.self) { number in
                            Button("\(number)") {
                                enterNumber(number)
                            }
                        }
                    }
                    
                    HStack {
                        ForEach(5...9, id: \.self) { number in
                            Button("\(number)") {
                                enterNumber(number)
                            }
                        }
                    }
                }
                VStack(spacing: 0) {
                    // this ForEach loop repates the HStack 9 times vertically
                    ForEach(0..<9, id: \.self) { row in
                        // HStack arranges 9 boxes in a row via a ForEach loop
                        HStack(spacing: 0) {
                            ForEach(0..<9) { column in
                                
                                SudokuCell(
                                    number: board[row][column].displayValue,
                                    row: row,
                                    column: column,
                                    isSelected: isCellSelected(row: row, column: column),
                                    isHighlighted: isCellHighlighted(row: row, column: column),
                                    isLocked: board[row][column].isLocked,
                                    isInvalid: board[row][column].isInvalid
                                )
                                .onTapGesture {
                                    if !board[row][column].isLocked {
                                        selectedCell = (row, column)
                                    }
                                }
                            }
                            
                        }
                        
                    }
                }
                .overlay(
                    SudokuGridLines()
                )
            }
            .alert("Invalid Move", isPresented: $showInvalidMoveAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(invalidMoveMessage)
            }
        }
        
    }
    
struct SudokuGridLines: View {
    var body: some View {
        ZStack {
            Rectangle()
                .stroke(Color.black, lineWidth: 3)
            
            Rectangle()
                .fill(Color.black)
                .frame(width: 3)
                .offset(x: -60)
            
            Rectangle()
                .fill(Color.black)
                .frame(width: 3)
                .offset(x: 60)
            
            Rectangle()
                .fill(Color.black)
                .frame(height: 3)
                .offset(y: -60)
            
            Rectangle()
                .fill(Color.black)
                .frame(height: 3)
                .offset(y: 60)
        }
    }
}

#Preview {
    ContentView()
}
