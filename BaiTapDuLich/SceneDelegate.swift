//
//  SceneDelegate.swift
//  BaiTapDuLich
//
//  Created by Admin on 3/7/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
//        guard let _ = (scene as? UIWindowScene) else { return }
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
//        let vc = ProfileVC()
//        let vc = InformationVC()
        let vc = Trang1VC()
        let navi = UINavigationController(rootViewController: vc)
//        let vc = Trang2VC()
        let settingsVC = SettingsVC()
        let settingsNavi = UINavigationController(rootViewController: settingsVC)
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"), selectedImage: UIImage(systemName: "gearshape.fill"))
        let healthGuruVC = HealthGuruVC()
        healthGuruVC.tabBarItem = UITabBarItem(title: "Report", image: UIImage(named: "Chart 1"), selectedImage: UIImage(named: "Chart"))
        let healthGuruNavi = UINavigationController(rootViewController: healthGuruVC)
    
        
//        let vc = TestCollectionVVc()
//        let vc = ListUserVC()
        
//        window.rootViewController = navi
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [healthGuruNavi, settingsNavi]
        tabBarController.tabBar.tintColor = .primary
        let apperance = UITabBarAppearance()
        apperance.configureWithOpaqueBackground()
        apperance.backgroundColor = .neutral5
//            apperance.layer.cornerRadius = 10
        tabBarController.tabBar.standardAppearance = apperance
        tabBarController.tabBar.scrollEdgeAppearance = apperance
        tabBarController.tabBar.layer.cornerRadius = 20
        tabBarController.tabBar.layer.masksToBounds = true
        
        tabBarController.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        if(UserDefaults.standard.bool(forKey: ("didEnterMainApp"))){
            window.rootViewController = tabBarController
        }else{
            window.rootViewController = navi
        }
//        window.rootViewController = navi
//
        
        self.window = window
        window.makeKeyAndVisible()

        UITableView.appearance().sectionHeaderTopPadding = 0
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

