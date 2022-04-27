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

    let urlImage: String = "https://static8.depositphotos.com/1003924/886/i/950/"
                            + "depositphotos_8868243-stock-photo-spectrum-multicolored-eye-macro.jpg"

    let urlImage2: String = "https://st.depositphotos.com/1005147/2003/i/950/"
                            + "depositphotos_20039673-stock-photo-brunette-girl-with-colour-balloons.jpg"

    let urlImage3: String = "https://st.depositphotos.com/3574993/5012/i/950/"
                            + "depositphotos_50124951-stock-photo-laughing-african-woman-in-bright.jpg"

    let urlImage4: String = "https://st.depositphotos.com/1024628/1235/i/950/"
                            + "depositphotos_12354731-stock-photo-children-playing-tag.jpg"

    let urlImage5: String = "https://st4.depositphotos.com/12982378/23122/i/1600/"
                            + "depositphotos_231227394-stock-photo-smiling-man-woman-holding-white.jpg"

    func bindViewModel() {
        var data: DeveloperModel = []
        data.append(contentsOf: [
            DeveloperModelElement(id: 0, name: "Ronaldo Aparecido", ocupation: "Desenvolvedor iOS",
                                  description: "Lorem Ipsum is simply dummy text of the printing and typesetting"
                                  + "industry. Lorem Ipsum has been the industry's standard dummy text ever since the"
                                  + "1500s, when an unknown printer took a galley of type and scrambled it to make"
                                  + "type specimen book.", email: "teste@gmail.com", imageURL: urlImage),
            DeveloperModelElement(id: 1, name: "Ana Clara", ocupation: "Desenvolvedor Android",
                                  description: "sdlfhadlksjfghsnslkdjfskf"
                                  + "sldkjfkasdsds sdfaskajdf ksdkfjasld asdlfjasdjljsa "
                                  + "dflsdjfa asdasdas  asds sdsd  sas lsdlfjasdfjksdjf sdjfajskdfl", email: "teste@gmail.com", imageURL: urlImage2),
            DeveloperModelElement(id: 2, name: "José Santos", ocupation: "Desenvolvedor Web",
                                  description: "sdlfhadlksjfghsnslkdjfskf"
                                  + "sldkjfk asdasd asdasd  asdfaskajdf ksdkfjasld asdlfjasdjljsa "
                                  + "dflsdjfalsdl as   d d ddsdsds  fjasdfjksdjf sdjfajskdfl", email: "teste@gmail.com", imageURL: urlImage3),
            DeveloperModelElement(id: 3, name: "Roberto Da Silva", ocupation: "Desenvolvedor Flutter",
                                  description: "sdlfhadlksjfghsnslkdjfskf"
                                  + "sldkjfkasdfaskajd as asd ass d  df ksdkfjasld asdlfjasdjljsa "
                                  + "dflsdjfalsdlfjasdfjksds dsd sd asd asd ajf sdjfajskdfl", email: "teste@gmail.com", imageURL: urlImage4),
            DeveloperModelElement(id: 4, name: "Teste1", ocupation: "Desenvolvedor",
                                  description: "sdlfhadlksjfghsnslkdjfskf"
                                  + "sldkjfkasdfaskajdf ksdkfjasld asdlfjasdjljsa "
                                  + "dflsdjfalsdlfjasdfjksdjf sdjfajskdfl", email: "teste@gmail.com", imageURL: urlImage5),
            DeveloperModelElement(id: 5, name: "Teste1", ocupation: "Desenvolvedor",
                                  description: "sdlfhadlksjfghsnslkdjfskf"
                                  + "sldkjfkasdfaskajdf ksdkfjasld asdlfjasdjljsa "
                                  + "dflsdjfalsdlfjasdfjksdjf sdjfajskdfl", email: "teste@gmail.com", imageURL: urlImage2),
            DeveloperModelElement(id: 6, name: "Teste1", ocupation: "Desenvolvedor",
                                  description: "sdlfhadlksjfghsnslkdjfskf"
                                  + "sldkjfkasdfaskajdf ksdkfjasld asdlfjasdjljsa "
                                  + "dflsdjfalsdlfjasdfjksdjf sdjfajskdfl", email: "teste@gmail.com", imageURL: urlImage)
                        ])

        self.dataSource.accept(data)
    }
}
