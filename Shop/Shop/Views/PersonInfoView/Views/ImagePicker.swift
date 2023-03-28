import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: PersonInfoViewModel
    @Binding var image: UIImage?
    
    let firstName: String
    var onFinishPicking: (UIImage) -> Void

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, imageBinding: $image, viewModel: viewModel)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let parent: ImagePicker
        let imageBinding: Binding<UIImage?>
        let viewModel: PersonInfoViewModel

        init(_ parent: ImagePicker, imageBinding: Binding<UIImage?>, viewModel: PersonInfoViewModel) {
            self.parent = parent
            self.imageBinding = imageBinding
            self.viewModel = viewModel
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                imageBinding.wrappedValue = uiImage
                viewModel.updateAvatar(image: uiImage)
            }
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image = uiImage
            onFinishPicking(uiImage)
        }
        picker.dismiss(animated: true)
    }
}

