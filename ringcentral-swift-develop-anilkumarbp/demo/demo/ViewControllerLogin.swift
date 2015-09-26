import UIKit

class ViewControllerLogin: UIViewController {
    
    

    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet weak var userBox: UITextField!
    @IBOutlet weak var passBox: UITextField!
    @IBOutlet weak var keyBox: UITextField!
    @IBOutlet weak var secretBox: UITextField!
    
    var platform: Platform?
    
    @IBAction func login(sender: AnyObject) {
        
        
        var rcsdk = SDK(appKey: keyBox.text, appSecret: secretBox.text, server: SDK.RC_SERVER_SANDBOX)
        var platform = rcsdk.getPlatform()
        self.platform = platform
        platform.authorize(userBox.text, password: passBox.text)
        
        if platform.auth != nil && platform.auth!.authenticated {
            performSegueWithIdentifier("loginToMain", sender: nil)
        } else {
            shakeButton(sender)
        }
        
    }
    
    func shakeButton(sender: AnyObject) {
        let anim = CAKeyframeAnimation( keyPath:"transform" )
        anim.values = [
            NSValue(CATransform3D:CATransform3DMakeTranslation(-5, 0, 0)),
            NSValue(CATransform3D:CATransform3DMakeTranslation(5, 0, 0))
        ]
        anim.autoreverses = true
        anim.repeatCount = 2
        anim.duration = 7/100
        
        sender.layer.addAnimation(anim, forKey: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let backItem = UIBarButtonItem(title: "Custom Text HERE", style: .Bordered, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
        
    }
    
    // Hides the keyboard when finished editting
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var textField: UITextField!
    
    // Sets variables in another ViewController from the current one
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {

        if segue.identifier == "loginToMain" {
            var tabBarC : UITabBarController = segue.destinationViewController as! UITabBarController
            var desView: ViewControllerPhone = tabBarC.viewControllers?.first as! ViewControllerPhone
            if let check = platform {
                desView.platform = check
            }
            
            
        }
        
    }


}

