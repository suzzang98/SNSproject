//
//  MyPageViewController.swift
//  SNSproject
//
//  Created by 이수현 on 2023/08/14.
//

import UIKit

class MyPageViewController: UIViewController {

    //프로필 이미지 변수 선언
    @IBOutlet weak var myPageProfileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 프로필 이미지를 동그라미로 만드는 코드
//        myPageProfileImage.layer.cornerRadius = myPageProfileImage.frame.height/2
//        myPageProfileImage.layer.borderWidth = 5
//        myPageProfileImage.clipsToBounds = true
//        myPageProfileImage.layer.borderColor = UIColor.blue.cgColor
        // Do any additional setup after loading the view.
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
