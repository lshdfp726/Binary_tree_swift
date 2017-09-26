//
//  ViewController.swift
//  Binary_tree_swift
//
//  Created by fns on 2017/9/26.
//  Copyright © 2017年 lsh726. All rights reserved.
//

import UIKit

//二叉树class
class Binary_Tree {
    var val:Int?
    var left:Binary_Tree?
    var right:Binary_Tree?
    init(val:Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var node:Binary_Tree?
        let temp = [89,36,24,15,65,14,63,53,21,6]
        
        temp.forEach { (val) in
            node = self.Binary(node:node, val: val)
        }
        
        print("前序")
        preTree(node: node!)
        print("中序")
        middleTree(node: node!)
        print("后序列")
        backTree(node: node!)
        
        print("翻转之后")
        node = inversetTree(node: node!)!
        print("前序")
        preTree(node: node!)
    }

    //创建二叉树，规则:数字小的在左子树，大的在右子树！ 可以根据自己需要调整
    func Binary(node:Binary_Tree?,val:Int) -> Binary_Tree {
        var root:Binary_Tree?
        if node == nil {
            root = Binary_Tree.init(val: val)
            return root!
        }
        
        if val < (node?.val)! {//小的在左边
            node?.left  =  Binary(node: node?.left, val: val)//递归创建
        } else {//大的在右边
            node?.right =  Binary(node: node?.right, val: val)//递归创建
        }
        root = node!
        
        return root!
    }
    
    //前序遍历（根左右）
    func preTree(node:Binary_Tree?) {
        if node?.val == nil {
            return
        }
        
        print((node?.val)!)
        preTree(node: node?.left)
        preTree(node: node?.right)
    }
    
    //中序遍历（左根右）
    func middleTree(node:Binary_Tree?) {
        if node == nil {
            return
        }
        
        middleTree(node: node?.left)
        print((node?.val)!)
        middleTree(node: node?.right)
    }
    
    
    //后序遍历（左右根）
    func backTree(node:Binary_Tree?) {
        if node == nil {
            return
        }
        
        backTree(node: node?.left)
        backTree(node: node?.right)
        print((node?.val)!)
    }
    
    
    //翻转树
    func inversetTree(node:Binary_Tree?) -> Binary_Tree? {
        if node == nil {
            return nil
        }
        
        node?.left = inversetTree(node: node?.left)
        node?.right = inversetTree(node: node?.right)
        
        
        let temp = node?.left
        node?.left  = node?.right
        node?.right = temp
        
        return node!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

