import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer" // bug? back button doesn't get this title all the time
        navigationController?.navigationBar.prefersLargeTitles = true // works for all vc
        
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath! // path for app's bundle
        let items = try! fileManager.contentsOfDirectory(atPath: path) // all items app's bundle

        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        //pictures = pictures.sorted()
        pictures.sort() // sort() is definitely better
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            detailViewController.selectedImage = pictures[indexPath.row]
            detailViewController.selectedImageIndex = indexPath.row + 1
            detailViewController.imagesAvailable = pictures.count
            
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
