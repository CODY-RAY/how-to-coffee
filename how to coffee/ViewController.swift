//
//  ViewController.swift
//  how to coffee
//
//  Created by cody's macbook on 3/25/17.
//  Copyright © 2017 crank llc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scollview :     UIScrollView!
    @IBOutlet weak var drinkLabel:     UILabel!
    @IBOutlet weak var decafLabel:     UITextField!
    @IBOutlet weak var shotsLabel:     UITextField!
    @IBOutlet weak var drinkTextLable: UITextField!
    lazy var arrayfordrinks = [UIImageView]()
    lazy var arrayforshots  = [UIImageView]()
    lazy var arrayforsteam  = [UIImageView]()
    lazy var arrayforpumps  = [UIImageView]()
    lazy var syrupsview = UIImageView()
    lazy var milkview = UIImageView()
    var espressoMaker = UIImageView()
    var espressoMakerLock = false
    var shotsLock = false
    var steamLock = false
    var x = 0
    let milknames = ["2%", "WH", "N" , ""]
    var addons: (array:[String],index:Int) = (["v","sfv","hotH20","c","tn","m"], 0)
    var sweetenersSelected: [Sweeteners:UInt] = [:]
    var customSelected: [Custom:Mods] = [:]
    let generator = Generator()
    var drink:Drink?
    var checkButt: UIButton = UIButton()
    var correct = false
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        decafLabel.delegate = self
        scollview.contentSize.height = 2500
        shotsLabel.delegate = self
        drinkTextLable.delegate = self
        setUpDrink()
        
    }
    
    //MARK: rand
    
    func setUpDrink()  {
        drink = generator.getDrink()
        drinkLabel.text = sizeStrings[ (drink?.size?.rawValue)! ] + " " + (drink?.name)!
    }

    //MARK: Text Feild
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        decafLabel.resignFirstResponder()
        shotsLabel.resignFirstResponder()
        drinkTextLable.resignFirstResponder()
        if (textField === drinkTextLable && drinkTextLable.text?.uppercased() == drink?.drinkChars.uppercased()){
        
        addSizesViews()
        addView2SV(picName: "espresso_maker.png", frame: CGRect(x: view.frame.width / 7 ,   y:1050 ,width: 256, height: 256), #selector(self.didTapeEspresso(gesture:))).layer.zPosition = 100
        milkview = addView2SV(picName: "2%", frame: CGRect(x: view.frame.width / 7, y: 750, width: 256, height: 256))
        addArrowsViews()
            addSyrups()
            
            
            checkButt = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height:100))
            checkButt.center = CGPoint(x: view.frame.width / 2, y: 1800)
            checkButt.addTarget(self, action: #selector(check), for: .touchUpInside)
            checkButt.setTitle("Check", for: .normal)
            checkButt.setTitleColor(UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1) , for: .normal)
            checkButt.tag = 1
            
            scollview.addSubview(checkButt)
        }
        return true
    }
    
    
    
    //MARK: Taps
    func didTapSizesImage(gesture: UIGestureRecognizer) {
        arrayfordrinks.forEach{$0.backgroundColor = UIColor.white}
        (gesture.view as! UIImageView).backgroundColor = UIColor(white: 0.1, alpha: 0.1)
    }
    func didTapShotsImage(gesture: UIGestureRecognizer) {
        arrayforshots.forEach{$0.backgroundColor = UIColor.white}
        (gesture.view as! UIImageView).backgroundColor = UIColor(white: 0.1, alpha: 0.1)
    }
    func didTapSteamImage(gesture: UIGestureRecognizer) {
        arrayforsteam.forEach{$0.backgroundColor = UIColor.white}
        (gesture.view as! UIImageView).backgroundColor = UIColor(white: 0.1, alpha: 0.1)
    }
    func didTapPumpImage(gesture: UIGestureRecognizer) {
        arrayforpumps.forEach{$0.backgroundColor = UIColor.white}
        (gesture.view as! UIImageView).backgroundColor = UIColor(white: 0.1, alpha: 0.1)
    }
    
    func didTapeEspresso(gesture: UIGestureRecognizer) {
        
        if self.espressoMakerLock {
            UIView.animate(withDuration: 0.3 , animations: {
                
                    (gesture.view as! UIImageView).center.x = 182
                    (gesture.view as! UIImageView).backgroundColor = UIColor.white
                    self.espressoMakerLock = false
                self.arrayforshots.forEach{$0.isUserInteractionEnabled = false}
                self.arrayforsteam.forEach{$0.isUserInteractionEnabled = false}
                })
        }else{
        let point = gesture.location(in: gesture.view)
        
        if point.x > 200 {
            
           // (gesture.view as! UIImageView).backgroundColor = UIColor(white: 0.02, alpha: 0.1)
           // self.espressoMakerLock = true
            
            UIView.animate(withDuration: 0.3 , animations: {
                if ( !self.espressoMakerLock) {
                    (gesture.view as! UIImageView).backgroundColor = UIColor(white: 0.9, alpha: 1)
                    (gesture.view as! UIImageView).center.x -= 75
                    self.espressoMakerLock = true}})
            
            if !self.steamLock {
                addSteamViews()
                self.steamLock = true
            }
            self.arrayforsteam.forEach{$0.isUserInteractionEnabled = true}
            
            
        }else{
            
            UIView.animate(withDuration: 0.3 , animations: {
                        if ( !self.espressoMakerLock) {
                        (gesture.view as! UIImageView).backgroundColor = UIColor.brown
                        (gesture.view as! UIImageView).center.x += 175
                        self.espressoMakerLock = true}})
            
            if !self.shotsLock {
                addShotsViews()
                self.shotsLock = true
            }
            self.arrayforshots.forEach{$0.isUserInteractionEnabled = true}
        }}
    }
    
    func didTapeArrow(gesture: UIGestureRecognizer) {
        let point = gesture.location(in: self.view)
        
        if point.x > 200 {
            x += 1
            updateMilk()
        }else{
            x -= 1
            updateMilk()
        }
    }
    
    func didTapeSyArrow(gesture: UIGestureRecognizer) {
        let point = gesture.location(in: self.view)
        if arrayforpumps.count > 0{
        setAddon()
        }
        removeSyNums()
        if point.x > 200 {
            addons.index += 1
            updateSy()
        }else{
            if addons.index == 0{
                addons.index = addons.array.count - 1
            }else{
            addons.index -= 1
                
            }
            updateSy()
            
        }
    }
    func didTapeSy(gesture: UIGestureRecognizer) {
      //  let point = gesture.location(in: self.view)
        if arrayforpumps.isEmpty {
            checkAddOns()
        }
    }
    func updateMilk() {
        milkview.image = UIImage(named: milknames[ abs(x) % milknames.count])
    }
    func updateSy() {
        syrupsview.image = UIImage(named: addons.array[abs(addons.index) % addons.array.count])
    }
    //MARK: view stuff

    func addView2SV(picName:String,frame:CGRect, _ action: Selector? = nil ) -> UIImageView {
        let view = UIImageView(image: UIImage(named: picName))
        view.isUserInteractionEnabled = true
        view.frame = frame
        view.image?.accessibilityIdentifier = picName
        if (action != nil) {
        view.addGestureRecognizer( UITapGestureRecognizer(target: self, action: action! ))
        }
        scollview.addSubview(view)
        return view
    }
    
    
    func addSizesViews()  {
        let tap = #selector(self.didTapSizesImage(gesture:))
        let s = addView2SV(picName: "8oz" , frame: CGRect(x: 50, y: 450,                         width: 100, height: 100),tap)
        let t = addView2SV(picName: "12oz", frame: CGRect(x: 25 + view.frame.width / 2 , y: 450, width: 100, height: 100),tap)
        let g = addView2SV(picName: "16oz", frame: CGRect(x: 50, y: 600,                         width: 100, height: 100),tap)
        let v = addView2SV(picName: "20oz", frame: CGRect(x: 25 + view.frame.width / 2 , y: 600, width: 100, height: 100),tap)
        
        arrayfordrinks = [s,t,g,v]
    }
    func addShotsViews()  {
        
        let y = 1050 + 75
        let x = 50 + 25
       
        let one = addView2SV(picName: "1",
                           frame: CGRect(x: x, y: y, width: 50, height: 50),
                           #selector(self.didTapShotsImage(gesture:)))
        let two = addView2SV(picName: "2",
                           frame: CGRect(x: x + 50 , y: y, width: 50, height: 50),
                           #selector(self.didTapShotsImage(gesture:)))
        let three = addView2SV(picName: "3",
                           frame: CGRect(x: x, y: y + 50 , width: 50, height: 50),
                           #selector(self.didTapShotsImage(gesture:)))
        let four = addView2SV(picName: "4",
                           frame: CGRect(x: x + 50 , y: y + 50 , width: 50, height: 50),
                           #selector(self.didTapShotsImage(gesture:)))
        
        arrayforshots = [one,two,three,four]
        
    }
    func addSteamViews()  {
        
        let y = 1050 + 75
        let x = 250 + 5
        
        let one = addView2SV(picName: "4",
                             frame: CGRect(x: x, y: y, width: 50, height: 50),
                             #selector(self.didTapSteamImage(gesture:)))
        let two = addView2SV(picName: "7",
                             frame: CGRect(x: x, y: y + 50 , width: 50, height: 50),
                             #selector(self.didTapSteamImage(gesture:)))
       
        arrayforsteam = [one,two]
        
    }
    
    func addArrowsViews()  {
        let tap = #selector(self.didTapeArrow(gesture:))
        _ = addView2SV(picName: "left" , frame: CGRect(x:  10 , y: 750, width: 64, height: 256),tap)
        _ = addView2SV(picName: "right", frame: CGRect(x:  view.frame.width - 75 , y: 750, width: 64, height: 256),tap)
    }
    
    func addSyrups() {
        let y = 1350
        let tap = #selector(self.didTapeSyArrow(gesture:))
        _ = addView2SV(picName: "left", frame: CGRect(x:  10 , y: y + 35, width: 64, height: 256),tap)
        _ = addView2SV(picName: "right", frame: CGRect(x:  Int(view.frame.width - 75) , y: y + 35, width: 64, height: 256),tap)
        
        let tapSy = #selector(self.didTapeSy(gesture:))
       syrupsview = addView2SV(picName: "v", frame: CGRect(x: Int(view.frame.width / 3) - 10, y: y, width: Int(256 / 1.95), height: Int(256 * 1.25)), tapSy)
    }
    
    func checkAddOns(){
    
    let add = addons.array[addons.index % addons.array.count]
        if "hotH20" == add {
         showAddOns(isWater: true)
        }else{
         showAddOns(isWater: false)
        }
    }
    func showAddOns(isWater:Bool) {
        
        let f = addons.array[abs(addons.index) % addons.array.count].uppercased()
        
        if isWater {
            //TODO:H2O
            let y = 1700
            let x = 135
            let sel = #selector(self.didTapPumpImage(gesture:))
            
            let s = Custom(rawValue:f)!
            
            
            let under = addView2SV(picName: "_", frame: CGRect(x: x + 000 , y: y, width: 50, height: 50),sel)
            let cup   = addView2SV(picName: "WithX", frame: CGRect(x: x + 050 , y: y, width: 50, height: 50),sel)
            
            
            
            arrayforpumps = [under,cup]
            if customSelected[s] != nil  {
                arrayforpumps[1].backgroundColor = UIColor(white: 0.1, alpha: 0.1)
            }

        }else{
            let y = 1700
            let x = 50
            let sel = #selector(self.didTapPumpImage(gesture:))
            
            let s = Sweeteners(rawValue:f)!
            
            
            let under = addView2SV(picName: "_", frame: CGRect(x: x + 000 , y: y, width: 50, height: 50),sel)
            let one   = addView2SV(picName: "1", frame: CGRect(x: x + 050 , y: y, width: 50, height: 50),sel)
            let two   = addView2SV(picName: "2", frame: CGRect(x: x + 100 , y: y, width: 50, height: 50),sel)
            let three = addView2SV(picName: "3", frame: CGRect(x: x + 150 , y: y, width: 50, height: 50),sel)
            let four  = addView2SV(picName: "4", frame: CGRect(x: x + 200 , y: y, width: 50, height: 50),sel)
            let five  = addView2SV(picName: "5", frame: CGRect(x: x + 250 , y: y, width: 50, height: 50),sel)
            
            arrayforpumps = [under,one,two,three,four,five]
            if let ll =  sweetenersSelected[s]  {
                arrayforpumps[Int(ll)].backgroundColor = UIColor(white: 0.1, alpha: 0.1)
            }
            
        }
    }
    
    func removeSyNums()  {
        arrayforpumps.forEach{$0.removeFromSuperview()}
        arrayforpumps = []
    }
    //MARK: checking
    
    func check()  {
        
        if arrayforpumps.count > 0{
            setAddon()
        }
        removeSyNums()
        
        let milk = milknames[x % milknames.count]
        let sizeview = arrayfordrinks.filter{$0.backgroundColor != UIColor.white }.first
        let espresso =  arrayforshots.filter{$0.backgroundColor != UIColor.white }.first
        let steam    =  arrayforsteam.filter{$0.backgroundColor != UIColor.white }.first
        
        let sizeInfo     = (NIL: sizeview?.backgroundColor, name: sizeview?.image?.accessibilityIdentifier!)
        let espressoInfo = (NIL: espresso?.backgroundColor, name: espresso?.image?.accessibilityIdentifier!)
        let steamInfo    = (NIL: steam?.backgroundColor   , name: steam?.image?.accessibilityIdentifier!)
        
        
        if (sizeInfo.NIL != nil && espressoInfo.NIL != nil ) {
         
            if (milk == drink?.milk?.milkType.rawValue || drink?.milk == nil ) && (sizeInfo.name! == ozStrings[(drink?.size?.rawValue)!]) && (espressoInfo.name! ==  drink!.shots!.numOfshots.description) && (drink?.milk == nil || (steamInfo.name! == drink?.milk?.steamedFor.rawValue.description))  {
             
                if (drink?.sweetener == nil && sweetenersSelected.isEmpty) || ((drink?.sweetener != nil) && (drink?.sweetener)! == sweetenersSelected ){
                    
                    if (drink?.custom == nil && customSelected.isEmpty) || ((drink?.custom != nil) && (drink?.custom)! == customSelected ){
                        self.checkButt.backgroundColor = UIColor(red: 0.1, green: 0.74, blue: 0.2, alpha: 1.0)
                        
                        correct = true
                        performSegue(withIdentifier: "win", sender: nil)
                        
                    }else{
                        checkButt.backgroundColor = UIColor.red
                    }
                }else{
                    checkButt.backgroundColor = UIColor.red
                }
            }else{
                checkButt.backgroundColor = UIColor.red
            }
        }
        
    }
    
    func setAddon()  {
        let f = addons.array[abs(addons.index) % addons.array.count]
        let pumps = (arrayforpumps.filter{ $0.backgroundColor != UIColor.white }).first
        let pumpsInfo     = (NIL: pumps?.backgroundColor, name: pumps?.image?.accessibilityIdentifier!)
        
        if  pumpsInfo.NIL != nil {
            if let s = Sweeteners(rawValue:f.uppercased()) {
                
                if pumpsInfo.name! == "_"{
                    sweetenersSelected.removeValue(forKey: s)
                  }else{
                    
                    sweetenersSelected.updateValue(UInt(pumpsInfo.name!)!, forKey: s)
                }
            }
            //TODO: todo 
            if let s = Custom(rawValue:f.uppercased()) {
                if pumpsInfo.name! == "_"{
                    customSelected.removeValue(forKey: s)
                }else{
                    customSelected.updateValue(.normal, forKey: s)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "win" {
            let w = segue.destination as! StartViewController
            w.win = correct
        }
    }
}

