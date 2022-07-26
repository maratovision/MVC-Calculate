class Controller {
    
    let model: Model
    
    init(viewer: Viewer) {
        model = Model(viewer: viewer)
    }
    
    func calculating() {
        model.RPNCalculating()
    }
}
