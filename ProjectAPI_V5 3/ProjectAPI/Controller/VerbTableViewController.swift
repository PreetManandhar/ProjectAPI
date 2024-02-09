//
//  VerbTableViewController.swift
//  ProjectAPI
//
//  Created by english on 2023-11-14.
//

import UIKit

class VerbTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var txtVerb: UITextField!
    @IBOutlet weak var TensesTableView: UITableView!

    // Assuming you want to display these tenses
    //var tenses = ["Present Indicative", "Imparfait Indicative", "Futur Indicative", "Conditionnel Present", "Subjoinctif Present"]
    var tenses = ["List of Tenses"]

    var verbData: [String: String]?   // Declare a variable to store the retrieved verb

    override func viewDidLoad() {
        super.viewDidLoad()

        TensesTableView.dataSource = self
        TensesTableView.delegate = self
        TensesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TenseCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tenses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TenseCell", for: indexPath)

        cell.textLabel?.text = tenses[indexPath.row]
        /*
        if let verbData = self.verbData {
            cell.textLabel?.text = verbData[tenses[indexPath.row]]
        } else {
            cell.textLabel?.text = "No verb data available"
        }
*/
        return cell
    }

    @IBAction func btnFetchVerbTouchUpInside(_ sender: Any) {
        if Context.loggedUserToken == nil {
            print("Log in first")
            return
        }

        FrenchVerbAPI.getVerb(verb: txtVerb.text!) { frenchVerb in
           
            //conditional
            self.tenses.append("        Conditionnel Present")
            self.tenses.append(frenchVerb.conditionnel!.present!.i!)
            self.tenses.append(frenchVerb.conditionnel!.present!.you!)
            self.tenses.append(frenchVerb.conditionnel!.present!.heSheIt!)
            self.tenses.append(frenchVerb.conditionnel!.present!.we!)
            self.tenses.append(frenchVerb.conditionnel!.present!.youAll!)
            self.tenses.append(frenchVerb.conditionnel!.present!.they!)
            
            self.tenses.append("        Conditionnel Passe1")
            self.tenses.append(frenchVerb.conditionnel!.passe1reForme!.i!)
            self.tenses.append(frenchVerb.conditionnel!.passe1reForme!.you!)
            self.tenses.append(frenchVerb.conditionnel!.passe1reForme!.heSheIt!)
            self.tenses.append(frenchVerb.conditionnel!.passe1reForme!.we!)
            self.tenses.append(frenchVerb.conditionnel!.passe1reForme!.youAll!)
            self.tenses.append(frenchVerb.conditionnel!.passe1reForme!.they!)
            
            
            self.tenses.append("        Conditionnel Passe2")
            self.tenses.append(frenchVerb.conditionnel!.passe2eForme!.i!)
            self.tenses.append(frenchVerb.conditionnel!.passe2eForme!.you!)
            self.tenses.append(frenchVerb.conditionnel!.passe2eForme!.heSheIt!)
            self.tenses.append(frenchVerb.conditionnel!.passe2eForme!.we!)
            self.tenses.append(frenchVerb.conditionnel!.passe2eForme!.youAll!)
            self.tenses.append(frenchVerb.conditionnel!.passe2eForme!.they!)
            
            //imperatif
            self.tenses.append("        Imperatif Present")
            self.tenses.append(frenchVerb.imperatif!.present!.first!)
            self.tenses.append(frenchVerb.imperatif!.present!.second!)
            self.tenses.append(frenchVerb.imperatif!.present!.third!)
            
            self.tenses.append("        Imperatif Passe")
            self.tenses.append(frenchVerb.imperatif!.passe!.first!)
            self.tenses.append(frenchVerb.imperatif!.passe!.second!)
            self.tenses.append(frenchVerb.imperatif!.passe!.third!)
            
            //indicatif
            self.tenses.append("       Indicatif Present    ")
            self.tenses.append(frenchVerb.indicatif!.present!.i!)
            self.tenses.append(frenchVerb.indicatif!.present!.you!)
            self.tenses.append(frenchVerb.indicatif!.present!.heSheIt!)
            self.tenses.append(frenchVerb.indicatif!.present!.we!)
            self.tenses.append(frenchVerb.indicatif!.present!.youAll!)
            self.tenses.append(frenchVerb.indicatif!.present!.they!)
            
            self.tenses.append("       Indicatif Passe Simple    ")
            self.tenses.append(frenchVerb.indicatif!.passeSimple!.i!)
            self.tenses.append(frenchVerb.indicatif!.passeSimple!.you!)
            self.tenses.append(frenchVerb.indicatif!.passeSimple!.heSheIt!)
            self.tenses.append(frenchVerb.indicatif!.passeSimple!.we!)
            self.tenses.append(frenchVerb.indicatif!.passeSimple!.youAll!)
            self.tenses.append(frenchVerb.indicatif!.passeSimple!.they!)
            
            
            self.tenses.append("       Indicatif Imparfait ")
            self.tenses.append(frenchVerb.indicatif!.imparfait!.i!)
            self.tenses.append(frenchVerb.indicatif!.imparfait!.you!)
            self.tenses.append(frenchVerb.indicatif!.imparfait!.heSheIt!)
            self.tenses.append(frenchVerb.indicatif!.imparfait!.we!)
            self.tenses.append(frenchVerb.indicatif!.imparfait!.youAll!)
            self.tenses.append(frenchVerb.indicatif!.imparfait!.they!)
            
            self.tenses.append("       Passe Compose ")
            self.tenses.append(frenchVerb.indicatif!.passeCompose!.i!)
            self.tenses.append(frenchVerb.indicatif!.passeCompose!.you!)
            self.tenses.append(frenchVerb.indicatif!.passeCompose!.heSheIt!)
            self.tenses.append(frenchVerb.indicatif!.passeCompose!.we!)
            self.tenses.append(frenchVerb.indicatif!.passeCompose!.youAll!)
            self.tenses.append(frenchVerb.indicatif!.passeCompose!.they!)
            
            
            self.tenses.append("       Indicatif FuturSimple")
            self.tenses.append(frenchVerb.indicatif!.futurSimple!.i!)
            self.tenses.append(frenchVerb.indicatif!.futurSimple!.you!)
            self.tenses.append(frenchVerb.indicatif!.futurSimple!.heSheIt!)
            self.tenses.append(frenchVerb.indicatif!.futurSimple!.we!)
            self.tenses.append(frenchVerb.indicatif!.futurSimple!.youAll!)
            self.tenses.append(frenchVerb.indicatif!.futurSimple!.they!)
            
            self.tenses.append("       Indicatif PasseAnterieur")
            self.tenses.append(frenchVerb.indicatif!.passeAnterieur!.i!)
            self.tenses.append(frenchVerb.indicatif!.passeAnterieur!.you!)
            self.tenses.append(frenchVerb.indicatif!.passeAnterieur!.heSheIt!)
            self.tenses.append(frenchVerb.indicatif!.passeAnterieur!.we!)
            self.tenses.append(frenchVerb.indicatif!.passeAnterieur!.youAll!)
            self.tenses.append(frenchVerb.indicatif!.passeAnterieur!.they!)
            
            self.tenses.append("       Indicatif PlusQueParfait")
            self.tenses.append(frenchVerb.indicatif!.plusQueParfait!.i!)
            self.tenses.append(frenchVerb.indicatif!.plusQueParfait!.you!)
            self.tenses.append(frenchVerb.indicatif!.plusQueParfait!.heSheIt!)
            self.tenses.append(frenchVerb.indicatif!.plusQueParfait!.we!)
            self.tenses.append(frenchVerb.indicatif!.plusQueParfait!.youAll!)
            self.tenses.append(frenchVerb.indicatif!.plusQueParfait!.they!)
            
            self.tenses.append("       Indicatif FuturAnterieur")
            self.tenses.append(frenchVerb.indicatif!.futurAnterieur!.i!)
            self.tenses.append(frenchVerb.indicatif!.futurAnterieur!.you!)
            self.tenses.append(frenchVerb.indicatif!.futurAnterieur!.heSheIt!)
            self.tenses.append(frenchVerb.indicatif!.futurAnterieur!.we!)
            self.tenses.append(frenchVerb.indicatif!.futurAnterieur!.youAll!)
            self.tenses.append(frenchVerb.indicatif!.futurAnterieur!.they!)
            
        
            //infinitive
            self.tenses.append("       Infinitive Present    ")
            self.tenses.append(frenchVerb.infinitive!.present!)
            self.tenses.append(frenchVerb.infinitive!.passe!)

            
            
            /*
            self.verbData = [
                "Present Indicative": frenchVerb.indicatif?.present?.i,
                "Imparfait Indicative": frenchVerb.indicatif?.imparfait?.i,
                "Futur Indicative": frenchVerb.indicatif?.futurSimple?.i,
                "Conditionnel Present": frenchVerb.conditionnel?.present?.i,
                "Subjoinctif Present": frenchVerb.subjonctif?.present?.i
            ]
*/
             // Reload the table view to reflect the new data
        } failHandler: { httpStatusCode, errorMessage in
            print("Error code \(httpStatusCode) - \(errorMessage)")
            // Show an alert with the error message
            self.showAlert(message: "Failed to fetch verb data.")
        }
        self.TensesTableView.reloadData()
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
