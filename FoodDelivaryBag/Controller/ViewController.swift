//
//  ViewController.swift
//  FoodDelivaryBag
//
//  Created by Nagae on 2021/05/25.
//

import UIKit
import Lottie

class ViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var onboardArray = ["1","2"]
    var onboardStringArray = ["配達員のみなさんこんにちは!","バックの中身を記録して、配達の効率を上げませんか？"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //ページングを可能にする
        scrollView.isPagingEnabled = true
        
        //スクロールビューの設定
        setUpScroll()
        
        //アニメーションを表示させる
        loopAnimation()
       
        
        
    }
    //スクロールビューの設定
    func setUpScroll(){
        
        scrollView.delegate = self
        //横幅の設定　今回は2つ分アニメーションを表示させたいから横幅×2
        scrollView.contentSize = CGSize(width: view.frame.width*2, height: scrollView.frame.height)
        //ラベル付を行う
        for i in 0...1{
            //ラベルの位置を決める
            let onboardLabel = UILabel(frame: CGRect(x: CGFloat(i)*view.frame.size.width, y: view.frame.size.height/3, width: scrollView.frame.width, height: scrollView.frame.height))
            
            onboardLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
            onboardLabel.textAlignment = .left
            onboardLabel.numberOfLines = 0
            onboardLabel.text = onboardStringArray[i]
            //ラベルをscrollViewに追加する
            scrollView.addSubview(onboardLabel)
        }
    }
    
    //アニメーションを表示させる
    func loopAnimation(){
        for i in 0...1{
            
            //コンテンツView(UIVew)ではなく、アニメーションを表示したいので、AnimationViewをしようする
            //アニメーションviewを生成する
            let animationView = AnimationView()
            //流すアニメーションを指定する
            let animation = Animation.named(onboardArray[i])
            //animationViewの表示する場所を指定する
            animationView.frame = CGRect(x: CGFloat(i)*view.frame.width, y: 0, width: view.frame.size.width, height: view.frame.size.height)
            //アニメーションViewに流すアニメをanimationとする
            animationView.animation = animation
            //表示方法
            animationView.contentMode = .scaleAspectFit
            //ループ再生を行う
            animationView.loopMode = .loop
            //アニメーションを開始する
            animationView.play()
            //アニメーションビューをscrollViewに追加する
            scrollView.addSubview(animationView)
            
        }
        
    }
    
    //viewWillAppearは画面が表示される前の処理
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //上のナビゲーションバーを消す
        self.navigationController?.isNavigationBarHidden = true
    }


}

