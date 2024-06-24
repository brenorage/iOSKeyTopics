// Principios KISS

import UIKit
import PlaygroundSupport

//Base code
var view = UIView(frame: .init(x: 0, y: 0, width: 500, height: 500))
var label = UILabel(frame: CGRect.init(x: 150, y: 10, width: 200, height: 150))
label.text = "Ola todo mundo"
label.textColor = .red
label.textAlignment = .center


var button = UIButton(frame: .init(x: 0, y: 230, width: 100, height: 100))
button.titleLabel?.text = "Botão"
button.titleLabel?.textColor = .blue
button.backgroundColor = .brown

view.addSubview(label)
view.addSubview(button)

//Simplicidade / Clareza

var namesArray = ["Bernardo", "Breno", "Jorge", "João", "Leandro"]

func find(firstNameWith numberOfLetters: Int, in names: [String]) -> String? {
    for name in names {
        if name.count == numberOfLetters {
            return name
        }
    }
    return nil
}

//func find(firstNameWith numberOfLetters: Int, in names: [String]) -> String? {
//    names.first(where: { name in name.count == numberOfLetters })
//}

label.text = find(firstNameWith: 5, in: namesArray)


// Redução de complexidade / Legibilidade

var isSuccess = false

if isSuccess {
    label.textColor = .green
} else {
    label.textColor = .red
}

//label.textColor = isSuccess ? .green : .red

// Menos é mais / Eficiencia / Substituições adequadas

class Cake {
    private var basicIngredients = ["Floor", "Sugar", "Egg"]
    
//    func getChocolateCakeIngredientsInLine() -> String {
//        basicIngredients.append("Chocolate")
//        var ingredientsInLine = ""
//        
//        basicIngredients.forEach { Ingredient in
//            ingredientsInLine = "\(Ingredient) ,"
//        }
//        
//        return ingredientsInLine
//    }
    
    func getChocolateCakeIngredientsInLine() -> String {
        basicIngredients.append("Chocolate")
        return basicIngredients.joined(separator: " ,")
    }
    
    func getNumberOfBasicIngredients() -> Int {
        basicIngredients.count
    }
    
    var numberOfBasicIngredients: Int { basicIngredients.count }
}

Cake().getChocolateCakeIngredientsInLine()
Cake().getNumberOfBasicIngredients()
Cake().numberOfBasicIngredients

// Facilidade de manutenção

func getWorldCupTitles(for nation: String) -> String{
    if nation == "Brasil" {
        "Brasil tem 5 titulos mundiais"
    } else if nation == "Argentina" {
        "Argentina tem 3 titulos mundiais"
    } else if nation == "Itália" {
        "Itália tem 4 titulos mundiais"
    } else if nation == "Alemanha" {
        "Alemanha tem 4 titulos mundiais"
    } else if nation == "Espanha" {
        "Espanha tem 1 titulo"
    } else {
        "País não cadastrado"
    }
}

print(getWorldCupTitles(for: "Brasil"))
print(getWorldCupTitles(for: "Uruguai"))

//enum WorldCupInfosByNation: String {
//    case Brasil
//    case Argetina
//    case Alemanha
//    case Espanha
//    case unknown
//    
//    var titlesInfo: String {
//        switch self {
//        case .Alemanha:
//            "Alemanha tem 4 titulos mundiais"
//        case .Argetina:
//            "Argentina tem 3 titulos mundiais"
//        case .Brasil:
//            "Brasil tem 5 titulos mundiais"
//        case .Espanha:
//            "Espanha tem 1 titulo"
//        case .unknown:
//            "País não cadastrado"
//        }
//    }
//}
//
//func showInfo(for nation: String) {
//    var nationInfo = WorldCupInfosByNation(rawValue: nation)
//    print(nationInfo?.titlesInfo ?? WorldCupInfosByNation.unknown.titlesInfo)
//}
//
//showInfo(for: "Brasil")
//showInfo(for: "Uruguai")



// SOLID

//Single-responsibility principle
//Cada um no seu quadrado. Cada classe/função deve ter somente 1 responsabilidade.
//Classe Printer tem mais de 1 responsabilidade, ela nao deveria formatar e imprimir

class Printer {
    
    private var formatter = Formatter()
    
    func printMessage(_ string: String) {
        print(formatter.formatMessage(string))
    }
    
    //Metodo que foge da responsabilidade
//    private func formatMessage(_ string: String) -> String {
//        string + "\n Volte Sempre"
//    }
}

//Responsabilidade separada
class Formatter {
    func formatMessage(_ string: String) -> String {
        string + "\n Volte Sempre"
    }
}

var printer = Printer()
printer.printMessage("Ola, tudo bem?")


//Open–closed principle
//As entidades deveriam estar abertas para extensão porém fechadas para modificação
//Aqui vamos mostar como abstrair a classe Deeplink pra aderir ao principio
struct Letter {
    let content: String
}

