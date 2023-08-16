//
//  MyPageViewController.swift
//  SNSproject
//
//  Created by 이수현 on 2023/08/14.
//

import UIKit

class MyPageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{

    // 사용자 이름, 프로필 사진, 유저 네임, 자기소개
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var myPageProfileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var bio: UITextView!
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    // 게시물, 팔로워, 팔로잉 숫자
    @IBOutlet weak var postNum: UILabel!
    @IBOutlet weak var followNum: UILabel!
    @IBOutlet weak var followingNum: UILabel!
 
    // 포스트 reverse 하는 코드
    var reversedMyPost: [Post] = myPost.reversed()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(MyPageCollectionViewCell1.self, forCellWithReuseIdentifier: MyPageCollectionViewCell1.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // 사용자 이름, 프로필 사진, 유저 네임, 자기소개 설정
        myPageProfileImage.image = UIImage(named: sampleUser.profilePhoto)
        name.text = sampleUser.name
        userName.text = sampleUser.userName
        bio.text = sampleUser.bio
        
        // 게시물, 팔로워, 팔로잉 숫자 설정
        postNum.text = String(sampleUser.postList.count)
        followNum.text = String(sampleUser.follower)
        followingNum.text = String(sampleUser.following)
        
        // 프로필 이미지를 동그라미로
        myPageProfileImage.layer.cornerRadius = myPageProfileImage.frame.height/2
        bio.isEditable = false
    }
    
    // 프로필 수정 버튼을 눌렀을 때 화면 전환
    @IBAction func myPageEditing(_ sender: Any) {
        
        
    }
    
    
    // 셀 클릭하면 내 포스트 나열되어있는 화면으로 넘어가는 기능
    
    
    @IBAction func editProfileTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "ProfileSB", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ProfileEditVC")
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    // 컬렉션뷰의 셀의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myPost.count
    }
    // 어떤 셀을 보여줄 것인지
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageCollectionViewCell1.identifier, for: indexPath) as! MyPageCollectionViewCell1
        print("Cell has been called")
        cell.imageView.image = UIImage(named: reversedMyPost[indexPath.row].photo) ?? UIImage()
        return cell
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
