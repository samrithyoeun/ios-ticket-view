//
//  TornTicketView.swift
//  EVoucherApp
//
//  Created by Samrith Yoeun on 05.04.2023.
//

import UIKit

class TornTicketView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        drawTicket(y: self.frame.height , height: 24)
    }
    
    private func drawTicket(y: CGFloat, height: CGFloat) {
        let ticketShapeLayer = CAShapeLayer()
        ticketShapeLayer.frame = self.bounds
        ticketShapeLayer.fillColor = UIColor.white.cgColor

        let ticketShapePath = UIBezierPath(roundedRect: ticketShapeLayer.bounds, cornerRadius: 0)

        let topLeftArcPath = UIBezierPath(arcCenter: CGPoint(x: 0, y: y),
                                          radius: height / 2,
                                          startAngle: .pi * 2,
                                          endAngle: CGFloat(Double.pi) * 1.5,
                                          clockwise: false)
        topLeftArcPath.addLine(to: CGPoint(x: 0 , y: y))

        topLeftArcPath.close()
        
        let topRightArcPath = UIBezierPath(arcCenter: CGPoint(x: ticketShapeLayer.frame.width, y: y),
                                           radius: height / 2,
                                           startAngle: .pi,
                                           endAngle: .pi * 1.5 ,
                                           clockwise: true)
        topRightArcPath.addLine(to: CGPoint(x: ticketShapeLayer.frame.width, y: y))
        topRightArcPath.close()
        
        ticketShapePath.append(topLeftArcPath)
        ticketShapePath.append(topRightArcPath.reversing())
        ticketShapeLayer.path = ticketShapePath.cgPath
        
        layer.addSublayer(ticketShapeLayer)
        
        drawDashLine(ticketShapeLayer, paddingX: (height), y: y - 2)
        
        // Add elevation
        layer.shadowColor = UIColor.systemGray.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 2, height: 1)

        
        clipsToBounds = true
        layer.cornerRadius = 8
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
}
