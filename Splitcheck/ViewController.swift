import SwiftUI

class ViewController: UIViewController {

  let titleLabel: UILabel = {
    $0.text = "Total Bill"
    $0.textColor = .black
    $0.font = UIFont(name: "Avenir Next Bold", size: 40)
    $0.textAlignment = .center
    return $0
  }(UILabel())
  
  let logoImageView: UIImageView = {
    $0.contentMode = .scaleAspectFit
    return $0
  }(UIImageView(image: UIImage(named: "enot")))
  
  let descriptionLabel: UILabel = {
    $0.text = "Enter the invoice amount and click \"Calculate\""
    $0.textColor = .black
    $0.font = UIFont(name: "Avenir Next Bold", size: 15)
    $0.textAlignment = .center
    $0.adjustsFontSizeToFitWidth = true
    return $0
  }(UILabel())
  
  let totalBillView = CustomTextField()
  
  let personsView = PersonsView()
  
  let tipsView = TipsView()
  
  lazy var calculateButton: UIButton = {
    $0.setTitle("Calculate", for: .normal)
    $0.tintColor = .white
    $0.titleLabel?.font = UIFont(name: "Avenir Next", size: 30)
    $0.backgroundColor = #colorLiteral(red: 0.639077723, green: 0.2492567599, blue: 0.6254395843, alpha: 1)
    $0.layer.cornerRadius = 10
    $0.addTarget(self, action: #selector(calculateTapped), for: .primaryActionTriggered)
    return $0
  }(UIButton(type: .system))
  
  let spacer = UIView()
  
  lazy var stack: UIStackView = {
    $0.axis = .vertical
    $0.alignment = .fill
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UIStackView(arrangedSubviews: [titleLabel, logoImageView, descriptionLabel, totalBillView, personsView, tipsView, calculateButton, spacer]))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setConstraints()
  }

  func setupViews() {
    view.backgroundColor = #colorLiteral(red: 0.9813271165, green: 0.9813271165, blue: 0.9813271165, alpha: 1) //F9F9F9
    view.addSubview(stack)
    let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  
  @objc func calculateTapped() {
    if let text = totalBillView.textField.text,
    let total = Double(text),
       personsView.count > 0,
       let selected = tipsView.selected {
      let withTips = total * (1.0 + Double(tipsView.tips[selected]) / 100.0)
      let result = withTips / Double(personsView.count)
      let alert = UIAlertController(title: "Alert", message: "\(result) per person", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
          switch action.style{
              case .default:
              print("default")
              
              case .cancel:
              print("cancel")
              
              case .destructive:
              print("destructive")
              
          @unknown default:
            print("@unknown")
          }
      }))
      self.present(alert, animated: true, completion: nil)
    }
  }
  
  @objc func hideKeyboard() {
    view.endEditing(true)
  }
}

extension ViewController {
  func setConstraints() {
    NSLayoutConstraint.activate([
      stack.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
      stack.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 1),
      view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor, multiplier: 1),
      view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: stack.bottomAnchor, multiplier: 1),
      
      logoImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
      
      calculateButton.heightAnchor.constraint(equalToConstant: 60)
    ])
  }
}

struct SwiftUIController: UIViewControllerRepresentable {
  typealias UIViewControllerType = ViewController
  
  func makeUIViewController(context: Context) -> UIViewControllerType {
    let viewController = UIViewControllerType()
    return viewController
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
  }
}

struct SwiftUIController_Previews: PreviewProvider {
  static var previews: some View {
    SwiftUIController()
      .edgesIgnoringSafeArea(.all)
  }
}
