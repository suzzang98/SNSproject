//
//  MyPageViewController.swift
//  SNSproject
//
//  Created by 이수현 on 2023/08/14.
//

import UIKit

class MyPageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet var collectionView: UICollectionView!
    
    var posts = PostRepository.shared.getAllPosts()
    
    var user = UserInfoRepository.shared
    // 포스트 reverse 하는 코드
    var reversedMyPost: [Post] = PostRepository.shared.getAllPosts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(MyPageCollectionViewCell1.self, forCellWithReuseIdentifier: MyPageCollectionViewCell1.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    
    // 컬렉션뷰의 셀의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reversedMyPost.count
    }
    // 어떤 셀을 보여줄 것인지
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageCollectionViewCell1.identifier, for: indexPath) as! MyPageCollectionViewCell1
        print("Cell has been called")
        cell.imageView.image = UIImage(named: reversedMyPost[indexPath.row].photo) ?? UIImage()
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        //ofKind에 UICollectionView.elementKindSectionHeader로 헤더를 설정해주고
        //withReuseIdentifier에 헤더뷰 identifier를 넣어주고
        //생성한 헤더뷰로 캐스팅해준다.
        
        
        let headerview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! MyPageCollectionReusableView
        
        headerview.delegate = self
        
        headerview.myPageProfileImage.image = UIImage(named: user.profilePhoto)
        headerview.name.text = user.name
        headerview.userName.text = user.userName
        headerview.bio.text = user.bio
        headerview.bio.isEditable = false

        // 게시물, 팔로워, 팔로잉 숫자 설정
        headerview.postNum.text = String(posts.count)
        headerview.followNum.text = String(user.follower)
        headerview.followingNum.text = String(user.following)

        // 프로필 이미지를 동그라미로
        headerview.myPageProfileImage.layer.cornerRadius = headerview.myPageProfileImage.frame.height/2


        return headerview

    }
}

// 3칸씩 그리드 맞추는 코드
extension MyPageViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {

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

extension MyPageViewController: myPageCollectionReusableViewDelegate {
    func profileShareTapped() {
        let alert = UIAlertController(title:"프로필 공유",
            message: "프로필이 공유되었습니다.",
            preferredStyle: UIAlertController.Style.alert)
        //2. 확인 버튼 만들기
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        //3. 확인 버튼을 경고창에 추가하기
        alert.addAction(ok)
        //4. 경고창 보이기
        present(alert,animated: true,completion: nil)
    }
    
    func postTapped() {
        print("postTapped")
    }
    
    func profileTapped() {
        let storyBoard = UIStoryboard(name: StoryBoardID.profile, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ProfileEditVC")
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
