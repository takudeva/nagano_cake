class Item < ApplicationRecord

  has_one_attached :image

end

  def get_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/mv.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width,height]).processed
  end