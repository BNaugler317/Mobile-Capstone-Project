
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            // this ForEach loop repates the HStack 9 times vertically
            ForEach(0..<9, id: \.self) { row in
                // HStack arranges 9 boxes in a row via a ForEach loop
                HStack(spacing: 0) {
                    ForEach(0..<9) { column in
                        SudokuCell(number: "\(column + 1)",
                                   row: row, column: column)
                    }
                    
                }
                
            }
        }
        .overlay(
            SudokuGridLines()
        )
    }
        
}
    

// creates a reusable cell that consists of box and number
struct SudokuCell: View {
    
    let number: String
    let row: Int
    let column: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    ((row / 3 + column / 3) % 2 == 0)
                    ? Color.gray.opacity(0.6)
                    : Color.white
                )
                .border(Color.black, width: 1)
            
            Text(number)
                .font(.largeTitle)
                .foregroundColor(.black)
                
        }
        .frame(width: 40, height: 40)
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
