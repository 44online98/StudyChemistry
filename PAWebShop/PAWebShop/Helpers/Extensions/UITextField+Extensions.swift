import UIKit

// MARK: - Properties

extension UITextField {
    public typealias TextFieldConfig = (UITextField) -> Swift.Void
    
    public func config(textField configurate: TextFieldConfig?) {
        configurate?(self)
    }
    
    func left(image: UIImage?, color: UIColor = .black) {
        if let image = image {
            leftViewMode = UITextFieldViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextFieldViewMode.never
            leftView = nil
        }
    }
    
    func right(image: UIImage?, color: UIColor = .black) {
        if let image = image {
            rightViewMode = UITextFieldViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
            imageView.tintColor = color
            rightView = imageView
        } else {
            rightViewMode = UITextFieldViewMode.never
            rightView = nil
        }
    }
    
    func rightButton(showText: String, hideText: String) {

        let textSize = showText.size(withAttributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14)])
        let rightButton = Button.init(frame: CGRect.init(x: 0, y: 0, width: textSize.width, height: self.height))
        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        rightButton.setTitle(showText, for: .normal)
        rightButton.setTitleColor(UIColor.lightGray, for: .normal)
        rightButton.action { (button) in
            let isFirstResponder = self.isFirstResponder
            // set resignFirstResponder
            if (isFirstResponder) {
                self.resignFirstResponder()
            }
            // set isSecureTextEntry
            if (self.isSecureTextEntry) {
                self.isSecureTextEntry = false
                button.setTitle(hideText, for: .normal)
            } else {
                self.isSecureTextEntry = true
                button.setTitle(showText, for: .normal)
            }
            // set isFirstResponder
            if (isFirstResponder) {
                self.becomeFirstResponder()
            }
        }
        self.rightView = rightButton
        self.rightViewMode = .always
    }
}

// MARK: - Methods

public extension UITextField {
    
    /// Set placeholder text color.
    ///
    /// - Parameter color: placeholder text color.
    public func setPlaceHolderTextColor(_ color: UIColor) {
        self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: color])
    }
    
    /// Set placeholder text and its color
    func placeholder(text value: String, color: UIColor = .red) {
        self.attributedPlaceholder = NSAttributedString(string: value, attributes: [ NSAttributedStringKey.foregroundColor : color])
    }
}
