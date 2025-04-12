document.addEventListener("turbo:load", () => {
  console.log("JS loaded");

  const imageInput = document.getElementById("image-input");
  const modal = document.getElementById("cropperModal");
  const modalImage = document.getElementById("modal-image");
  const cropButton = document.getElementById("apply-crop-btn-modal");
  const previewImage = document.getElementById("image-preview");
  const openModalBtn = document.getElementById("open-cropper-modal");

  let cropper;
  let imageDataUrl = null;

  // 画像選択時にデータURLを取得して保存
  imageInput.addEventListener("change", (e) => {
    const file = e.target.files[0];
    if (!file) return;

    const reader = new FileReader();
    reader.onload = (event) => {
      imageDataUrl = event.target.result;

      // まずsrcをリセットしてから再代入（1回目で画像が表示されない問題の対策）
      previewImage.src = "";
      previewImage.onload = () => {
        console.log("プレビュー画像が読み込まれました");
      };

      previewImage.src = imageDataUrl;
    };
    reader.readAsDataURL(file);
  });

  // 「トリミングする」ボタンが押されたら、src を設定してモーダル表示
  openModalBtn.addEventListener("click", () => {
    if (!imageDataUrl) {
      alert("先に画像を選択してください");
      return;
    }

    const bsModal = new bootstrap.Modal(modal);

    modalImage.onload = () => {
      bsModal.show();
    };

    // モーダル内の画像も一度リセットしてから再設定
    modalImage.src = "";
    modalImage.src = imageDataUrl;
  });

  // モーダル表示時にCropperを初期化
  modal.addEventListener("shown.bs.modal", () => {
    if (cropper) {
      cropper.destroy();
    }

    cropper = new Cropper(modalImage, {
      aspectRatio: 4 / 3,
      viewMode: 2,
    });
  });

  // モーダルが閉じられたらCropperを破棄
  modal.addEventListener("hidden.bs.modal", () => {
    if (cropper) {
      cropper.destroy();
      cropper = null;
    }
  });

  // トリミング実行
  cropButton.addEventListener("click", () => {
    if (cropper) {
      const canvas = cropper.getCroppedCanvas({
        width: 800,
        height: 600,
      });

      previewImage.src = canvas.toDataURL("image/jpeg");

      canvas.toBlob((blob) => {
        const file = new File([blob], "cropped.jpg", { type: "image/jpeg" });
        const dataTransfer = new DataTransfer();
        dataTransfer.items.add(file);
        imageInput.files = dataTransfer.files;
      });

      const bsModal = bootstrap.Modal.getInstance(modal);
      bsModal.hide();
    }
  });
});
