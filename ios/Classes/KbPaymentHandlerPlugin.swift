import Flutter
import UIKit

public class KbPaymentHandlerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "kb_payment_handler", binaryMessenger: registrar.messenger())
    let instance = KbPaymentHandlerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformMessage":
      presentNativeController();
      // result("Hello from iOS!")
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func presentNativeController() {
    var rootVC: UIViewController?

    if #available(iOS 13.0, *) {
        rootVC = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }?
            .rootViewController
    } else {
        rootVC = UIApplication.shared.keyWindow?.rootViewController
    }

    guard let viewController = rootVC else {
        print("Unable to access root view controller")
        return
    }

    let controller = MyViewController()
    controller.modalPresentationStyle = .fullScreen
    viewController.present(controller, animated: true, completion: nil)
  }

}

class MyViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .systemBlue

    let label = UILabel()
    label.text = "Hello from Native iOS Controller!"
    label.frame = CGRect(x: 100, y: 300, width: 300, height: 300)
    label.textColor = .white
    label.textAlignment = .center
    label.frame = view.bounds

    view.addSubview(label)

    // Add a dismiss button
    let button = UIButton(type: .system)
    button.setTitle("Close", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.frame = CGRect(x: 100, y: 600, width: 200, height: 50)
    button.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
    view.addSubview(button)
  }

  @objc func dismissSelf() {
    self.dismiss(animated: true, completion: nil)
  }
}