class PostalService {
    func sendByCorreios(letterContent: String) {
        //Call correios service
    }
    
    func sendByFedEx(letterContent: String) {
        //Call FedEx Service
    }
    
    //Modificaçao
    func sendByPigeon(letterContent: String) {
        //Call Homming Pigeon
    }
}


class Company {
    var postalService: PostalService
    
    init(postalService: PostalService) {
        self.postalService = postalService
    }
    
    func sendALetter() {
        postalService.sendByCorreios(letterContent: "Ola pessoal, tudo bem?")
    }
}

var postalService = PostalService()
Company(postalService: postalService).sendALetter()

//Solução

//protocol PostalServiceProtocol {
//    func send(letterContent: String)
//}
//
//class FedExService: PostalServiceProtocol {
//    func send(letterContent: String) {
//        //Call FedEx Service
//    }
//}
//
//class CorreiosService: PostalServiceProtocol {
//    func send(letterContent: String) {
//        //Call Correios Service
//    }
//}
//
//class Company {
//    var postalService: PostalServiceProtocol
//    
//    init(postalService: PostalServiceProtocol) {
//        self.postalService = postalService
//    }
//    
//    func sendALetter() {
//        postalService.send(letterContent: "Ola pessoal, tudo bem?")
//    }
//}
//
//var correiosService = CorreiosService()
//Company(postalService: correiosService).sendALetter()

//Liskov substitution principle
//Um comportamento herdado não deveria ser modificado pelo herdeiro
//Classe pintor tem um comportamento, a classe que extende pintor modifica esse comportamento o que faz com que o comportamento herdado seja modificado

class Painter {
    func paint(with color: UIColor) {
        print("pintando a parede")
    }
}

class WallPainter: Painter {
    override func paint(with color: UIColor) {
        if color == UIColor.white {
            print("pintando a parede de branco")
        }
        
        super.paint(with: color)
    }
}


WallPainter().paint(with: .black)
WallPainter().paint(with: .white)

//Interface segregation principle
//Os clientes do seu protocolo não deveriam ser forçados a usar métodos que eles não precisam usar
//Protocolo POS tem metodos que atendem a todos os tipos de POS, porem alguns nao tem determinadas funcionalidades

protocol POS {
    func readBarcode()
    func readCard()
    func readNFC()
    func print()
}

class AndroidPOS: POS {
    func readBarcode() {
        //Open Camera
    }
    
    func readCard() {
        //Open Card Reader
    }
    
    func readNFC() {
        //Start NFC listener
    }
    
    func print() {
        //Start printer service
    }
}

class MPOS: POS {
    func readBarcode() {
        //There's no camera
    }
    
    func print() {
        //There's no printer
    }
    
    func readCard() {
        //Open Card Reader
    }
    
    func readNFC() {
        //Start NFC listener
    }
}

//Solução
//Podemos quebrar as interfaces

//protocol BarcodeReader {
//    func readBarcode()
//}
//
//protocol CardReader {
//    func readCard()
//    func readNFC()
//}
//
//protocol POSPrinter {
//    func print()
//}
//
//class MPOS: CardReader {
//    func readCard() {
//        //Open Card Reader
//    }
//    
//    func readNFC() {
//        //Start NFC listener
//    }
//}
//
//class AndroidPOS: BarcodeReader, CardReader, POSPrinter {
//    func readBarcode() {
//        //Open Camera
//    }
//    
//    func readCard() {
//        //Open Card Reader
//    }
//    
//    func readNFC() {
//        //Start NFC listener
//    }
//    
//    func print() {
//        //Start printer service
//    }
//}

//Dependency inversion principle
//As classes deveriam depender de protocolos e não de outras classes
//Repository usa a implementação do serviço, para um teste automatizado teriamos problemas aqui

class PaymentsService {
    
    func getPayments() {
        //Call network
        //Return payment history
    }
}

class Repository {
    var paymentService: PaymentsService
    init(paymentService: PaymentsService) {
        self.paymentService = paymentService
    }
    
    func getHistory() {
        paymentService.getPayments()
    }
}

var paymentService = PaymentsService()
var repository = Repository(paymentService: paymentService)

//Solução
//Abstraimos o service no protocolo e o repository nao sabe mais que é um service

//protocol PaymentsServiceProtocol {
//    func getPayments()
//}
//
//class PaymentsService: PaymentsServiceProtocol {
//    
//    func getPayments() {
//        //Call network
//        //Return payment history
//    }
//}
//
//class Repository {
//    var paymentService: PaymentsServiceProtocol
//    init(paymentService: PaymentsServiceProtocol) {
//        self.paymentService = paymentService
//    }
//    
//    func getHistory() {
//        paymentService.getPayments()
//    }
//}
//
//var paymentService: PaymentsServiceProtocol = PaymentsService()
//var repository = Repository(paymentService: paymentService)



//PlaygroundPage.current.liveView = view
//PlaygroundPage.current.needsIndefiniteExecution = true
