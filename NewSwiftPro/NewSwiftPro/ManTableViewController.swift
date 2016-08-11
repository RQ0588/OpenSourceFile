//
// Created by Raija on 16/8/10.
// Copyright (c) 2016 ___RQ___. All rights reserved.
//

import Foundation
import UIKit

class ManTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad()  {

        super.viewDidLoad()

        self.title = "tableView"

        let width = UIKit.UIScreen.mainScreen().bounds.size.width

        let height = UIKit.UIScreen.mainScreen().bounds.size.height

        let rect = CGRectMake(0, 0, width, height)

        let manTabelView = UITableView(frame: rect, style: .Plain)

        manTabelView.dataSource = self

        manTabelView.delegate = self

        self.view.addSubview(manTabelView)
    }

    //MARK: -- 数据源
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //行数
        return 5
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //组数
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "cell"

        let cell = UITableViewCell(style: .Default, reuseIdentifier: identifier)

        cell.textLabel?.text = "swift ..."

        return cell
    }

    //MARK: -- 委托方法
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //定义一个提示框 告诉点击了第几行 cell
        let alert = UIAlertController(title: "cell 点击", message: "点击了第 \(indexPath.row)行", preferredStyle: .Alert)
        //给提示框添加动作按钮
        let alertAction = UIAlertAction(title: "确定", style: .Default, handler: nil)
//        alert.addAction(alertAction)
        //弹出提示框
        self.presentViewController(alert, animated: true, completion: {
            //完成提示框弹出后的后续动作
            //延时动作,提示框自动消失
            let time: NSTimeInterval = 1.0
            let delay = dispatch_time(DISPATCH_TIME_NOW,
                    Int64(time * Double(NSEC_PER_SEC)))
            dispatch_after(delay, dispatch_get_main_queue()) {
                alert.dismissViewControllerAnimated(true, completion: nil)//model 出的弹窗消失
            }
        }
                )

    }
}
