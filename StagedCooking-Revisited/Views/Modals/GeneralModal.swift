//
//  GeneralModal.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/9/22.
//

import Foundation
import UIKit

class GeneralModal: UIView {
  
  var generalInfo: GeneralInfo?
  var generalStac = UIStackView()
  
  var readyInMinutesLabel = ModalLabel()
  var servingsLabel = ModalLabel()
  
  var dishTypeLabel = ModalLabel()
  var cuisinesLabel = ModalLabel()
  
  var veryPopularLabel = ModalLabel()
  var sustainableLabel = ModalLabel()
  
  var cheapLabel = ModalLabel()
  var pricePerServingLabel = ModalLabel()

  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  convenience init(info: GeneralInfo) {
    self.init()
    self.generalInfo = info
    guard let modalData = self.generalInfo else { return }
    styleGeneralLabels(with: modalData)
    layoutGeneralLabels(with: modalData)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension GeneralModal {
  func styleGeneralLabels(with info: GeneralInfo) {
    readyInMinutesLabel.translatesAutoresizingMaskIntoConstraints = false
    readyInMinutesLabel.text = info.readyInMnutes
    
    servingsLabel.translatesAutoresizingMaskIntoConstraints = false
    servingsLabel.text = info.servings
    
    dishTypeLabel.translatesAutoresizingMaskIntoConstraints = false
    dishTypeLabel.numberOfLines = 0
    dishTypeLabel.text = info.dishType
      
    cuisinesLabel.translatesAutoresizingMaskIntoConstraints = false
    cuisinesLabel.text = info.cuisines
    
    veryPopularLabel.translatesAutoresizingMaskIntoConstraints = false
    veryPopularLabel.text = info.veryPopular
    
    sustainableLabel.translatesAutoresizingMaskIntoConstraints = false
    sustainableLabel.numberOfLines = 0
    sustainableLabel.text = info.sustainable
  }
  
  func layoutGeneralLabels(with info: GeneralInfo) {
    generalStac.addArrangedSubview(readyInMinutesLabel)
    generalStac.addArrangedSubview(servingsLabel)
    generalStac.addArrangedSubview(dishTypeLabel)
    generalStac.addArrangedSubview(cuisinesLabel)
    generalStac.addArrangedSubview(veryPopularLabel)
    generalStac.addArrangedSubview(sustainableLabel)
  }
}
