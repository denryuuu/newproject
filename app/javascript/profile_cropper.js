import Cropper from "cropperjs";

document.addEventListener("turbo:load", () => {
  const input = document.getElementById("avatar_input");
  const preview = document.getElementById("avatar_preview");
  const imageToCrop = document.getElementById("image_to_crop");
  const cropButton = document.getElementById("crop_button");
  const cropAndSetButton = document.getElementById("crop_and_set");

  let cropper;

  if (!input || !imageToCrop || !preview) return;

  input.addEventListener("change", (event) => {
    const file = event.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = (e) => {
        imageToCrop.src = "";
        preview.src = "";

        imageToCrop.onload = () => {
          cropButton.disabled = false;
          cropButton.classList.remove("btn-outline-secondary");
          cropButton.classList.add("btn-outline-pink");

          if (cropper) {
            cropper.destroy();
            cropper = null;
          }
        };

        imageToCrop.src = e.target.result;
        preview.src = e.target.result;
        preview.style.borderRadius = "50%";
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
        imageToCrop.style.display = "block";
        imageToCrop.style.margin = "0 auto";
        imageToCrop.style.maxWidth = "100%";
        imageToCrop.style.maxHeight = "70vh";

        setTimeout(() => {
          document.querySelectorAll(".cropper-crop-box, .cropper-face").forEach((el) => {
            el.style.borderRadius = "50%";
            el.style.overflow = "hidden";
          });
        }, 100);
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
