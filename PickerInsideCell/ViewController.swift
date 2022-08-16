//
//  ViewController.swift
//  PickerInsideCell
//
//  Created by Sarath P on 16/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customTableView: UITableView!
    var datePicked: Date?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.customTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        
        self.customTableView.delegate = self
        self.customTableView.dataSource = self
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = customTableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
        cell.showDateBtn.addTarget(self, action:#selector(handleRegister), for: .touchUpInside)
        cell.showDateBtn.tag = indexPath.row
        return cell
    }
    
    @objc func handleRegister(sender: UIButton){
        alertTimePickerWithTextField( tag: sender.tag)
       
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    
    public func alertTimePickerWithTextField(title: String? = nil, message: String? = nil, placeholder: String? = nil, tag: Int, completion: @escaping ((String) -> Void) = { _ in }) {
        
        let datePicker = UIDatePicker()

            let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)

            let time = Date()
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "engb")
            formatter.dateFormat = "h:mm a"
            formatter.amSymbol = "AM"
            formatter.pmSymbol = "PM"
            formatter.string(from: time)
            //            .textColor = .link

            datePicker.datePickerMode = .time
            if #available(iOS 13.4, *) {
                datePicker.preferredDatePickerStyle = .wheels
            } else {
                // Fallback on earlier versions
            }
            alert.view.addSubview(datePicker)



            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) {  _ in completion("") })
            alert.addAction(UIAlertAction(title: "Ok", style: .default) { [self] action in

                

                let formatter = DateFormatter()
                formatter.locale = Locale(identifier: "en_gb")
                formatter.dateFormat = "h:mm a"
                formatter.amSymbol = "AM"
                formatter.pmSymbol = "PM"

                let dateInString = formatter.string(from: datePicker.date)

                
                let indexPath = IndexPath(row: tag, section: 0)
                let cell = customTableView.cellForRow(at: indexPath) as! CustomTableViewCell
                
                cell.dateLabel.text = dateInString
               

            })

            let height:NSLayoutConstraint = NSLayoutConstraint(item: alert.view!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 350)

            alert.view.addConstraint(height)

            self.present(alert, animated: true)
        }
    
    
}
