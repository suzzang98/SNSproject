//
//  TabbarController.swift
//  SNSproject
//
//  Created by 장가겸 on 8/17/23.
//

import Foundation
import UIKit
import YPImagePicker

class TabbarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
}
    
    extension TabbarController {
        override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        }
        func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            if let index = viewControllers?.firstIndex(of: viewController) {
                if index == 1 {
                   onProfileChangeBtnClicked()
                    return false
                }
            }
            return true
        }
        func onProfileChangeBtnClicked(){
            // 카메라 라이브러리 세팅 (구성을 내가 선택할 수 있다.)
            var config = YPImagePickerConfiguration()
            config.screens = [.library,.photo]
            config.library.maxNumberOfItems = 1
            
            let picker = YPImagePicker(configuration:  config)
            //        picker.imagePickerDelegate = self
            picker.didFinishPicking { [unowned picker] items, cancelled in
                if cancelled {
                    picker.dismiss(animated: true)
                }
                //                if let photo = items.singlePhoto {
                //                self.PostImage.image = photo.image
                //                }
                // 사진 선택창 닫기
                picker.dismiss(animated: true, completion: nil)
                
                let storyboard = UIStoryboard(name: "AddPost", bundle: nil)
                guard let vc = storyboard.instantiateViewController(identifier: "AddPostViewController") as? AddPostViewController else { return }
                
                let homeViewcontroller = (self.viewControllers?.first as! UINavigationController).viewControllers.first as! HomeViewController
                vc.delegate = homeViewcontroller
                
                if let photo = items.singlePhoto {
                    
                    vc.myPhoto = photo.image
                    self.present(vc, animated: true)
                }
            
            }
            // 사진 선택창 보여주기
            picker.modalPresentationStyle = .fullScreen
            present(picker, animated: true, completion: nil)
        }
    }
    
