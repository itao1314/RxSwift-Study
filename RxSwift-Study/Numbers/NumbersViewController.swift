//
//  NumbersViewController.swift
//  RxSwift-Study
//
//  Created by 陶涛 on 2021/9/8.
//

import UIKit
import RxSwift
import RxCocoa

class NumbersViewController: UIViewController {
    
    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var number3: UITextField!
    @IBOutlet weak var result: UILabel!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Observable.combineLatest([number1.rx.text.orEmpty, number2.rx.text.orEmpty, number3.rx.text.orEmpty]) { textValues in
            textValues.reduce(0) { resultValue, textValue in
                resultValue + (Int(textValue) ?? 0)
            }
        }
        .map { $0.description }
        .bind(to: result.rx.text)
        .disposed(by: disposeBag)
    }
    
    
}
