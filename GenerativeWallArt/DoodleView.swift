
import Combine
import SwiftUI
import UIKit

struct DoodleView: View {
    @Environment(ViewModel.self) private var viewModel
    @State private var image: UIImage? = nil
    @State private var showShareSheet = false
    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
        VStack {
            DrawingShapeView()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(15)
                .padding()
            
            Button("Done") {
                dismissWindow(id: "doodle_canvas")
                viewModel.flowState = .projectileFlying
            }
            Spacer()
        }
    }
}

struct DrawingShapeView: UIViewRepresentable {
    func makeUIView(context: Context) -> DrawingView {
        let view = DrawingView()
        return view
    }
    
    func updateUIView(_ uiView: DrawingView, context: Context) {}
}

class DrawingView: UIView {
    private var path = UIBezierPath()
    private var strokeWidth: CGFloat = 5.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        path.lineWidth = strokeWidth
        backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        UIColor.black.setStroke()
        path.stroke()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        path.move(to: touch.location(in: self))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        path.addLine(to: touch.location(in: self))
        setNeedsDisplay()
    }
}
