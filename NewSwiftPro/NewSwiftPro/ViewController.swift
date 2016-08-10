//
//  ViewController.swift
//  NewSwiftPro
//
//  Created by Raija on 16/8/10.
//  Copyright (c) 2016 ___RQ___. All rights reserved.
//


import UIKit


class ViewController: UIViewController {


    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
        addSubViewControllers()     //添加子控件
    }


    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }

    //MARK: --
    func addSubViewControllers()  {
        //UILabel
        let label = UILabel(frame: CGRectMake(10, 70, 200, 30))   //位置和大小
        label.text = "hello word label"     //设置要显示的文字
        label.font = UIFont(name: "宋体", size: 12)   //设置文字的大小和字体
        label.shadowColor = UIColor.blueColor()     //设置文字的阴影颜色
        label.shadowOffset = CGSizeMake(90, 90)     //设置标签文字的阴影在横向和纵向的偏移距离
        label.textAlignment = NSTextAlignment.Center    //设置文字的对其的方式
        label.textColor = UIColor.grayColor()   //文字颜色
        label.tag = 12  //设置 label 的 tag
        label.backgroundColor = UIColor.blackColor()    // 背景颜色
        self.view.addSubview(label)     //加到视图上

        //UIButton
        let button = UIButton(type: UIButtonType.RoundedRect)   //设置button 的类型
        button.frame = CGRectMake(10, CGRectGetMaxY(label.frame) + 5, 200, 50)  //位置和大小
        button.backgroundColor = UIColor.redColor()     //设置背景色
        button.setTitle("push_table", forState: .Normal)    //设置按钮的文字
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)   //设置按钮的文字颜色
        //设置按钮的点击事件
        button.addTarget(self, action: #selector(ViewController.buttonTag(_:)), forControlEvents: .TouchUpInside)
        button.tag = 10     //设置 tag 值
        self.view.addSubview(button)
    }

    //触发 button
    func buttonTag(btn: UIButton)  {
        if btn.tag == 10 {
            //触发此事件
            print("10号按钮")
            //跳转到 tableView
            let tableView = ManTableViewController()
            self.navigationController?.pushViewController(tableView, animated: true)
        } else {

        }
    }

}
