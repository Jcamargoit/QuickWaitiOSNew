//
//  DeveloperViewModel.swift
//  Quick Wait Xib
//
//  Created by Framework Digital on 06/04/22.
//

import Foundation
import RxSwift
import RxRelay

class DeveloperViewModel {
    var dataSource: BehaviorRelay<DeveloperModel> = BehaviorRelay<DeveloperModel>(value: DeveloperModel())

    func bindViewModel() {
        var data: DeveloperModel = []
        data.append(contentsOf: [
            DeveloperModelElement(id: 0, name: "Teste1", ocupation: "Desenvolvedor",
                                  description: "sdlfhadlksjfghsnslkdjfskf"
                                  + "sldkjfkasdfaskajdf ksdkfjasld asdlfjasdjljsa "
                                  + "dflsdjfalsdlfjasdfjksdjf sdjfajskdfl", email: "teste@gmail.com", imageURL: "teste"),
            DeveloperModelElement(id: 1, name: "Teste1", ocupation: "Desenvolvedor",
                                  description: "sdlfhadlksjfghsnslkdjfskf"
                                  + "sldkjfkasdfaskajdf ksdkfjasld asdlfjasdjljsa "
                                  + "dflsdjfalsdlfjasdfjksdjf sdjfajskdfl", email: "teste@gmail.com", imageURL: "teste"),
            DeveloperModelElement(id: 2, name: "Teste1", ocupation: "Desenvolvedor",
                                  description: "sdlfhadlksjfghsnslkdjfskf"
                                  + "sldkjfkasdfaskajdf ksdkfjasld asdlfjasdjljsa "
                                  + "dflsdjfalsdlfjasdfjksdjf sdjfajskdfl", email: "teste@gmail.com", imageURL: "teste"),
            DeveloperModelElement(id: 3, name: "Teste1", ocupation: "Desenvolvedor",
                                  description: "sdlfhadlksjfghsnslkdjfskf"
                                  + "sldkjfkasdfaskajdf ksdkfjasld asdlfjasdjljsa "
                                  + "dflsdjfalsdlfjasdfjksdjf sdjfajskdfl", email: "teste@gmail.com", imageURL: "teste"),
            DeveloperModelElement(id: 4, name: "Teste1", ocupation: "Desenvolvedor",
                                  description: "sdlfhadlksjfghsnslkdjfskf"
                                  + "sldkjfkasdfaskajdf ksdkfjasld asdlfjasdjljsa "
                                  + "dflsdjfalsdlfjasdfjksdjf sdjfajskdfl", email: "teste@gmail.com", imageURL: "teste")
                        ])

        self.dataSource.accept(data)
    }
}
