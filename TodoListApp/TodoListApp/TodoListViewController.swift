

import UIKit

class TodoListViewController: UIViewController {

    
    
//    let todoListViewModel = TodoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // 데이터 불러오기
        
    }
    
}

extension TodoListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
    
    
}

//extension TodoListViewController: UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodoListCell", for: indexPath) as? TodoListCell else {
//            return UICollectionViewCell()
//        }
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        switch kind {
//        case UICollectionView.elementKindSectionHeader:
//            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TodoListHeader", for: indexPath) as? TodoListHeaderView else {
//                return UICollectionReusableView()
//            }
//            guard let section = TodoViewModel.Section(rawValue: indexPath.section) else {
//                return UICollectionReusableView()
//            }
//
//            header.sectionTitleLabel.text = section.title
//            return header
//        default:
//            return UICollectionReusableView()
//        }
//    }
//
//}
//
//extension TodoListViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width: CGFloat = collectionView.bounds.width
//        let height: CGFloat = 50
//        return CGSize(width: width, height: height)
//    }
//}
//
//class TodoListCell: UICollectionViewCell {
//
//    @IBOutlet var checkButton: UIButton!
//    @IBOutlet var descriptionLabel: UILabel!
//    @IBOutlet var deleteButton: UIButton!
//    @IBOutlet weak var strikeThroughView: UIView!
//
//    @IBOutlet weak var strikeThoughWidth: NSLayoutConstraint!
//
//    private func showStrikeThrough(_ show: Bool) {
//        if show {
//            strikeThoughWidth.constant = descriptionLabel.bounds.width
//        } else {
//            strikeThoughWidth.constant = 0
//        }
//    }
//
//
//}
//
//class TodoListHeaderView: UICollectionReusableView {
//
//    @IBOutlet var sectionTitleLabel: UILabel!
//
//}
