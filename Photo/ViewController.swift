import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var catPageControl: UIPageControl!
    @IBOutlet weak var catSegmentedControl: UISegmentedControl!
   
    
    let cat_Image = ["cat1","cat2","cat3"]
    var number : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ChangImage()
    }

    //Swipe
    @IBAction func changePage(_ sender: UISwipeGestureRecognizer) {
        
        if sender.direction == .left {
            number += 1
            if number < 3{
                ChangImage()}
            else{
                number = 0
                ChangImage()
            }
        }
        
        else if sender.direction == .right {
            number -= 1
            if number == -1 {
                number = 2
                ChangImage()}
            else{
               
                ChangImage()
            }
        }
    }
    
    //segmentedControl
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        number = sender.selectedSegmentIndex
        ChangImage()
    }
    
    //pageControl
    @IBAction func pageControl(_ sender: UIPageControl) {
        number = sender.currentPage
        ChangImage()
    }
    
    //上一頁
    @IBAction func previous(_ sender: Any) {
        number -= 1
        if number == -1 {
            number = 2
            ChangImage()
        }else{
            ChangImage()
        }
    }
    
    //下一頁
    @IBAction func next(_ sender: Any) {
        number += 1
        if number < 3 {
            ChangImage()
        }else{
            number = 0
            ChangImage()
        }
        
    }
    
    //同時改變的內容
    func ChangImage(){
        catImage.image = UIImage(named: cat_Image[number])
        catPageControl.currentPage = number
        catSegmentedControl.selectedSegmentIndex = number
    }

}

