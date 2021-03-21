import SwiftUI

struct MemoryGameView: View {
    
    @ObservedObject var viewModel: MemoryGameViewModel
    
    var body: some View {
        
        Grid(data: viewModel.cardViewModels, columnCount: 2) { cardViewModel in
            CardView(viewModel: cardViewModel)
                .onTapGesture { viewModel.cardViewModelTapped(cardViewModel) }
        }
        .padding()
        .foregroundColor(.green)
    }
}

struct CardView: View {
    
    let viewModel: CardViewModel
    
    private let cornerRadius: CGFloat = 10
    private let strokeWidth: CGFloat = 3
        
    var body: some View {
        GeometryReader() { geometry in
            body(size: geometry.size)
        }
    }
    
    private func body(size: CGSize) -> some View {
        
        ZStack() {
        
            if viewModel.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: strokeWidth)
                
                Text(viewModel.content)
                    .font(Font.system(size: fontSize(for: size)))
            }
            else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }
    }
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static let content = ["🐼", "🐻", "🐷", "🐨"]
    
    static var previews: some View {
        
        let viewModel = MemoryGameViewModel(game: MemoryGame(content: content))
        
        MemoryGameView(viewModel: viewModel)
    }
}
