//
//  Register4ViewController.swift
//  FoodDelivaryBag
//
//  Created by Nagae on 2021/06/01.
//

import UIKit

class Register4ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var pickTextField: UITextField!
    @IBOutlet weak var dropTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var memoView: UITextView!
    @IBOutlet weak var registerButton: UIButton!
    
    var pickTime = String()
    var datePicker: UIDatePicker = UIDatePicker()
    var companyArray = ["uber","Panda","didi","出前館","menu","chompy","wolt"]
    var companyName = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        registerButton.layer.cornerRadius = 20.0
        memoView.font = UIFont(name: "PingFangHK-Ultralight", size: 15)

        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return companyArray.count
    }
    
    //コンポーネントの要素のタイトルを指定する
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //スイッチ文で書く必要がある？？
        
        switch component {
        case 0:
            return companyArray[row]
        default:
            return "error!!"
        }
    }
    
    //選択された時の処理
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //選択された会社名を変数に代入する
        companyName = companyArray[row]
    }
    

    
    
    
    @IBAction func changeDate(_ sender: Any) {
        
        let dateFormatter:DateFormatter = DateFormatter()
        //取得したい時間はどこの国の時間かを指定する
        dateFormatter.locale = Locale(identifier: "ja_JP")
        //日時のフォーマットを文字列で指定するアルファベットも文字数で表示される桁数が変わる
        dateFormatter.dateFormat = "HH時mm分"
        pickTime = dateFormatter.string(from: (sender as AnyObject).date)
        
    }
    
    
    @IBAction func register(_ sender: Any) {
        
        //登録ボタンが押されたら、アプリ内にピック場所・ドロップ場所・サービス名・ビック時間を保存または更新を行う
        
        //メモの内容を保存する
        print("-------------")
        print(memoView.text as String)
        let memo = memoView.text as String
        
        //pickTiemが設定されているか
        if pickTime.isEmpty{
            
            //現在時刻をpickTimeに代入する
            
            let dt = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "HH時mm分", options: 0, locale: Locale(identifier: "ja_JP"))
            pickTime = dateFormatter.string(from: dt)
            
        }
        //companyNameが設定されているか
        if companyName.isEmpty{
            
            companyName = "uber"
        }
        
        let foodInfo = FoodInfo(pick: pickTextField.text!, drop: dropTextField.text!, time: pickTime, company: companyName, memo: memo)
        
        //構造体やクラスを一旦Data型に変換してから保存する必要がある
        let jsonEncoder = JSONEncoder()
        jsonEncoder.keyEncodingStrategy = .convertToSnakeCase
        guard let data = try? jsonEncoder.encode(foodInfo) else {
            return
        }
        UserDefaults.standard.set(data, forKey: "foodInfo4")
        
        
//        delegate?.deliveryInfoSet(foodInfo: foodInfo)
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func back(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
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
