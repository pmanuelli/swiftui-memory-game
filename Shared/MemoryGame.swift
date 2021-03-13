import Foundation

class MemoryGame<Content> {
    
    var cards: [Card]
    
    init(content: [Content]) {
        self.cards = content.map { Card(isFaceUp: false, content: $0) }
    }
    
    func cardTapped(id: UUID) {
        guard let index = cards.firstIndex(where: { $0.id == id }) else { return }
        
        cards[index] = cards[index].tapped()
    }
    
    struct Card {
        let id = UUID()
        let isFaceUp: Bool
        let content: Content
        
        func tapped() -> Card {
            Card(isFaceUp: !isFaceUp, content: content)
        }
    }
}
