import SwiftUI

class MemoryGameViewModel: ObservableObject {
    
    private let game: MemoryGame<String>
    
    @Published var cardViewModels: [CardViewModel]
    
    init(game: MemoryGame<String>) {
        self.game = game
        self.cardViewModels = game.cards.map { CardViewModel(card: $0) }
    }
    
    func cardViewModelTapped(_ viewModel: CardViewModel) {
        game.cardTapped(id: viewModel.id)
        
        cardViewModels = game.cards.map { CardViewModel(card: $0) }
    }
}

class CardViewModel: Identifiable {
        
    var id: UUID
    var isFaceUp: Bool
    var content: String
    
    init(card: MemoryGame<String>.Card) {
        self.id = card.id
        self.isFaceUp = card.isFaceUp
        self.content = card.content
    }
}
