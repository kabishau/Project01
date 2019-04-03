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
        
        // BarButtonItem for sharing the image
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharedTapped))
        
    }
    
    @objc func sharedTapped() {
        // this allows to unwrap image and convert to jpg and be able to use it later as activity item
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8), let selectedImage = selectedImage else {
            print("No image found")
            return
        }
        let text = "I'm sharing the \(selectedImage) image"
        let activityViewController = UIActivityViewController(activityItems: [image, text], applicationActivities: [])
        // to make it not crush on iPad
        activityViewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        print("works")
        present(activityViewController, animated: true, completion: nil)
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
