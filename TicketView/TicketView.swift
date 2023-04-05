//
//  TicketView.swift
//  EVoucherApp
//
//  Created by Samrith Yoeun on 04.04.2023.
//

import UIKit

class TicketView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        layer.cornerRadius = 8
    }
    
    override func layoutSubviews() {
        drawTicket(y: self.frame.height * 0.645, height: 24)
    }
    
    private func drawTicket(y: CGFloat, height: CGFloat) {
        let ticketShapeLayer = CAShapeLayer()
        ticketShapeLayer.frame = self.bounds
        ticketShapeLayer.fillColor = UIColor.white.cgColor

        let ticketShapePath = UIBezierPath(roundedRect: ticketShapeLayer.bounds, cornerRadius: 8)

        let topLeftArcPath = UIBezierPath(arcCenter: CGPoint(x: 0, y: y),
                                          radius: height / 2,
                                          startAngle:  CGFloat(Double.pi / 2),
                                          endAngle: CGFloat(Double.pi + Double.pi / 2),
                                          clockwise: false)
        topLeftArcPath.close()
        
        let topRightArcPath = UIBezierPath(arcCenter: CGPoint(x: ticketShapeLayer.frame.width, y: y),
                                           radius: height / 2,
                                           startAngle:  CGFloat(Double.pi / 2),
                                           endAngle: CGFloat(Double.pi + Double.pi / 2),
                                           clockwise: true)
        topRightArcPath.close()
        
        ticketShapePath.append(topLeftArcPath)
        ticketShapePath.append(topRightArcPath.reversing())
        ticketShapeLayer.path = ticketShapePath.cgPath
        
        layer.addSublayer(ticketShapeLayer)
        
        drawDashLine(ticketShapeLayer, paddingX: (height), y: y)
        
        // Add elevation
        layer.shadowColor = UIColor.systemGray.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 2, height: 1)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
}


extension UIView {
    func setShadowOffset() {
        layer.shadowRadius = 4
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        clipsToBounds = false
    }
    
    func drawDashLine(_ ticketShapeLayer: CAShapeLayer, paddingX: CGFloat, y: CGFloat) {
        let lineDashPatterns: [[NSNumber]?]  = [[4, 4, 4, 4]]
        
        for (_, lineDashPattern) in lineDashPatterns.enumerated() {
            
            let shapeLayer = CAShapeLayer()
            shapeLayer.strokeColor = UIColor.gray.withAlphaComponent(1).cgColor
            shapeLayer.lineWidth = 1
            shapeLayer.lineDashPattern = lineDashPattern
            
            let path = CGMutablePath()
            path.addLines(between: [CGPoint(x: paddingX, y: y), CGPoint(x: ticketShapeLayer.frame.width - paddingX, y: y)])
            
            shapeLayer.path = path
            layer.addSublayer(shapeLayer)
        }
    }
    
    
    
}

