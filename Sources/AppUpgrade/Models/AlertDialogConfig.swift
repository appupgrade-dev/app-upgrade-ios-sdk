public struct AlertDialogConfig: Equatable {
    let title: String?
    let updateButtonTitle: String?
    let laterButtonTitle: String?
    
    public init(
        title: String? = nil,
        updateButtonTitle: String? = nil,
        laterButtonTitle: String? = nil
    ) {
        self.title = title
        self.updateButtonTitle = updateButtonTitle
        self.laterButtonTitle = laterButtonTitle
    }
}

