import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var lableCounter: UILabel!
    @IBOutlet private weak var textChanges: UITextView!
    @IBOutlet private weak var buttonReset: UIButton!
    @IBOutlet private weak var buttonMinus: UIButton!
    @IBOutlet private weak var buttonPlus: UIButton!
    
    private var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textChanges.isEditable = false
    }
    
    private func addToChanges(_ message: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let dateStr = dateFormatter.string(from: Date())
        let newText = "\n[\(dateStr)]: \(message)"
        textChanges.text += newText
        scrollToBottom()
    }
    
    private func scrollToBottom() {
        let bottom = NSMakeRange(textChanges.text.count - 1, 1)
        textChanges.scrollRangeToVisible(bottom)
    }
    
    @IBAction private func buttonResetAction(_ sender: Any) {
        count = 0
        lableCounter.text = "Значение счетчика: \(count)"
        addToChanges("значение сброшено")
    }
    
    @IBAction private func buttonMinusAction(_ sender: Any) {
        if count > 0 {
            count -= 1
            addToChanges("значение изменено на -1")
            lableCounter.text = "Значение счетчика: \(count)"
        } else {
            addToChanges("попытка уменьшить значение счётчика ниже 0")
            lableCounter.text = "Значение счетчика: \(count)"
        }
    }
    
    @IBAction private func buttonPlusAction(_ sender: Any) {
        count += 1
        addToChanges("значение изменено на +1")
        lableCounter.text = "Значение счетчика: \(count)"
    }
}

