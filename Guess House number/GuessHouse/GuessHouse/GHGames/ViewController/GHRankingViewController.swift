//   
    

import UIKit
import FSPagerView

class GHRankingViewController: UIViewController, FSPagerViewDataSource, FSPagerViewDelegate {

    lazy var viewPager: FSPagerView = {
        let viewPager = FSPagerView()
        viewPager.frame = CGRect.init(x: 0, y: 50, width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height - 90)
        viewPager.dataSource = self
        viewPager.delegate = self
        viewPager.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        
        let transform = CGAffineTransform(scaleX: 0.6, y: 1)
        viewPager.itemSize = viewPager.frame.size.applying(transform)
        viewPager.decelerationDistance = FSPagerView.automaticDistance

//        viewPager.interitemSpacing = 1.0

        viewPager.isInfinite = true
        viewPager.transformer = FSPagerViewTransformer(type: .linear)

        return viewPager
    }()

    
    @IBOutlet var easy: [UILabel]!
       
    @IBOutlet var hard: [UILabel]!
   
    deinit {
        print("jjjjjj")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(viewPager)
        
        let ss = UserDefaults.standard.array(forKey: "easyGame")
        let dd = UserDefaults.standard.array(forKey: "hardGame")
       
        if ss != nil{
            for i in easy.indices{
                print("11111")
                easy[i].text = "\(ss![i])"
            }
        }
        if dd != nil{
                for i in easy.indices{
                    hard[i].text = "\(dd![i])"                }
        }
    }


    @IBAction func goBackHome(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
   
    
    func numberOfItems(in pagerView: FSPagerView) -> Int{
        return 3
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell{
        
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
       
        
        cell.imageView?.image = UIImage.init(named: "simple(1)")
        if (cell.imageView?.subviews.count)! < 1{
            let kkk  = GHRankingView.init(frame: cell.imageView!.frame)
            kkk.gameLieve = Gamelevel(rawValue: index)

            cell.imageView?.addSubview(kkk.backView)

        }
        return cell
    }

}
