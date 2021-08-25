//
//  InfoView.swift
//  Nano0821
//
//  Created by Caroline Viana on 24/08/21.
//

import UIKit

struct Animal {
    let especie: String
    let nome: String
    let raca: String
    let sexo: String
    let nascimento: String
}

class InfoView: UIScrollView {
    
    let contentView = UIView()
    let information = Animal(especie: "Canina", nome: "Nico", raca: "Pinscher", sexo: "Macho", nascimento: "12/12/2014")
    
    let imgv = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(with myview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: myview.centerXAnchor).isActive = true
        widthAnchor.constraint(equalTo: myview.widthAnchor).isActive = true
        topAnchor.constraint(equalTo: myview.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: myview.bottomAnchor).isActive = true
        
        
        addSubview(contentView)
        contentView.backgroundColor = .blue
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        setupImgs()
    }
    
    func setupImgs(){
        contentView.layoutIfNeeded()
        let imgBackground = UIImage(named: "backgroundPatinhas")!
        imgv.image = imgBackground
        
        contentView.addSubview(imgv)
        imgv.translatesAutoresizingMaskIntoConstraints = false
        imgv.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        imgv.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        
        
        
        let imgPet = UIImage(systemName: "square.fill")!
        let imgvPet = UIImageView(image: imgPet)
        
        //imgv.center = center
        contentView.addSubview(imgvPet)
        let widthBackground = imgv.frame.width / 1.5
        imgvPet.translatesAutoresizingMaskIntoConstraints = false
        imgvPet.widthAnchor.constraint(equalToConstant: widthBackground).isActive = true
        imgvPet.heightAnchor.constraint(equalToConstant: widthBackground).isActive = true
        imgvPet.centerXAnchor.constraint(equalTo: imgv.centerXAnchor).isActive = true
        imgvPet.centerYAnchor.constraint(equalTo: imgv.centerYAnchor).isActive = true
        
        setupLabels()
    }
    
    func setupLabels(){
        contentView.layoutIfNeeded()
        let lblEspecie = CustomLabel(text: "Espécie: \(information.especie)", fontSize: 14)
        let lblNome = CustomLabel(text: "Nome: \(information.nome)", fontSize: 14)
        let lblRaca = CustomLabel(text: "Raça: \(information.raca)", fontSize: 14)
        let lblSexo = CustomLabel(text: "Sexo: \(information.sexo)", fontSize: 14)
        let lblNascimento = CustomLabel(text: "Data de nascimento: \(information.nascimento)", fontSize: 14)
        
        contentView.addSubview(lblEspecie)
        contentView.addSubview(lblNome)
        contentView.addSubview(lblRaca)
        contentView.addSubview(lblSexo)
        contentView.addSubview(lblNascimento)
        
        var constant = imgv.frame.height + 20
        
        lblEspecie.setupConstraints2(marginsView: contentView.layoutMarginsGuide, constant: constant)
        constant += lblEspecie.frame.height + 40
        lblNome.setupConstraints2(marginsView: contentView.layoutMarginsGuide, constant: constant)
        constant += lblEspecie.frame.height + 40
        lblRaca.setupConstraints2(marginsView: contentView.layoutMarginsGuide, constant: constant)
        constant += lblEspecie.frame.height + 40
        lblSexo.setupConstraints2(marginsView: contentView.layoutMarginsGuide, constant: constant)
        constant += lblEspecie.frame.height + 40
        lblNascimento.setupConstraints2(marginsView: contentView.layoutMarginsGuide, constant: constant)
        lblNascimento.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    
//    func addLabels(){
//        let label = CustomLabel(text: "Eu me desafiei na criação desse projeto de paixão, e, ironicamente, ele se tornou real em meio ao caos da vida adulta, no meio de uma pandemia. Foi uma oportunidade de colocar em prática e visualizar aquilo que eu sempre tive um intenso interesse, e assistir ele aos poucos tomar forma da ponta dos meus dedos enquanto a vida acontecia com a mesma intensidade. Mas, se tem uma coisa que eu aprendi com a teoria do caos, é que o caos nem sempre é ruim. O caos é fascinante. Nesta experiência, você pode ver os padrões 2D criados por 4 atratores estranhos: Lorenz, Aizawa, Thomas e Chua. Você pode observar qualquer um dos sistemas evoluindo em seu próprio comportamento caótico, dançando em torno do atrator, e como a computação e a matemática juntas podem ser poderosas e belas.Eu me desafiei na criação desse projeto de paixão, e, ironicamente, ele se tornou real em meio ao caos da vida adulta, no meio de uma pandemia. Foi uma oportunidade de colocar em prática e visualizar aquilo que eu sempre tive um intenso interesse, e assistir ele aos poucos tomar forma da ponta dos meus dedos enquanto a vida acontecia com a mesma intensidade. Mas, se tem uma coisa que eu aprendi com a teoria do caos, é que o caos nem sempre é ruim. O caos é fascinante. Nesta experiência, você pode ver os padrões 2D criados por 4 atratores estranhos: Lorenz, Aizawa, Thomas e Chua. Você pode observar qualquer um dos sistemas evoluindo em seu próprio comportamento caótico, dançando em torno do atrator, e como a computação e a matemática juntas podem ser poderosas e belas.Eu me desafiei na criação desse projeto de paixão, e, ironicamente, ele se tornou real em meio ao caos da vida adulta, no meio de uma pandemia. Foi uma oportunidade de colocar em prática e visualizar aquilo que eu sempre tive um intenso interesse, e assistir ele aos poucos tomar forma da ponta dos meus dedos enquanto a vida acontecia com a mesma intensidade. Mas, se tem uma coisa que eu aprendi com a teoria do caos, é que o caos nem sempre é ruim. O caos é fascinante. Nesta experiência, você pode ver os padrões 2D criados por 4 atratores estranhos: Lorenz, Aizawa, Thomas e Chua. Você pode observar qualquer um dos sistemas evoluindo em seu próprio comportamento caótico, dançando em torno do atrator, e como a computação e a matemática juntas podem ser poderosas e belas.Eu me desafiei na criação desse projeto de paixão, e, ironicamente, ele se tornou real em meio ao caos da vida adulta, no meio de uma pandemia. Foi uma oportunidade de colocar em prática e visualizar aquilo que eu sempre tive um intenso interesse, e assistir ele aos poucos tomar forma da ponta dos meus dedos enquanto a vida acontecia com a mesma intensidade. Mas, se tem uma coisa que eu aprendi com a teoria do caos, é que o caos nem sempre é ruim. O caos é fascinante. Nesta experiência, você pode ver os padrões 2D criados por 4 atratores estranhos: Lorenz, Aizawa, Thomas e Chua. Você pode observar qualquer um dos sistemas evoluindo em seu próprio comportamento caótico, dançando em torno do atrator, e como a computação e a matemática juntas podem ser poderosas e belas.Eu me desafiei na criação desse projeto de paixão, e, ironicamente, ele se tornou real em meio ao caos da vida adulta, no meio de uma pandemia. Foi uma oportunidade de colocar em prática e visualizar aquilo que eu sempre tive um intenso interesse, e assistir ele aos poucos tomar forma da ponta dos meus dedos enquanto a vida acontecia com a mesma intensidade. Mas, se tem uma coisa que eu aprendi com a teoria do caos, é que o caos nem sempre é ruim. O caos é fascinante. Nesta experiência, você pode ver os padrões 2D criados por 4 atratores estranhos: Lorenz, Aizawa, Thomas e Chua. Você pode observar qualquer um dos sistemas evoluindo em seu próprio comportamento caótico, dançando em torno do atrator, e como a computação e a matemática juntas podem ser poderosas e belas.Eu me desafiei na criação desse projeto de paixão, e, ironicamente, ele se tornou real em meio ao caos da vida adulta, no meio de uma pandemia. Foi uma oportunidade de colocar em prática e visualizar aquilo que eu sempre tive um intenso interesse, e assistir ele aos poucos tomar forma da ponta dos meus dedos enquanto a vida acontecia com a mesma intensidade. Mas, se tem uma coisa que eu aprendi com a teoria do caos, é que o caos nem sempre é ruim. O caos é fascinante. Nesta experiência, você pode ver os padrões 2D criados por 4 atratores estranhos: Lorenz, Aizawa, Thomas e Chua. Você pode observar qualquer um dos sistemas evoluindo em seu próprio comportamento caótico, dançando em torno do atrator, e como a computação e a matemática juntas podem ser poderosas e belas", fontSize: 16)
//        contentView.addSubview(label)
//
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
//        label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//        label.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
//        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
//    }
    
}
    
    
    
    
//
//    func setupLabels(){
//        // Espécie
//        // Nome
//        // Raça
//        // Sexo
//        // Data de nascimento
//
//        let lblEspecie = CustomLabel(text: "Espécie: \(information.especie)", fontSize: 14)
//        let lblNome = CustomLabel(text: "Nome: \(information.nome)", fontSize: 14)
//        let lblRaca = CustomLabel(text: "Raça: \(information.raca)", fontSize: 14)
//        let lblSexo = CustomLabel(text: "Sexo: \(information.sexo)", fontSize: 14)
//        let lblNascimento = CustomLabel(text: "Data de nascimento: \(information.nascimento)", fontSize: 14)
//
//        contentView.addSubview(lblEspecie)
//        contentView.addSubview(lblNome)
//        contentView.addSubview(lblRaca)
//        contentView.addSubview(lblSexo)
//        contentView.addSubview(lblNascimento)
//
//        lblEspecie.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: imgv.layoutMarginsGuide)
//        lblNome.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblEspecie.layoutMarginsGuide)
//        lblRaca.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblNome.layoutMarginsGuide)
//        lblSexo.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblRaca.layoutMarginsGuide)
//        lblNascimento.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblSexo.layoutMarginsGuide)
//
//
//        let lblEspecie2 = CustomLabel(text: "Espécie: \(information.especie)", fontSize: 14)
//        let lblNome2 = CustomLabel(text: "Nome: \(information.nome)", fontSize: 14)
//        let lblRaca2 = CustomLabel(text: "Raça: \(information.raca)", fontSize: 14)
//        let lblSexo2 = CustomLabel(text: "Sexo: \(information.sexo)", fontSize: 14)
//        let lblNascimento2 = CustomLabel(text: "Data de nascimento: \(information.nascimento)", fontSize: 14)
//
//        contentView.addSubview(lblEspecie2)
//        contentView.addSubview(lblNome2)
//        contentView.addSubview(lblRaca2)
//        contentView.addSubview(lblSexo2)
//        contentView.addSubview(lblNascimento2)
//
//        lblEspecie2.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblNascimento.layoutMarginsGuide)
//        lblNome2.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblEspecie2.layoutMarginsGuide)
//        lblRaca2.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblNome2.layoutMarginsGuide)
//        lblSexo2.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblRaca2.layoutMarginsGuide)
//        lblNascimento2.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblSexo2.layoutMarginsGuide)
//
//        let lblEspecie3 = CustomLabel(text: "Espécie: \(information.especie)", fontSize: 14)
//        let lblNome3 = CustomLabel(text: "Nome: \(information.nome)", fontSize: 14)
//        let lblRaca3 = CustomLabel(text: "Raça: \(information.raca)", fontSize: 14)
//        let lblSexo3 = CustomLabel(text: "Sexo: \(information.sexo)", fontSize: 14)
//        let lblNascimento3 = CustomLabel(text: "Data de nascimento: \(information.nascimento)", fontSize: 14)
//
//        contentView.addSubview(lblEspecie3)
//        contentView.addSubview(lblNome3)
//        contentView.addSubview(lblRaca3)
//        contentView.addSubview(lblSexo3)
//        contentView.addSubview(lblNascimento3)
//
//        lblEspecie3.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblNascimento2.layoutMarginsGuide)
//        lblNome3.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblEspecie3.layoutMarginsGuide)
//        lblRaca3.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblNome3.layoutMarginsGuide)
//        lblSexo3.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblRaca3.layoutMarginsGuide)
//        lblNascimento3.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblSexo3.layoutMarginsGuide)
//    }
//
//
//
//}

