import UIKit

extension UILabel {
    func addTextShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: -8, height: 13)
        self.layer.shadowOpacity = 0.25
        self.layer.shadowRadius = 6
    }
    
    func addRegularShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: -2, height: 3)
        self.layer.shadowOpacity = 0.35
        self.layer.shadowRadius = 1
    }
}
