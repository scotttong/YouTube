//
//  HamburgerViewController.swift
//  YouTube
//
//  Created by Scott Tong on 3/2/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {

	@IBOutlet weak var menuView: UIView!
	@IBOutlet weak var feedView: UIView!

	var menuViewController: MenuViewController!
	var feedViewController: FeedViewController!
	
	var feedStartingX: CGFloat!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		var storyboard = UIStoryboard(name: "Main", bundle: nil)
		
		menuViewController = storyboard.instantiateViewControllerWithIdentifier("menuStory") as MenuViewController
		feedViewController = storyboard.instantiateViewControllerWithIdentifier("feedStory") as FeedViewController
		
		feedView.addSubview(feedViewController.view)
		menuView.addSubview(menuViewController.view)
		

		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	

	@IBAction func didPan(sender: UIPanGestureRecognizer) {
		var translation = sender.translationInView(view)
		var velocity = sender.velocityInView(view)
		
		
		if (sender.state == UIGestureRecognizerState.Began){
//			println(feedView.center.x)
			
			feedStartingX = feedView.center.x
			
//			if velocity.x < 0 {
//				feedView.center.x = 160
//			}

		}
			
		else if (sender.state == UIGestureRecognizerState.Changed) {
			println(feedView.center.x)

			if feedView.center.x == 160 || feedView.center.x < 421 {
				feedView.center.x = feedStartingX + translation.x

			}
			
			else {
				feedView.center.x = view.bounds.width/2
			}
			

			
		}
			
		else if (sender.state == UIGestureRecognizerState.Ended) {
			
			if velocity.x > 0 && feedView.center.x > 200 {
				UIView.animateWithDuration(0.3, animations: { () -> Void in
					self.feedView.center.x = 420
				})
			}
			else  {
				UIView.animateWithDuration(0.3, animations: { () -> Void in
					self.feedView.center.x = 160
				})

			
			}
			
			
		}

	}
	

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
