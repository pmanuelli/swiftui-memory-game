import SwiftUI

struct Grid<Data, Content>: View where Data : RandomAccessCollection,
                                       Data.Element : Identifiable,
                                       Content : View {
    
    private let data: Data
    private let columnCount: Int
    private let content: (Data.Element) -> Content
    
    private let columnSpacing: CGFloat = 10
    private let rowSpacing: CGFloat = 10
    
    init(data: Data, columnCount: Int, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.columnCount = columnCount
        self.content = content
    }
    
    var body: some View {
    
        GeometryReader() { geometry in
            body(size: geometry.size)
        }
    }
    
    private func body(size: CGSize) -> some View {
        
        let height = size.height
        
        let itemCount = CGFloat(data.count)
        let rowCount: CGFloat = ceil(itemCount / CGFloat(columnCount))
        let itemHeight = (height - rowSpacing * (rowCount - 1))/rowCount
        
        let gridItem = GridItem(.flexible(), spacing: columnSpacing)
        let columnItems = Array(repeating: gridItem, count: columnCount)
        
        return LazyVGrid(columns: columnItems, alignment: .center, spacing: rowSpacing) {
            
            ForEach(data) { element in
                content(element)
                    .frame(height: itemHeight)
            }
        }
    }
}

func ceil(_ x: CGFloat) -> CGFloat {
    return CGFloat(ceil(Double(x)))
}
