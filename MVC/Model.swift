class Model {
    
    private let viewer: Viewer
    private let rpn: ReversePolishNotation
    
    init(viewer: Viewer) {
        self.viewer = viewer
        rpn = ReversePolishNotation()
    }
    
    public func RPNCalculating() {
        let answer: String = rpn.calculate(expression: viewer.resultLabel.text ?? "")
        viewer.updateResultLabel(text: answer)
    }
}
