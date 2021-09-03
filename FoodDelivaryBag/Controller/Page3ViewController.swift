//
//  Page3ViewController.swift
//  FoodDelivaryBag
//
//  Created by Nagae on 2021/05/26.
//

import UIKit

class Page3ViewController: UIViewController {
    
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var pickLabel: UILabel!
    @IBOutlet weak var dropLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var memoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerButton.layer.cornerRadius = 20.0

        // Do any additional setup after loading the view.
    }
    
    //viewWillAppearは画面が表示される前の処理
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //上のナビゲーションバーを表示する
        self.navigationController?.isNavigationBarHidden = false
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = UserDefaults.standard.data(forKey: "foodInfo3"),
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
        
        performSegue(withIdentifier: "register3", sender: nil)
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
