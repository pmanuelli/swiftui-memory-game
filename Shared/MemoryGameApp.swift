import SwiftUI

@main
struct MemoryGameApp: App {
    var body: some Scene {
        WindowGroup {
            
            let content = ["🐼", "🐻", "🐷", "🐨"]
            let game = MemoryGame(content: content)
            MemoryGameView(viewModel: MemoryGameViewModel(game: game))
        }
    }
}
