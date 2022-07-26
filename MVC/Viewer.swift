
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
        resultLabel.text = ""
    }
    
    
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true {
            resultLabel.text! += String(sender.tag) + " "
            mathSign = false
        }
        else{
            resultLabel.text = resultLabel.text! + String(sender.tag)
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
                resultLabel.text! += " + "
            }
            else if sender.tag == 11{
                resultLabel.text! += " / "
            }
            else if sender.tag == 12{
                resultLabel.text! += " x "
            }
            else if sender.tag == 13{
                resultLabel.text! += " - "
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
