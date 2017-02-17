//
//  SettingsViewController.swift
//  Tip and Share Calculator
//
//  Created by Akash Ungarala on 2/15/17.
//  Copyright © 2017 Akash Ungarala. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var defaultTipPercentageView: UIView!
    @IBOutlet weak var defaultPartySizeView: UIView!
    @IBOutlet weak var themeView: UIView!
    @IBOutlet weak var defaultTipLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var defaultTipImageView: UIImageView! {
        didSet {
            defaultTipImageView.layer.cornerRadius = defaultTipImageView.frame.size.width / 2
            defaultTipImageView.clipsToBounds = true
        }
    }
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
    @IBOutlet weak var badTipLabel: UILabel!
    @IBOutlet weak var notBadTipLabel: UILabel!
    @IBOutlet weak var goodTipLabel: UILabel!
    @IBOutlet weak var badTipTextField: UITextField!
    @IBOutlet weak var notBadTipTextField: UITextField!
    @IBOutlet weak var goodTipTextField: UITextField!
    @IBOutlet weak var saveBadTipButton: UIButton!
    @IBOutlet weak var saveNotBadTipButton: UIButton!
    @IBOutlet weak var saveGoodTipButton: UIButton!
    @IBOutlet weak var editBadTipButton: UIButton!
    @IBOutlet weak var editNotBadTipButton: UIButton!
    @IBOutlet weak var editGoodTipButton: UIButton!
    @IBOutlet weak var theme1Button: UIButton!
    @IBOutlet weak var theme2Button: UIButton!
    @IBOutlet weak var theme3Button: UIButton!
    @IBOutlet weak var theme4Button: UIButton!
    @IBOutlet weak var theme5Button: UIButton!
    @IBOutlet weak var theme6Button: UIButton!
    @IBOutlet weak var theme7Button: UIButton!
    @IBOutlet weak var theme8Button: UIButton!
    @IBOutlet weak var theme9Button: UIButton!
    @IBOutlet weak var theme10Button: UIButton!
    @IBOutlet weak var theme11Button: UIButton!
    @IBOutlet weak var theme12Button: UIButton!
    @IBOutlet weak var theme13Button: UIButton!
    @IBOutlet weak var theme14Button: UIButton!
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
    
    var tipValue: Int! = 0
    var theme: UIColor! {
        didSet {
            navigationBar.barTintColor = theme
            defaultTipLabel.textColor = theme
            defaultTipImageView.backgroundColor = theme
            defaultTipPercentageView.backgroundColor = theme
            defaultPartySizeView.backgroundColor = theme
            partySizeSegmentedControl.tintColor = theme
            themeView.backgroundColor = theme
            if let k = emotion {
                emotion = k
            }
        }
    }
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theme1Button.backgroundColor = UIColor.Theme1
        theme2Button.backgroundColor = UIColor.Theme2
        theme3Button.backgroundColor = UIColor.Theme3
        theme4Button.backgroundColor = UIColor.Theme4
        theme5Button.backgroundColor = UIColor.Theme5
        theme6Button.backgroundColor = UIColor.Theme6
        theme7Button.backgroundColor = UIColor.Theme7
        theme8Button.backgroundColor = UIColor.Theme8
        theme9Button.backgroundColor = UIColor.Theme9
        theme10Button.backgroundColor = UIColor.Theme10
        theme11Button.backgroundColor = UIColor.Theme11
        theme12Button.backgroundColor = UIColor.Theme12
        theme13Button.backgroundColor = UIColor.Theme13
        theme14Button.backgroundColor = UIColor.Theme14
        badTipLabel.textColor = UIColor.Bad
        goodTipLabel.textColor = UIColor.Good
        let defaults = UserDefaults.standard
        let defaultTip = defaults.integer(forKey: "default_tip")
        let badTip = defaults.integer(forKey: "bad_tip")
        let notBadTip = defaults.integer(forKey: "not_bad_tip")
        let goodTip = defaults.integer(forKey: "good_tip")
        defaultTheme = defaults.integer(forKey: "default_theme")
        let defaultPartySize = defaults.integer(forKey: "default_party_size")
        if defaultTip == 0 {
            tipLabel.text = "\(badTip) %"
            tipLabel.textColor = UIColor.Bad
            defaultTipImageView.image = UIImage(named: "Bad")
        } else if defaultTip == 1 {
            tipLabel.text = "\(notBadTip) %"
            tipLabel.textColor = UIColor.black
            defaultTipImageView.image = UIImage(named: "Not Bad")
        } else if defaultTip == 2 {
            tipLabel.text = "\(goodTip) %"
            tipLabel.textColor = UIColor.Good
            defaultTipImageView.image = UIImage(named: "Good")
        }
        emotion = defaultTip
        badTipLabel.text = "\(badTip) %"
        notBadTipLabel.text = "\(notBadTip) %"
        goodTipLabel.text = "\(goodTip) %"
        hideSaveBad()
        hideSaveNotBad()
        hideSaveGood()
        partySizeSegmentedControl.selectedSegmentIndex = defaultPartySize-1
        setImages()
        badTipTextField.delegate = self
        notBadTipTextField.delegate = self
        goodTipTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func onEditingChangedBadTipTextField(_ sender: UITextField) {
        tipValue = Int(sender.text!)
    }
    
    @IBAction func onEditingChangedNotBadTipTextField(_ sender: UITextField) {
        tipValue = Int(sender.text!)
    }
    
    @IBAction func onEditingChangedGoodTipTextField(_ sender: UITextField) {
        tipValue = Int(sender.text!)
    }
    
    @IBAction func onTapBadButton(_ sender: UIButton) {
        emotion = 0
        let defaults = UserDefaults.standard
        let badTip = defaults.integer(forKey: "bad_tip")
        tipLabel.text = "\(badTip) %"
        tipLabel.textColor = UIColor.Bad
        defaultTipImageView.image = UIImage(named: "Bad")
        defaults.set(0, forKey: "default_tip")
        defaults.synchronize()
        hideSaveBad()
        hideSaveNotBad()
        hideSaveGood()
    }
    
    @IBAction func onTapNotBadButton(_ sender: UIButton) {
        emotion = 1
        let defaults = UserDefaults.standard
        let notBadTip = defaults.integer(forKey: "not_bad_tip")
        tipLabel.text = "\(notBadTip) %"
        tipLabel.textColor = UIColor.black
        defaultTipImageView.image = UIImage(named: "Not Bad")
        defaults.set(1, forKey: "default_tip")
        defaults.synchronize()
        hideSaveBad()
        hideSaveNotBad()
        hideSaveGood()
    }
    
    @IBAction func onTapGoodButton(_ sender: UIButton) {
        emotion = 2
        let defaults = UserDefaults.standard
        let goodTip = defaults.integer(forKey: "good_tip")
        tipLabel.text = "\(goodTip) %"
        tipLabel.textColor = UIColor.Good
        defaultTipImageView.image = UIImage(named: "Good")
        defaults.set(2, forKey: "default_tip")
        defaults.synchronize()
        hideSaveBad()
        hideSaveNotBad()
        hideSaveGood()
    }
    
    @IBAction func onTapEditBadTipButton(_ sender: UIButton) {
        tipValue = 0
        let defaults = UserDefaults.standard
        let badTip = defaults.integer(forKey: "bad_tip")
        badTipTextField.text = "\(badTip)"
        hideEditBad()
        hideSaveNotBad()
        hideSaveGood()
    }
    
    @IBAction func onTapSaveBadTipButton(_ sender: UIButton) {
        if tipValue != 0 {
            badTipLabel.text = "\(tipValue!) %"
            let defaults = UserDefaults.standard
            let defaultTip = defaults.integer(forKey: "default_tip")
            if defaultTip == 0 {
                tipLabel.text = "\(tipValue!) %"
            }
            defaults.set(tipValue!, forKey: "bad_tip")
            defaults.synchronize()
            tipValue = 0
        }
        hideSaveBad()
    }
    
    @IBAction func onTapEditNotBadTipButton(_ sender: UIButton) {
        tipValue = 0
        let defaults = UserDefaults.standard
        let notBadTip = defaults.integer(forKey: "not_bad_tip")
        notBadTipTextField.text = "\(notBadTip)"
        hideSaveBad()
        hideEditNotBad()
        hideSaveGood()
    }
    
    @IBAction func onTapSaveNotBadTipButton(_ sender: UIButton) {
        if tipValue != 0 {
            notBadTipLabel.text = "\(tipValue!) %"
            let defaults = UserDefaults.standard
            let defaultTip = defaults.integer(forKey: "default_tip")
            if defaultTip == 1 {
                tipLabel.text = "\(tipValue!) %"
            }
            defaults.set(tipValue!, forKey: "not_bad_tip")
            defaults.synchronize()
            tipValue = 0
        }
        hideSaveNotBad()
    }
    
    @IBAction func onTapEditGoodTipButton(_ sender: UIButton) {
        tipValue = 0
        let defaults = UserDefaults.standard
        let goodTip = defaults.integer(forKey: "good_tip")
        goodTipTextField.text = "\(goodTip)"
        hideSaveBad()
        hideSaveNotBad()
        hideEditGood()
    }
    
    @IBAction func onTapSaveGoodTipButton(_ sender: UIButton) {
        if tipValue != 0 {
            goodTipLabel.text = "\(tipValue!) %"
            let defaults = UserDefaults.standard
            let defaultTip = defaults.integer(forKey: "default_tip")
            if defaultTip == 2 {
                tipLabel.text = "\(tipValue!) %"
            }
            defaults.set(tipValue!, forKey: "good_tip")
            defaults.synchronize()
            tipValue = 0
        }
        hideSaveGood()
    }
    
    @IBAction func partySizeChanged(_ sender: UISegmentedControl) {
        setImages()
        let defaults = UserDefaults.standard
        defaults.set(sender.selectedSegmentIndex+1, forKey: "default_party_size")
        defaults.synchronize()
    }
    
    @IBAction func onTapTheme1Button(_ sender: UIButton) {
        defaultTheme = 1
        let defaults = UserDefaults.standard
        defaults.set(1, forKey: "default_theme")
        defaults.synchronize()
    }
    
    @IBAction func onTapTheme2Button(_ sender: UIButton) {
        defaultTheme = 2
        let defaults = UserDefaults.standard
        defaults.set(2, forKey: "default_theme")
        defaults.synchronize()
    }
    
    @IBAction func onTapTheme3Button(_ sender: UIButton) {
        defaultTheme = 3
        let defaults = UserDefaults.standard
        defaults.set(3, forKey: "default_theme")
        defaults.synchronize()
    }
    
    @IBAction func onTapTheme4Button(_ sender: UIButton) {
        defaultTheme = 4
        let defaults = UserDefaults.standard
        defaults.set(4, forKey: "default_theme")
        defaults.synchronize()
    }
    
    @IBAction func onTapTheme5Button(_ sender: UIButton) {
        defaultTheme = 5
        let defaults = UserDefaults.standard
        defaults.set(5, forKey: "default_theme")
        defaults.synchronize()
    }
    
    @IBAction func onTapTheme6Button(_ sender: UIButton) {
        defaultTheme = 6
        let defaults = UserDefaults.standard
        defaults.set(6, forKey: "default_theme")
        defaults.synchronize()
    }
    
    @IBAction func onTapTheme7Button(_ sender: UIButton) {
        defaultTheme = 7
        let defaults = UserDefaults.standard
        defaults.set(7, forKey: "default_theme")
        defaults.synchronize()
    }
    
    @IBAction func onTapTheme8Button(_ sender: UIButton) {
        defaultTheme = 8
        let defaults = UserDefaults.standard
        defaults.set(8, forKey: "default_theme")
        defaults.synchronize()
    }
    
    @IBAction func onTapTheme9Button(_ sender: UIButton) {
        defaultTheme = 9
        let defaults = UserDefaults.standard
        defaults.set(9, forKey: "default_theme")
        defaults.synchronize()
    }
    
    @IBAction func onTapTheme10Button(_ sender: UIButton) {
        defaultTheme = 10
        let defaults = UserDefaults.standard
        defaults.set(10, forKey: "default_theme")
        defaults.synchronize()
    }
    
    @IBAction func onTapTheme11Button(_ sender: UIButton) {
        defaultTheme = 11
        let defaults = UserDefaults.standard
        defaults.set(11, forKey: "default_theme")
        defaults.synchronize()
    }
    
    @IBAction func onTapTheme12Button(_ sender: UIButton) {
        defaultTheme = 12
        let defaults = UserDefaults.standard
        defaults.set(12, forKey: "default_theme")
        defaults.synchronize()
    }
    
    @IBAction func onTapTheme13Button(_ sender: UIButton) {
        defaultTheme = 13
        let defaults = UserDefaults.standard
        defaults.set(13, forKey: "default_theme")
        defaults.synchronize()
    }
    
    @IBAction func onTapTheme14Button(_ sender: UIButton) {
        defaultTheme = 14
        let defaults = UserDefaults.standard
        defaults.set(14, forKey: "default_theme")
        defaults.synchronize()
    }
    
    func hideEditBad() {
        badTipLabel.isHidden = true
        editBadTipButton.isHidden = true
        saveBadTipButton.isHidden = false
        badTipTextField.isHidden = false
    }
    
    func hideEditNotBad() {
        notBadTipLabel.isHidden = true
        editNotBadTipButton.isHidden = true
        saveNotBadTipButton.isHidden = false
        notBadTipTextField.isHidden = false
    }
    
    func hideEditGood() {
        goodTipLabel.isHidden = true
        editGoodTipButton.isHidden = true
        saveGoodTipButton.isHidden = false
        goodTipTextField.isHidden = false
    }
    
    func hideSaveBad() {
        badTipLabel.isHidden = false
        editBadTipButton.isHidden = false
        saveBadTipButton.isHidden = true
        badTipTextField.isHidden = true
    }
    
    func hideSaveNotBad() {
        notBadTipLabel.isHidden = false
        editNotBadTipButton.isHidden = false
        saveNotBadTipButton.isHidden = true
        notBadTipTextField.isHidden = true
    }
    
    func hideSaveGood() {
        goodTipLabel.isHidden = false
        editGoodTipButton.isHidden = false
        saveGoodTipButton.isHidden = true
        goodTipTextField.isHidden = true
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
    
    func alert(_ alertMessage: String) {
        let alert = UIAlertController(title: "Alert", message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}
