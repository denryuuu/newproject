class ImageUploader < CarrierWave::Uploader::Base
    include Cloudinary::CarrierWave
  
    # Choose what kind of storage to use for this uploader:
    # storage :fog
    process convert: 'jpg'
    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  
    def default_url
      'board_placeholder'
    end
  
    # Process files as they are uploaded:
    # process scale: [200, 300]
    #
    # def scale(width, height)
    #   # do something
    # end
  
    # Create different versions of your uploaded files:
    # version :thumb do
    #   process resize_to_fit: [50, 50]
    # end
  
    def extension_allowlist
      %w[jpg jpeg gif png]
    end
  
    def size_range
      1..5.megabytes
    end
    # Override the filename of the uploaded files:
    # Avoid using model.id or version_name here, see uploader/store.rb for details.
    # def filename
    #   "something.jpg" if original_filename
    # end
  end