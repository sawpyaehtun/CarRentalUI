//
//  BaseViewController.swift
//  iOSUITest
//
//  Created by Tamron iMac 001 on 7/3/21.
//


import UIKit


class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLanguage()
        bindViewModel()
        bindData()
        setupTest()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkViewControllerAndShowHideTabBar(vc: self)
    }
    
    func removeNavigationBorder(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func checkViewControllerAndShowHideTabBar(vc : UIViewController) {
        let isTop : Bool = isTopViewController(vc: vc)
        isHiddenTabBar(isHidden: !isTop)
    }
    
    
    func isTopViewController(vc : UIViewController) -> Bool {
        return navigationController?.children.first == vc
    }
    
    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setupUI(){
        isHiddenTabBar(isHidden: !self.isTopViewController(vc: self))
    }
    
    func setupLanguage(){
        
    }
    
    func bindViewModel() {
        
    }
    
    func bindData() {
        
    }
    
    func reloadScreen() {
        setupUI()
    }
    
    func setupTest(){
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get{
            return .portrait
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func isHiddenTabBar(isHidden : Bool) {
        self.tabBarController?.tabBar.isHidden = isHidden
    }
    
    func removeAllPerviousControllers(controller: AnyClass) {
        navigationController?.viewControllers.removeAll(where: { (vc) -> Bool in
            return !vc.isKind(of: controller) && !vc.isKind(of: controller)
        })
    }
    
    func showToast(message : String ,
                   isShowing : ( () -> Void)? = nil ,
                   completion : ( () -> Void)? = nil) {
        let toastLabel = UILabel()
        toastLabel.text = message
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.numberOfLines = 0
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        let maximumLabelSize: CGSize = CGSize(width: 280, height: 300)
        let expectedLabelSize: CGSize = toastLabel.sizeThatFits(maximumLabelSize)
        var newFrame: CGRect = toastLabel.frame
        newFrame.size.height = expectedLabelSize.height + 10
        newFrame.size.width = expectedLabelSize.width + 40
        newFrame.origin.y = UIScreen.main.bounds.height - newFrame.size.height - (UIScreen.main.bounds.height / 9)
        newFrame.origin.x = UIScreen.main.bounds.width/2 - (newFrame.size.width/2)
        toastLabel.frame = newFrame
        toastLabel.clipsToBounds  =  true
        
        if #available(iOS 13.0, *) {
            let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
            
            keyWindow?.addSubview(toastLabel)
        } else {
            let window = UIApplication.shared.keyWindow
            window?.addSubview(toastLabel)
        }
        
        UIView.animate(withDuration: 3, delay: 0.5, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
            if let showing = isShowing {
                showing()
            }
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
            if let completion = completion {
                completion()
            }
        })
        
        
    }
    
    @objc func handleTap(gestureRecognizer: UIGestureRecognizer) {
        self.view.endEditing(true)
        willDismissKeyBoard()
    }
    
    
    func willDismissKeyBoard() {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "FCMToken"), object: nil)
    }
    
}

extension BaseViewController {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        touch.view == self.view
    }
}


