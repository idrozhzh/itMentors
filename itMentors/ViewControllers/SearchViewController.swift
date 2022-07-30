//
//  SearchViewController.swift
//  itMentors
//
//  Created by igor s on 28.07.2022.
//

import UIKit

class SearchViewController: UIViewController {

    let mentorsList = Mentor.getMentorsList()
    var cities: [String] = []
    var activities: [String] = []
    var selectedCity = ""
    var selectedActivity = ""
    var sortedList: [Mentor] = []
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var activityTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        searchButton.layer.cornerRadius = 10
        //в textField вместо клавиатуры будет выходить pickerView
        select()
        //выделяем города в отдельный массив, по алфавиту
        cities = Array(Set(mentorsList.map { $0.city })).sorted(by: <)
        //отдельный массив направлений, по авлфавиту
        activities = Array(Set(mentorsList.map { $0.scope })).sorted(by: <)
    }
    
    func select() {
        let cityPicker = UIPickerView()
        cityPicker.delegate = self
        cityPicker.tag = 0
        cityTextField.inputView = cityPicker
        
        let activityPicker = UIPickerView()
        activityPicker.delegate = self
        activityPicker.tag = 1
        activityTextField.inputView = activityPicker
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func searchButtonPressed() {
        sortedList = mentorsList.filter { $0.city == selectedCity }
        sortedList = sortedList.filter { $0.scope == selectedActivity }
        for mentor in sortedList {
            print("\(mentor.fullname)\n\(mentor.city)\n\(mentor.scope)\n")
        }
    }
    
    

}

extension SearchViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    //возвращает количество барабанов
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //кол-во элементов, доступных в pickerView
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0: return cities.count
        default: return activities.count
        }
    }
    //позволяет отображать в каждой строке PickerView определенное значение
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0: return cities[row]
        default: return activities[row]
        }
    }
    //позволяет работать с выбранным элементом
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            selectedCity = cities[row]
            cityTextField.text = selectedCity
        default:
            selectedActivity = activities[row]
            activityTextField.text = selectedActivity
        }
    }
    //кастомизация элементов pickerView
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        <#code#>
//    }
}
