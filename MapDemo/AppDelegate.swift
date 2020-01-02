//
//  AppDelegate.swift
//  MapDemo
//
//  Created by JOEL CRAWFORD on 02/01/2020.
//  Copyright © 2020 RTS. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Key Generated
        GMSServices.provideAPIKey("AIzaSyAjLa_V2zhuO33wUwVjy70ucgF_8z3gtAs")
        GMSPlacesClient.provideAPIKey("AIzaSyAjLa_V2zhuO33wUwVjy70ucgF_8z3gtAs")
        
        return true
    }

        @available(iOS 13.0, *)
        @available(iOS 13.0, *)
        @available(iOS 13.0, *)
        @available(iOS 13.0, *)
        func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
            // Called when a new scene session is being created.
            // Use this method to select a configuration to create the new scene with.
           // if #available(iOS 13.0, *) {
                return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    //        } else {
    //            // Fallback on earlier versions
    //        }
        }

        @available(iOS 13.0, *)
        func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
            // Called when the user discards a scene session.
            // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
            // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        }


    }
