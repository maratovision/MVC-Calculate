
import UIKit

class Viewer: UIViewController {
    
    var controller: Controller?
    var mathSign: Bool = false
    
    @IBOutlet weak var resultLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        controller = Controller(viewer: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true {
            resultLabel.text?.append(" " + String(sender.tag))
            mathSign = false
        }
        else{
            resultLabel.text?.append(String(sender.tag))
        }
    }
    
    
    @IBAction func clearTouched(_ sender: UIButton) {
        if resultLabel.text != "" {
            resultLabel.text = ""
        }
    }
    
    @IBAction func mathTouched(_ sender: UIButton) {
        if resultLabel.text != ""{
            if sender.tag == 14{
                resultLabel.text?.append(" +")
            }
            else if sender.tag == 11{
                resultLabel.text?.append(" /")
            }
            else if sender.tag == 12{
                resultLabel.text?.append(" *")
            }
            else if sender.tag == 13{
                resultLabel.text?.append(" -")
            }
            mathSign = true
        }
    }
    
    @IBAction func equalTouched(_ sender: UIButton) {
        controller?.calculating()
    }
    
    public func updateResultLabel(text: String) {
        resultLabel.text = text
    }
}
