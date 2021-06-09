//
//  ViewController.swift
//  tagListView_tutorial
//
//  Created by wooyeong kam on 2021/06/09.
//

import UIKit
import TagListView

class ViewController: UIViewController, TagListViewDelegate {

    @IBOutlet weak var userInputTextField: UITextField!
    @IBOutlet weak var tagListView: TagListView!
    @IBOutlet weak var addTagButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tagListView.delegate = self
        
        addTagButton.addTarget(self, action: #selector(addTag), for: .touchUpInside)
    }
    
    @objc fileprivate func addTag() {
        let input = userInputTextField.text ?? ""
        
        if input.count > 1{
            tagListView.addTag(input)
        }else{
            let alert = UIAlertController(title: "내용을 입력해주세요", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    
    }
    
    
    // 태그를 추가버튼을 눌렀을 떼
    /// - Parameters:
    ///   - title: 태그의 타이틀
    ///   - tagView: 태그뷰
    ///   - sender: 태그 리스트 뷰
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        tagView.isSelected.toggle()
    }
    
    // 태그 삭제 버튼을 눌렀을 떼
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        sender.removeTagView(tagView)
    }
    
}

