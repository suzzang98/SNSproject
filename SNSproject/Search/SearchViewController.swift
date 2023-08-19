//
//  SearchViewController.swift
//  SNSproject
//
//  Created by 이수현 on 2023/08/18.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCollectionView.register(SearchCell.self, forCellWithReuseIdentifier: SearchCell.identifier)
//        searchCollectionView.register(SearchCollectionReusableView.self, forCellWithReuseIdentifier: "SearchCollectionReusableView")
        // 컴퓨터가 자동 설정하는 것을 막아줌
        if let flowlayout = searchCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
        flowlayout.estimatedItemSize = .zero
        }
        searchCollectionView.dataSource = self
        searchCollectionView.delegate = self

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        searchCollectionView.register(SearchCell.self, forCellWithReuseIdentifier: SearchCell.identifier)
        let cell = searchCollectionView.dequeueReusableCell(withReuseIdentifier: SearchCell.identifier, for: indexPath) as! SearchCell
        
        let item = searchImage[indexPath.row]
        DispatchQueue.main.async {
            cell.imageView.image = UIImage(named: item) ?? UIImage()
        }
        

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let headerview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SearchCollectionReusableView", for: indexPath) as! SearchCollectionReusableView
        return headerview

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// 3칸씩 그리드 맞추는 코드
extension SearchViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
//            let interItemSpacing: CGFloat = 10
//            let padding: CGFloat = 16
//            let width = (searchCollectionView.bounds.width - interItemSpacing * 3 - padding * 2) / 3
//            print(width)
//            let height = width * 1.5
//            return CGSize(width: width, height: height)
            let interval:CGFloat = 3
            let width: CGFloat = ( UIScreen.main.bounds.width - interval * 2 ) / 3

            return CGSize(width: width , height: width )
    }

    //2
    func collectionView(_ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 3
    }

    //3
    func collectionView(_ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 3
    }
}
