import Foundation

struct Card: Equatable {

    let quantity : Variant
    let shape : Variant
    let color : Variant
    let background : Variant
    
    enum Variant: Int, CustomStringConvertible {
        case v1 = 1
        case v2
        case v3
        
        static var all: [Variant]{return [.v1, .v2, .v3]}
        var description: String {return String(self.rawValue)}
        var idx: Int {return (self.rawValue - 1)}
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.quantity == rhs.quantity &&
                lhs.shape == rhs.shape &&
                lhs.color == rhs.color &&
                lhs.background == rhs.background
    }
    
}
