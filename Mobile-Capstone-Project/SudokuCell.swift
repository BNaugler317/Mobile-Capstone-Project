import SwiftUI

// creates a reusable cell that consists of box and number
struct SudokuCell: View {
    let number: String
    let row: Int
    let column: Int
    let isSelected: Bool
    let isHighlighted: Bool
    let isLocked: Bool
    let isInvalid: Bool
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(backgroundColor)
                .border(Color.black, width: 1)
            
            Text("\(number)")
                .font(.title2)
                .foregroundColor(textColor)
        }
        .frame(width: 40, height: 40)
    }
    
    var backgroundColor: Color {
        
        if isSelected {
            return Color.green.opacity(0.5)
        }
        
        if isHighlighted {
            return Color.yellow.opacity(0.25)
        }
        
        
        return ((row / 3 + column / 3) % 2 == 0)
        ? Color.gray.opacity(0.6)
        : Color.white
    }
    
    var textColor: Color {
        if isInvalid {
            return .red
        }
        
        if isLocked {
            return .black
        }
        
        return .blue
    }
}
