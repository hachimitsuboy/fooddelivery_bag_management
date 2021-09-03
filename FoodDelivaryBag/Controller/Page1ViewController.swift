//
//  Page1ViewController.swift
//  FoodDelivaryBag
//
//  Created by Nagae on 2021/05/26.
//

import UIKit


class Page1ViewController: UIViewController{
    

    
    @IBOutlet weak var pickLabel: UILabel!
    @IBOutlet weak var dropLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var memoLabel: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        registerButton.layer.cornerRadius = 22.0
        // Do any additional setup after loading the view.
        
    }
    
    
    //viewWillAppearは画面が表示される前の処理
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //上のナビゲーションバーを表示する
        //ViewControllerを引き継いでるようで、全ての画面でナビゲーションバーが消えている
        self.navigationController?.isNavigationBarHidden = false
        
        // `JSONDecoder` で `Data` 型を自作した構造体へデコードする
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = UserDefaults.standard.data(forKey: "foodInfo"),
            let foodInfo = try? jsonDecoder.decode(FoodInfo.self, from: data) else {
                return
        }
        pickLabel.text = foodInfo.pick
        dropLabel.text = foodInfo.drop
        companyLabel.text = foodInfo.company
        timeLabel.text = foodInfo.time
     
        print(foodInfo.memo)
        memoLabel.text = foodInfo.memo
        

    }
    
    
    @IBAction func register(_ sender: Any) {
        
        performSegue(withIdentifier: "register1", sender: nil)
    }
    

    
    
    
 
    //ストリートボードに表示されない　というかこのデリゲードメソッドはいつ呼ばれるのか？
    //委任先の指定を行なっていない
    
    
    //登録画面へ遷移する

    
    
 
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
