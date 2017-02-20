//
//  TipViewController.swift
//  Tip and Share Calculator
//
//  Created by Akash Ungarala on 2/15/17.
//  Copyright © 2017 Akash Ungarala. All rights reserved.
//

import UIKit

extension UIColor {
    static var Bad: UIColor  { return UIColor(red: 163/255, green: 21/255, blue: 8/255, alpha: 1) }
    static var Good: UIColor  { return UIColor(red: 59/255, green: 163/255, blue: 8/255, alpha: 1) }
    static var Theme1: UIColor  { return UIColor(red: 200/255, green: 244/255, blue: 66/255, alpha: 1) }
    static var Theme2: UIColor  { return UIColor(red: 244/255, green: 146/255, blue: 65/255, alpha: 1) }
    static var Theme3: UIColor  { return UIColor(red: 88/255, green: 244/255, blue: 65/255, alpha: 1) }
    static var Theme4: UIColor  { return UIColor(red: 65/255, green: 244/255, blue: 226/255, alpha: 1) }
    static var Theme5: UIColor  { return UIColor(red: 65/255, green: 91/255, blue: 244/255, alpha: 1) }
    static var Theme6: UIColor  { return UIColor(red: 172/255, green: 65/255, blue: 244/255, alpha: 1) }
    static var Theme7: UIColor  { return UIColor(red: 244/255, green: 65/255, blue: 244/255, alpha: 1) }
    static var Theme8: UIColor  { return UIColor(red: 65/255, green: 136/255, blue: 244/255, alpha: 1) }
    static var Theme9: UIColor  { return UIColor(red: 244/255, green: 65/255, blue: 70/255, alpha: 1) }
    static var Theme10: UIColor  { return UIColor(red: 65/255, green: 103/255, blue: 244/255, alpha: 1) }
    static var Theme11: UIColor  { return UIColor(red: 104/255, green: 112/255, blue: 142/255, alpha: 1) }
    static var Theme12: UIColor  { return UIColor(red: 153/255, green: 79/255, blue: 100/255, alpha: 1) }
    static var Theme13: UIColor  { return UIColor(red: 183/255, green: 181/255, blue: 242/255, alpha: 1) }
    static var Theme14: UIColor  { return UIColor(red: 201/255, green: 143/255, blue: 88/255, alpha: 1) }
}

class TipViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var billHeadingLabel: UILabel!
    @IBOutlet weak var tipHeadingLabel: UILabel!
    @IBOutlet weak var totalHeadingLabel: UILabel!
    @IBOutlet weak var shareCalculatorView: UIView!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var shareLabel: UILabel!
    @IBOutlet weak var badTipButton: UIButton! {
        didSet {
            badTipButton.layer.cornerRadius = badTipButton.frame.size.width / 2
            badTipButton.clipsToBounds = true
        }
    }
    @IBOutlet weak var notBadTipButton: UIButton! {
        didSet {
            notBadTipButton.layer.cornerRadius = notBadTipButton.frame.size.width / 2
            notBadTipButton.clipsToBounds = true
        }
    }
    @IBOutlet weak var goodTipButton: UIButton! {
        didSet {
            goodTipButton.layer.cornerRadius = goodTipButton.frame.size.width / 2
            goodTipButton.clipsToBounds = true
        }
    }
    @IBOutlet weak var onePersonImageView: UIImageView!
    @IBOutlet weak var twoPersonsImageView: UIImageView!
    @IBOutlet weak var threePersonsImageView: UIImageView!
    @IBOutlet weak var fourPersonsImageView: UIImageView!
    @IBOutlet weak var fivePersonsImageView: UIImageView!
    @IBOutlet weak var sixPersonsImageView: UIImageView!
    @IBOutlet weak var sevenPersonsImageView: UIImageView!
    @IBOutlet weak var eightPersonsImageView: UIImageView!
    @IBOutlet weak var ninePersonsImageView: UIImageView!
    @IBOutlet weak var tenPersonsImageView: UIImageView!
    @IBOutlet weak var partySizeSegmentedControl: UISegmentedControl!
    
    var defaultTip: Int!
    var emotion: Int! {
        didSet {
            if emotion == 0 {
                badTipButton.backgroundColor = theme
                notBadTipButton.backgroundColor = UIColor.white
                goodTipButton.backgroundColor = UIColor.white
            } else if emotion == 1 {
                badTipButton.backgroundColor = UIColor.white
                notBadTipButton.backgroundColor = theme
                goodTipButton.backgroundColor = UIColor.white
            } else if emotion == 2 {
                badTipButton.backgroundColor = UIColor.white
                notBadTipButton.backgroundColor = UIColor.white
                goodTipButton.backgroundColor = theme
            }
        }
    }
    var theme: UIColor! {
        didSet {
            navigationBar.barTintColor = theme
            billHeadingLabel.textColor = theme
            tipHeadingLabel.textColor = theme
            totalHeadingLabel.textColor = theme
            shareCalculatorView.backgroundColor = theme
            shareLabel.textColor = theme
            partySizeSegmentedControl.tintColor = theme
        }
    }
    var badTip: Int!
    var notBadTip: Int!
    var goodTip: Int!
    var defaultTheme: Int! {
        didSet {
            if defaultTheme == 1 {
                theme = UIColor.Theme1
            } else if defaultTheme == 2 {
                theme = UIColor.Theme2
            } else if defaultTheme == 3 {
                theme = UIColor.Theme3
            } else if defaultTheme == 4 {
                theme = UIColor.Theme4
            } else if defaultTheme == 5 {
                theme = UIColor.Theme5
            } else if defaultTheme == 6 {
                theme = UIColor.Theme6
            } else if defaultTheme == 7 {
                theme = UIColor.Theme7
            } else if defaultTheme == 8 {
                theme = UIColor.Theme8
            } else if defaultTheme == 9 {
                theme = UIColor.Theme9
            } else if defaultTheme == 10 {
                theme = UIColor.Theme10
            } else if defaultTheme == 11 {
                theme = UIColor.Theme11
            } else if defaultTheme == 12 {
                theme = UIColor.Theme12
            } else if defaultTheme == 13 {
                theme = UIColor.Theme13
            } else if defaultTheme == 14 {
                theme = UIColor.Theme14
            }
        }
    }
    var defaultPartySize: Int!
    var partySize: Int!
    var tipPercentage: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        let isFirstLaunch = defaults.integer(forKey: "isFirstLaunch")
        if isFirstLaunch != 0 {
            defaults.set(1, forKey: "default_tip")
            defaults.set(5, forKey: "bad_tip")
            defaults.set(12, forKey: "not_bad_tip")
            defaults.set(20, forKey: "good_tip")
            defaults.set(9, forKey: "default_theme")
            defaults.set(1, forKey: "default_party_size")
            defaults.set(5, forKey: "isFirstLaunch")
            defaults.synchronize()
            alert("5 % (Bad), 12 % (Not Bad) and 20% (Good) are the defaults set.")
        }
        defaultTip = defaults.integer(forKey: "default_tip")
        badTip = defaults.integer(forKey: "bad_tip")
        notBadTip = defaults.integer(forKey: "not_bad_tip")
        goodTip = defaults.integer(forKey: "good_tip")
        defaultTheme = defaults.integer(forKey: "default_theme")
        defaultPartySize = defaults.integer(forKey: "default_party_size")
        emotion = defaultTip
        partySizeSegmentedControl.selectedSegmentIndex = defaultPartySize-1
        setImages()
        partySize = defaultPartySize
        calculate()
        billTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        defaultTip = defaults.integer(forKey: "default_tip")
        badTip = defaults.integer(forKey: "bad_tip")
        notBadTip = defaults.integer(forKey: "not_bad_tip")
        goodTip = defaults.integer(forKey: "good_tip")
        defaultTheme = defaults.integer(forKey: "default_theme")
        defaultPartySize = defaults.integer(forKey: "default_party_size")
        emotion = defaultTip
        partySizeSegmentedControl.selectedSegmentIndex = defaultPartySize-1
        setImages()
        partySize = defaultPartySize
        calculate()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func onEditingChangedBillTextField(_ sender: UITextField) {
        calculate()
    }
    
    @IBAction func onTapBadButton(_ sender: UIButton) {
        emotion = 0
        calculate()
    }
    
    @IBAction func onTapNotBadButton(_ sender: UIButton) {
        emotion = 1
        calculate()
    }
    
    @IBAction func onTapGoodButton(_ sender: UIButton) {
        emotion = 2
        calculate()
    }
    
    @IBAction func partySizeChanged(_ sender: UISegmentedControl) {
        setImages()
        partySize = sender.selectedSegmentIndex + 1
        calculate()
    }
    
    func calculate() {
        let bill = Double(billTextField.text!) ?? 0
        if emotion == 0 {
            tipPercentage = Double(badTip)
            tipLabel.textColor = UIColor.Bad
        } else if emotion == 1 {
            tipPercentage = Double(notBadTip)
            tipLabel.textColor = UIColor.black
        } else if emotion == 2 {
            tipPercentage = Double(goodTip)
            tipLabel.textColor = UIColor.Good
        }
        let tip = bill * tipPercentage / 100
        let total = bill + tip
        let partySizeDouble = Double(partySize)
        let share = total/partySizeDouble
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        currencyFormatter.locale = NSLocale.current
        tipLabel.text = currencyFormatter.string(from: NSNumber(value: Double(String(format: "%.2f", tip))!))
        totalLabel.text = currencyFormatter.string(from: NSNumber(value: Double(String(format: "%.2f", total))!))
        shareLabel.text = currencyFormatter.string(from: NSNumber(value: Double(String(format: "%.2f", share))!))
    }
    
    func setImages() {
        if partySizeSegmentedControl.selectedSegmentIndex == 0 {
            onePersonImageView.image = UIImage(named: "Avatar On")
            twoPersonsImageView.image = UIImage(named: "Avatar Off")
            threePersonsImageView.image = UIImage(named: "Avatar Off")
            fourPersonsImageView.image = UIImage(named: "Avatar Off")
            fivePersonsImageView.image = UIImage(named: "Avatar Off")
            sixPersonsImageView.image = UIImage(named: "Avatar Off")
            sevenPersonsImageView.image = UIImage(named: "Avatar Off")
            eightPersonsImageView.image = UIImage(named: "Avatar Off")
            ninePersonsImageView.image = UIImage(named: "Avatar Off")
            tenPersonsImageView.image = UIImage(named: "Avatar Off")
        } else if partySizeSegmentedControl.selectedSegmentIndex == 1 {
            onePersonImageView.image = UIImage(named: "Avatar On")
            twoPersonsImageView.image = UIImage(named: "Avatar On")
            threePersonsImageView.image = UIImage(named: "Avatar Off")
            fourPersonsImageView.image = UIImage(named: "Avatar Off")
            fivePersonsImageView.image = UIImage(named: "Avatar Off")
            sixPersonsImageView.image = UIImage(named: "Avatar Off")
            sevenPersonsImageView.image = UIImage(named: "Avatar Off")
            eightPersonsImageView.image = UIImage(named: "Avatar Off")
            ninePersonsImageView.image = UIImage(named: "Avatar Off")
            tenPersonsImageView.image = UIImage(named: "Avatar Off")
        } else if partySizeSegmentedControl.selectedSegmentIndex == 2 {
            onePersonImageView.image = UIImage(named: "Avatar On")
            twoPersonsImageView.image = UIImage(named: "Avatar On")
            threePersonsImageView.image = UIImage(named: "Avatar On")
            fourPersonsImageView.image = UIImage(named: "Avatar Off")
            fivePersonsImageView.image = UIImage(named: "Avatar Off")
            sixPersonsImageView.image = UIImage(named: "Avatar Off")
            sevenPersonsImageView.image = UIImage(named: "Avatar Off")
            eightPersonsImageView.image = UIImage(named: "Avatar Off")
            ninePersonsImageView.image = UIImage(named: "Avatar Off")
            tenPersonsImageView.image = UIImage(named: "Avatar Off")
        } else if partySizeSegmentedControl.selectedSegmentIndex == 3 {
            onePersonImageView.image = UIImage(named: "Avatar On")
            twoPersonsImageView.image = UIImage(named: "Avatar On")
            threePersonsImageView.image = UIImage(named: "Avatar On")
            fourPersonsImageView.image = UIImage(named: "Avatar On")
            fivePersonsImageView.image = UIImage(named: "Avatar Off")
            sixPersonsImageView.image = UIImage(named: "Avatar Off")
            sevenPersonsImageView.image = UIImage(named: "Avatar Off")
            eightPersonsImageView.image = UIImage(named: "Avatar Off")
            ninePersonsImageView.image = UIImage(named: "Avatar Off")
            tenPersonsImageView.image = UIImage(named: "Avatar Off")
        } else if partySizeSegmentedControl.selectedSegmentIndex == 4 {
            onePersonImageView.image = UIImage(named: "Avatar On")
            twoPersonsImageView.image = UIImage(named: "Avatar On")
            threePersonsImageView.image = UIImage(named: "Avatar On")
            fourPersonsImageView.image = UIImage(named: "Avatar On")
            fivePersonsImageView.image = UIImage(named: "Avatar On")
            sixPersonsImageView.image = UIImage(named: "Avatar Off")
            sevenPersonsImageView.image = UIImage(named: "Avatar Off")
            eightPersonsImageView.image = UIImage(named: "Avatar Off")
            ninePersonsImageView.image = UIImage(named: "Avatar Off")
            tenPersonsImageView.image = UIImage(named: "Avatar Off")
        } else if partySizeSegmentedControl.selectedSegmentIndex == 5 {
            onePersonImageView.image = UIImage(named: "Avatar On")
            twoPersonsImageView.image = UIImage(named: "Avatar On")
            threePersonsImageView.image = UIImage(named: "Avatar On")
            fourPersonsImageView.image = UIImage(named: "Avatar On")
            fivePersonsImageView.image = UIImage(named: "Avatar On")
            sixPersonsImageView.image = UIImage(named: "Avatar On")
            sevenPersonsImageView.image = UIImage(named: "Avatar Off")
            eightPersonsImageView.image = UIImage(named: "Avatar Off")
            ninePersonsImageView.image = UIImage(named: "Avatar Off")
            tenPersonsImageView.image = UIImage(named: "Avatar Off")
        } else if partySizeSegmentedControl.selectedSegmentIndex == 6 {
            onePersonImageView.image = UIImage(named: "Avatar On")
            twoPersonsImageView.image = UIImage(named: "Avatar On")
            threePersonsImageView.image = UIImage(named: "Avatar On")
            fourPersonsImageView.image = UIImage(named: "Avatar On")
            fivePersonsImageView.image = UIImage(named: "Avatar On")
            sixPersonsImageView.image = UIImage(named: "Avatar On")
            sevenPersonsImageView.image = UIImage(named: "Avatar On")
            eightPersonsImageView.image = UIImage(named: "Avatar Off")
            ninePersonsImageView.image = UIImage(named: "Avatar Off")
            tenPersonsImageView.image = UIImage(named: "Avatar Off")
        } else if partySizeSegmentedControl.selectedSegmentIndex == 7 {
            onePersonImageView.image = UIImage(named: "Avatar On")
            twoPersonsImageView.image = UIImage(named: "Avatar On")
            threePersonsImageView.image = UIImage(named: "Avatar On")
            fourPersonsImageView.image = UIImage(named: "Avatar On")
            fivePersonsImageView.image = UIImage(named: "Avatar On")
            sixPersonsImageView.image = UIImage(named: "Avatar On")
            sevenPersonsImageView.image = UIImage(named: "Avatar On")
            eightPersonsImageView.image = UIImage(named: "Avatar On")
            ninePersonsImageView.image = UIImage(named: "Avatar Off")
            tenPersonsImageView.image = UIImage(named: "Avatar Off")
        } else if partySizeSegmentedControl.selectedSegmentIndex == 8 {
            onePersonImageView.image = UIImage(named: "Avatar On")
            twoPersonsImageView.image = UIImage(named: "Avatar On")
            threePersonsImageView.image = UIImage(named: "Avatar On")
            fourPersonsImageView.image = UIImage(named: "Avatar On")
            fivePersonsImageView.image = UIImage(named: "Avatar On")
            sixPersonsImageView.image = UIImage(named: "Avatar On")
            sevenPersonsImageView.image = UIImage(named: "Avatar On")
            eightPersonsImageView.image = UIImage(named: "Avatar On")
            ninePersonsImageView.image = UIImage(named: "Avatar On")
            tenPersonsImageView.image = UIImage(named: "Avatar Off")
        } else if partySizeSegmentedControl.selectedSegmentIndex == 9 {
            onePersonImageView.image = UIImage(named: "Avatar On")
            twoPersonsImageView.image = UIImage(named: "Avatar On")
            threePersonsImageView.image = UIImage(named: "Avatar On")
            fourPersonsImageView.image = UIImage(named: "Avatar On")
            fivePersonsImageView.image = UIImage(named: "Avatar On")
            sixPersonsImageView.image = UIImage(named: "Avatar On")
            sevenPersonsImageView.image = UIImage(named: "Avatar On")
            eightPersonsImageView.image = UIImage(named: "Avatar On")
            ninePersonsImageView.image = UIImage(named: "Avatar On")
            tenPersonsImageView.image = UIImage(named: "Avatar On")
        }
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func back(sender: UIStoryboardSegue) {}
    
    func alert(_ alertMessage: String) {
        let alert = UIAlertController(title: "Welcome", message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        alert.addAction(action)
        DispatchQueue.main.async( execute: {
            self.present(alert, animated: true, completion: nil)
        })
    }
    
}
