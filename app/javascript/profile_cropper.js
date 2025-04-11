import Cropper from "cropperjs";

document.addEventListener("DOMContentLoaded", () => {
  const input = document.getElementById("avatar_input");
  const preview = document.getElementById("avatar_preview");
  const imageToCrop = document.getElementById("image_to_crop");
  const cropButton = document.getElementById("crop_button");
  const cropAndSetButton = document.getElementById("crop_and_set");

  let cropper;
  let fileDataUrl;

  if (!input || !imageToCrop || !preview) return;

  input.addEventListener("change", (event) => {
    const file = event.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = (e) => {
        imageToCrop.src = e.target.result;
        preview.src = e.target.result;

        // ボタン色＆有効化
        const cropButtonTrigger = document.getElementById("crop_button");
        cropButtonTrigger.disabled = false;
        cropButtonTrigger.classList.remove("btn-outline-secondary");
        cropButtonTrigger.classList.add("btn-outline-pink");

        if (cropper) {
          cropper.destroy();
          cropper = null;
        }
      };
      reader.readAsDataURL(file);
    }
  });

  const modal = document.getElementById("cropModal");
  modal.addEventListener("shown.bs.modal", () => {
    if (cropper) {
      cropper.destroy();
    }

    cropper = new Cropper(imageToCrop, {
      aspectRatio: 1,
      viewMode: 1,
      dragMode: "move",
      autoCropArea: 1,
      ready() {
        const cropBox = document.querySelector(".cropper-crop-box");
        const face = document.querySelector(".cropper-face");
        if (cropBox && face) {
          cropBox.style.borderRadius = "50%";
          face.style.borderRadius = "50%";
        }

        // モーダル内の画像を中央に配置
        imageToCrop.style.display = "block";
        imageToCrop.style.marginLeft = "auto";
        imageToCrop.style.marginRight = "auto";
        imageToCrop.style.maxWidth = "100%";
        imageToCrop.style.maxHeight = "70vh";
      }
    });
  });

  cropAndSetButton.addEventListener("click", () => {
    if (!cropper) return;

    const canvas = cropper.getCroppedCanvas({ width: 300, height: 300 });

    preview.src = canvas.toDataURL("image/jpeg");
    preview.style.borderRadius = "50%";

    canvas.toBlob((blob) => {
      const newFile = new File([blob], "avatar.jpg", { type: "image/jpeg" });
      const dataTransfer = new DataTransfer();
      dataTransfer.items.add(newFile);
      input.files = dataTransfer.files;
    }, "image/jpeg");
  });
});
