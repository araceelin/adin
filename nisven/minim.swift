import CoreGraphics
import UIKit // For CGPoint

struct Path {
    private var elements: [PathElement] = []
    
    enum PathElement {
        case moveTo(CGPoint)
        case lineTo(CGPoint)
        case arc(center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, transform: CGAffineTransform)
    }

    public mutating func addRelativeArc(center: CGPoint, radius: CGFloat, startAngle: Angle, delta: Angle, transform: CGAffineTransform = .identity) {
        let startAngleInRadians = startAngle.radians
        let deltaInRadians = delta.radians
        
        let endAngleInRadians = startAngleInRadians + deltaInRadians

        let arcElement = PathElement.arc(center: center, radius: radius, startAngle: startAngleInRadians, endAngle: endAngleInRadians, transform: transform)
        elements.append(arcElement)
    }
    
    // Additional methods to handle path drawing, etc.
}

struct Angle {
    var radians: CGFloat
    
    init(degrees: CGFloat) {
        self.radians = degrees * .pi / 180
    }
    
    init(radians: CGFloat) {
        self.radians = radians
    }
}

// Example usage
var path = Path()
let center = CGPoint(x: 50, y: 50)
let radius: CGFloat = 25
let startAngle = Angle(degrees: 0)
let delta = Angle(degrees: 90)

path.addRelativeArc(center: center, radius: radius, startAngle: startAngle, delta: delta)
