//
//  ViewController.swift
//  WebViewApp
//
//  Created by Sanatzhan Aimukambetov on 09.12.2020.
//

import UIKit
import WebKit
import SnapKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    let urlOfWebSite = URL(string: "http://site.com")
    
    let launchScreenView = LaunchScreenView()
    
    let webView: WKWebView = {
        let webView = WKWebView()
        webView.isHidden = true
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        webView.navigationDelegate = self
        webView.load(URLRequest(url: urlOfWebSite!))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            self.hideScreen()
        })
        
        setupNotifications()
        
    }
    
    private func setupNotifications() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Local notification"
        content.body = "You need to work hard, duuuude"
        
        let date = Date().addingTimeInterval(5)
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let idString = UUID().uuidString
        let request = UNNotificationRequest(identifier: idString, content: content, trigger: trigger)
        
        center.add(request) { (error) in
        }
    }
    
    private func setupConstraints() {
        launchScreenView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        webView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupViews() {
        view.addSubview(launchScreenView)
        view.addSubview(webView)
        view.backgroundColor = .white
    }
    
    private func hideScreen() {
        launchScreenView.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        launchScreenView.isHidden = true
        webView.isHidden = false
    }
}



