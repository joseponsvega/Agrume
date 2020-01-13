//
//  Copyright © 2016 Schnaub. All rights reserved.
//

import UIKit
import Agrume

final class SingleImageBackgroundColorViewController: UIViewController {
  
  private lazy var agrume: Agrume = {
    let agrume = Agrume(image: #imageLiteral(resourceName: "MapleBacon"), background: .colored(.black))
    agrume.hideStatusBar = true
    return agrume
  }()

  @IBAction private func openImage(_ sender: Any) {
    let helper = makeHelper()
    agrume.onLongPress = helper.makeLongPressGesture
    agrume.show(from: self)
  }
  
  private func makeHelper() -> AgrumePhotoLibraryHelper {
    let saveButtonTitle = NSLocalizedString("Save Photo", comment: "Save Photo")
    let cancelButtonTitle = NSLocalizedString("Cancel", comment: "Cancel")
    let helper = AgrumePhotoLibraryHelper(saveButtonTitle: saveButtonTitle, cancelButtonTitle: cancelButtonTitle) { error in
      guard error == nil else {
        print("Could not save your photo")
        return
      }
      print("Photo has been saved to your library")
    }
    return helper
  }
}
