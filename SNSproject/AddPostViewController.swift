//
//  UploadPostViewController.swift
//  TabbarTest
//
//  Created by 장가겸 on 8/15/23.
//

import UIKit

class AddPostViewController: UIViewController, UITextViewDelegate {
    var myPhoto : UIImage!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postText: UITextView!
    @IBOutlet weak var postButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postImage.image = myPhoto
        postText.textColor = UIColor.lightGray
        postText.text = "일반 텍스트 뷰 입니다."
        postText.delegate = self
        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