/*


class InfoView3: UIScrollView {
    
    let contentView = UIView()
    let information = Animal(especie: "Canina", nome: "Nico", raca: "Pinscher", sexo: "Macho", nascimento: "12/12/2014")
    
    let imgv = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupScreen(){
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .yellow
        
        contentView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        contentView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        contentView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        contentView.heightAnchor.constraint(equalTo: heightAnchor).priority = .defaultLow
        
        setupImgs()
//        setupLabels()
        
        
    }
    
    
    func setupImgs(){
        let imgBackground = UIImage(named: "backgroundPatinhas")!
        imgv.image = imgBackground
        
        contentView.addSubview(imgv)
        imgv.translatesAutoresizingMaskIntoConstraints = false
        imgv.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        imgv.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        
        
        let imgPet = UIImage(systemName: "square.fill")!
        let imgvPet = UIImageView(image: imgPet)
        
        //imgv.center = center
        contentView.addSubview(imgvPet)
        let widthBackground = imgv.frame.width / 1.5
        imgvPet.translatesAutoresizingMaskIntoConstraints = false
        imgvPet.widthAnchor.constraint(equalToConstant: widthBackground).isActive = true
        imgvPet.heightAnchor.constraint(equalToConstant: widthBackground).isActive = true
        imgvPet.centerXAnchor.constraint(equalTo: imgv.centerXAnchor).isActive = true
        imgvPet.centerYAnchor.constraint(equalTo: imgv.centerYAnchor).isActive = true
        
    }
    
    
    
//
//    func setupLabels(){
//        // Espécie
//        // Nome
//        // Raça
//        // Sexo
//        // Data de nascimento
//
//        let lblEspecie = CustomLabel(text: "Espécie: \(information.especie)", fontSize: 14)
//        let lblNome = CustomLabel(text: "Nome: \(information.nome)", fontSize: 14)
//        let lblRaca = CustomLabel(text: "Raça: \(information.raca)", fontSize: 14)
//        let lblSexo = CustomLabel(text: "Sexo: \(information.sexo)", fontSize: 14)
//        let lblNascimento = CustomLabel(text: "Data de nascimento: \(information.nascimento)", fontSize: 14)
//
//        contentView.addSubview(lblEspecie)
//        contentView.addSubview(lblNome)
//        contentView.addSubview(lblRaca)
//        contentView.addSubview(lblSexo)
//        contentView.addSubview(lblNascimento)
//
//        lblEspecie.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: imgv.layoutMarginsGuide)
//        lblNome.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblEspecie.layoutMarginsGuide)
//        lblRaca.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblNome.layoutMarginsGuide)
//        lblSexo.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblRaca.layoutMarginsGuide)
//        lblNascimento.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblSexo.layoutMarginsGuide)
//
//
//        let lblEspecie2 = CustomLabel(text: "Espécie: \(information.especie)", fontSize: 14)
//        let lblNome2 = CustomLabel(text: "Nome: \(information.nome)", fontSize: 14)
//        let lblRaca2 = CustomLabel(text: "Raça: \(information.raca)", fontSize: 14)
//        let lblSexo2 = CustomLabel(text: "Sexo: \(information.sexo)", fontSize: 14)
//        let lblNascimento2 = CustomLabel(text: "Data de nascimento: \(information.nascimento)", fontSize: 14)
//
//        contentView.addSubview(lblEspecie2)
//        contentView.addSubview(lblNome2)
//        contentView.addSubview(lblRaca2)
//        contentView.addSubview(lblSexo2)
//        contentView.addSubview(lblNascimento2)
//
//        lblEspecie2.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblNascimento.layoutMarginsGuide)
//        lblNome2.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblEspecie2.layoutMarginsGuide)
//        lblRaca2.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblNome2.layoutMarginsGuide)
//        lblSexo2.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblRaca2.layoutMarginsGuide)
//        lblNascimento2.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblSexo2.layoutMarginsGuide)
//
//        let lblEspecie3 = CustomLabel(text: "Espécie: \(information.especie)", fontSize: 14)
//        let lblNome3 = CustomLabel(text: "Nome: \(information.nome)", fontSize: 14)
//        let lblRaca3 = CustomLabel(text: "Raça: \(information.raca)", fontSize: 14)
//        let lblSexo3 = CustomLabel(text: "Sexo: \(information.sexo)", fontSize: 14)
//        let lblNascimento3 = CustomLabel(text: "Data de nascimento: \(information.nascimento)", fontSize: 14)
//
//        contentView.addSubview(lblEspecie3)
//        contentView.addSubview(lblNome3)
//        contentView.addSubview(lblRaca3)
//        contentView.addSubview(lblSexo3)
//        contentView.addSubview(lblNascimento3)
//
//        lblEspecie3.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblNascimento2.layoutMarginsGuide)
//        lblNome3.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblEspecie3.layoutMarginsGuide)
//        lblRaca3.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblNome3.layoutMarginsGuide)
//        lblSexo3.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblRaca3.layoutMarginsGuide)
//        lblNascimento3.setupConstraints(marginsView: contentView.layoutMarginsGuide, lastItem: lblSexo3.layoutMarginsGuide)
//    }

    
   
}




class InfoView2: UIScrollView {
    
    let information = Animal(especie: "Canina", nome: "Nico", raca: "Pinscher", sexo: "Macho", nascimento: "12/12/2014")
    
    //let cl = CustomLabel(text: "Hey", fontSize: 14)
    
    let contentView = UIView(frame: .zero)
    let imgv = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupScreen() {
        addSubview(contentView)
        contentView.backgroundColor = .red
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        setupImgs()
        setupLabels()
        
        contentView.layoutIfNeeded()
        contentSize = CGSize(width: frame.size.width, height: contentView.frame.height)
    }
    
    func setupImgs(){
        let imgBackground = UIImage(named: "backgroundPatinhas")!
        imgv.image = imgBackground
        
        contentView.addSubview(imgv)
        imgv.translatesAutoresizingMaskIntoConstraints = false
        imgv.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        imgv.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        
        
        let imgPet = UIImage(systemName: "square.fill")!
        let imgvPet = UIImageView(image: imgPet)
        
        //imgv.center = center
        contentView.addSubview(imgvPet)
        let widthBackground = imgv.frame.width / 1.5
        imgvPet.translatesAutoresizingMaskIntoConstraints = false
        imgvPet.widthAnchor.constraint(equalToConstant: widthBackground).isActive = true
        imgvPet.heightAnchor.constraint(equalToConstant: widthBackground).isActive = true
        imgvPet.centerXAnchor.constraint(equalTo: imgv.centerXAnchor).isActive = true
        imgvPet.centerYAnchor.constraint(equalTo: imgv.centerYAnchor).isActive = true
        
    }
    
    func setupLabels(){
        // Espécie
        // Nome
        // Raça
        // Sexo
        // Data de nascimento
        
        let lblEspecie = CustomLabel(text: "Espécie: \(information.especie)", fontSize: 14)
        let lblNome = CustomLabel(text: "Nome: \(information.nome)", fontSize: 14)
        let lblRaca = CustomLabel(text: "Raça: \(information.raca)", fontSize: 14)
        let lblSexo = CustomLabel(text: "Sexo: \(information.sexo)", fontSize: 14)
        let lblNascimento = CustomLabel(text: "Data de nascimento: \(information.nascimento)", fontSize: 14)
        
        contentView.addSubview(lblEspecie)
        contentView.addSubview(lblNome)
        contentView.addSubview(lblRaca)
        contentView.addSubview(lblSexo)
        contentView.addSubview(lblNascimento)
        
        lblEspecie.setupConstraints(marginsView: layoutMarginsGuide, lastItem: imgv.layoutMarginsGuide)
        lblNome.setupConstraints(marginsView: layoutMarginsGuide, lastItem: lblEspecie.layoutMarginsGuide)
        lblRaca.setupConstraints(marginsView: layoutMarginsGuide, lastItem: lblNome.layoutMarginsGuide)
        lblSexo.setupConstraints(marginsView: layoutMarginsGuide, lastItem: lblRaca.layoutMarginsGuide)
        lblNascimento.setupConstraints(marginsView: layoutMarginsGuide, lastItem: lblSexo.layoutMarginsGuide)
        
        
        let lblEspecie2 = CustomLabel(text: "Espécie: \(information.especie)", fontSize: 14)
        let lblNome2 = CustomLabel(text: "Nome: \(information.nome)", fontSize: 14)
        let lblRaca2 = CustomLabel(text: "Raça: \(information.raca)", fontSize: 14)
        let lblSexo2 = CustomLabel(text: "Sexo: \(information.sexo)", fontSize: 14)
        let lblNascimento2 = CustomLabel(text: "Data de nascimento: \(information.nascimento)", fontSize: 14)
        
        contentView.addSubview(lblEspecie2)
        contentView.addSubview(lblNome2)
        contentView.addSubview(lblRaca2)
        contentView.addSubview(lblSexo2)
        contentView.addSubview(lblNascimento2)
        
        lblEspecie2.setupConstraints(marginsView: layoutMarginsGuide, lastItem: lblNascimento.layoutMarginsGuide)
        lblNome2.setupConstraints(marginsView: layoutMarginsGuide, lastItem: lblEspecie2.layoutMarginsGuide)
        lblRaca2.setupConstraints(marginsView: layoutMarginsGuide, lastItem: lblNome2.layoutMarginsGuide)
        lblSexo2.setupConstraints(marginsView: layoutMarginsGuide, lastItem: lblRaca2.layoutMarginsGuide)
        lblNascimento2.setupConstraints(marginsView: layoutMarginsGuide, lastItem: lblSexo2.layoutMarginsGuide)
        
        let lblEspecie3 = CustomLabel(text: "Espécie: \(information.especie)", fontSize: 14)
        let lblNome3 = CustomLabel(text: "Nome: \(information.nome)", fontSize: 14)
        let lblRaca3 = CustomLabel(text: "Raça: \(information.raca)", fontSize: 14)
        let lblSexo3 = CustomLabel(text: "Sexo: \(information.sexo)", fontSize: 14)
        let lblNascimento3 = CustomLabel(text: "Data de nascimento: \(information.nascimento)", fontSize: 14)
        
        contentView.addSubview(lblEspecie3)
        contentView.addSubview(lblNome3)
        contentView.addSubview(lblRaca3)
        contentView.addSubview(lblSexo3)
        contentView.addSubview(lblNascimento3)
        
        lblEspecie3.setupConstraints(marginsView: layoutMarginsGuide, lastItem: lblNascimento2.layoutMarginsGuide)
        lblNome3.setupConstraints(marginsView: layoutMarginsGuide, lastItem: lblEspecie3.layoutMarginsGuide)
        lblRaca3.setupConstraints(marginsView: layoutMarginsGuide, lastItem: lblNome3.layoutMarginsGuide)
        lblSexo3.setupConstraints(marginsView: layoutMarginsGuide, lastItem: lblRaca3.layoutMarginsGuide)
        lblNascimento3.setupConstraints(marginsView: layoutMarginsGuide, lastItem: lblSexo3.layoutMarginsGuide)
    }
    
}
*/
