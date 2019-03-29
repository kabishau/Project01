import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImage: String?
    var selectedImageIndex: Int?
    var imagesAvailable: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // optional to optional - no need to upwrap
        if let selectedImageIndex = selectedImageIndex, let imagesAvailable = imagesAvailable {
            title = "Picture \(selectedImageIndex) of \(imagesAvailable)"
        } else {
            title = selectedImage
            
        }
        
        navigationItem.largeTitleDisplayMode = .never // customization of specific vc, !!! navigationItem
        
        if let selectedImage = selectedImage {
            imageView.image = UIImage(named: selectedImage)
        }
    }
    
    // this allows to keep this functionality only for DetailViewController
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
