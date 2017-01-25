//
//  PageViewController.swift
//  Acoounts_For_ING
//
//  Created by sabina on 23/01/17.
//  Copyright © 2017 sabina. All rights reserved.
//

import UIKit
import Foundation

class PageViewController : UIPageViewController, UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    

    var index = 0
    var identifiers: NSArray = ["DonutViewController", "TableViewController"]
    var accounts = [Account]()
    let parser = AccountsParser()
    
    override func viewDidLoad() {
        

        self.dataSource = self
        self.delegate = self
        
        if  let startingViewController = self.viewControllerAtIndex(index: self.index) {
        let viewControllers: NSArray = [startingViewController]
        self.setViewControllers(viewControllers as? [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        }

        
    }
    
    func numberOfPages() -> Int {
        return 2
    }
    
    func viewControllerAtIndex(index: Int) -> UIViewController? {
        let jsonFile = Bundle.main.path(forResource: "Accounts", ofType: "json")
        let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonFile!))
        if let accounts = self.parser.accounts(with: jsonData) {
            self.accounts = accounts
        }
        
        //first view controller = firstViewControllers navigation controller
        if index == 0 {
            
            let nib = UIStoryboard.init(name: "Main", bundle: nil)
            let ctrl: DonutViewController = nib.instantiateViewController(withIdentifier: "DonutViewController") as! DonutViewController
            ctrl.accounts = self.accounts
            return ctrl
            
        }
        
        //second view controller = secondViewController's navigation controller
        if index == 1 {
            let nib = UIStoryboard.init(name: "Main", bundle: nil)
            let ctrl: TableViewController = nib.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
            ctrl.accounts = self.accounts
            return ctrl
        }
        
        return nil
    }
    
    
    func indexOfViewController(viewController: UIViewController) -> Int {
        let identifier = viewController.restorationIdentifier
        return self.identifiers.index(of: identifier!) 
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
       
        let index = self.indexOfViewController(viewController: viewController )
        
        //if the index is the end of the array, return nil since we dont want a view controller after the last one
        if index == identifiers.count - 1 {
            
            return nil
        }
        
        //increment the index to get the viewController after the current index
        self.index = self.index + 1
        return self.viewControllerAtIndex(index: self.index)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = self.indexOfViewController(viewController: viewController )
        
        //if the index is 0, return nil since we dont want a view controller before the first one
        if index == 0 {
            
            return nil
        }
        
        //decrement the index to get the viewController before the current one
        self.index = self.index - 1
        return self.viewControllerAtIndex(index: self.index)
        
    }
    
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController!) -> Int {
        return self.identifiers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController!) -> Int {
        return 0
    }
    
    
}
