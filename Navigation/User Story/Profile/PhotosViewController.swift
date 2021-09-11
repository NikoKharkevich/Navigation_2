
import UIKit
import StorageService
import iOSIntPackage

class PhotosViewController: UIViewController, ImageLibrarySubscriber {
    func receive(images: [UIImage]) {
        self.imageArray = images
        collectionView.reloadData()
    }
    
    private let imagePublisher = ImagePublisherFacade()
    private var imageArray = [UIImage]()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white

        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Photo Gallery"
        navigationController?.navigationBar.topItem?.title = "Back"
        
        self.imagePublisher.subscribe(self)
        self.imagePublisher.addImagesWithTimer(time: 1, repeat: 10)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.navigationBar.isHidden = true
    }
}

private extension PhotosViewController {
    func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.toAutoLayout()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PhotosCollectionViewCell.self))
        
        let constraints = [
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

// MARK: UICollectionViewDataSource
extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return photoCollectionArray.count
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as! PhotosCollectionViewCell
        cell.backgroundColor = .red
//        cell.cellImage.image = photoCollectionArray[indexPath.row]
        cell.cellImage.image = imageArray[indexPath.row]
        
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       return baseInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: baseInset, left: baseInset, bottom: .zero, right: baseInset)
    }
    
}

//MARK: Cell Insets
extension PhotosViewController {
    private var baseInset: CGFloat { return 8 }
    
//    space between cells in row
    private var sectionInset: CGFloat { return 8 }
    
//    method for calculating cell width
    private func widthForCell(with collectionVoew: UICollectionView, cellsInRow: Int) -> CGFloat {
        let totalInset: CGFloat = baseInset * CGFloat(cellsInRow - 1)
        let sideInset: CGFloat = sectionInset * 2
        let cellWidth = (collectionView.frame.width - totalInset - sideInset) / CGFloat(cellsInRow)
        return cellWidth
    }
    
//    setting required number of cells in row here
    private var cellWidth: CGFloat {
        return widthForCell(with: collectionView, cellsInRow: 3)
    }
}
