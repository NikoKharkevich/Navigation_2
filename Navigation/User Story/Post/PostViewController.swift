
import UIKit
import StorageService

class PostViewController: UIViewController {
    
    var post: StorageService.Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = post?.title
    }
}
