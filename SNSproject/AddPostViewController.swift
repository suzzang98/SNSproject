//
//  AddPostViewController.swift
//  SNSproject
//
//  Created by 장가겸 on 8/17/23.
//

import UIKit

protocol AddPostViewControllerDelegate: AnyObject {
    func addPostTapped()
}

class AddPostViewController: UIViewController, UITextViewDelegate, UINavigationControllerDelegate {
    var myPhoto : UIImage!
    
    weak var delegate: AddPostViewControllerDelegate?
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var PostButton: UIButton!
    @IBOutlet weak var postText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        postImage.image = myPhoto
        postText.textColor = UIColor.lightGray
        postText.text = "일반 텍스트 뷰 입니다."
        postText.delegate = self
        self.postImage.clipsToBounds = true
        tapgasture()
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    func tapgasture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        postImage.isUserInteractionEnabled = true
        postImage.addGestureRecognizer(tap)
    }
    @objc func imageTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func addPost(_ sender: Any) {
//        print(PostRepository.shared.getAllPosts().count, "Count")
        DispatchQueue.main.async {
            let post = Post(id: UUID().uuidString, userProfileImage: UIImage(named: "suhyeon")!, contentImage: self.postImage.image! ,content: self.postText.text, uploadDate: Date())
            PostRepository.shared.addPost(post: post)
            UserInfoRepository.shared.postList.insert(post, at: 0)
            self.delegate?.addPostTapped()
            self.dismiss(animated: true)
//            print(self.presentingViewController)
            
//            self.dismiss(animated: true) {
//                let vc = self.presentingViewController as! HomeViewController
//                vc.table.reloadData()
//            }
        }
        
//        print(PostRepository.shared.getAllPosts().count, "Count")
        
    }
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension AddPostViewController : UIImagePickerControllerDelegate,UINavigationBarDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        postImage.image = info[.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
}
extension AddPostViewController {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "일반 TextView 입니다."
            textView.textColor = UIColor.lightGray
        }
    }
}
