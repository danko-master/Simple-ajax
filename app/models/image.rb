require "#{Rails.root}/lib/paperclip_processors/watermark.rb"

class Image < ActiveRecord::Base
  belongs_to :car
  
  has_attached_file :image, :processors => [:watermark], 
    :styles => { 
      :medium => {
        :watermark_path => "#{Rails.root}/public/watermarks/watermark.png",
        :geometry => "320x320>",
        :position => 'SouthWest',
        :format => :png
      }, 
      :small => "110x110>"
       }
  
  validates_attachment_size :image, :less_than => 30.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 
                                                              'image/png', 
                                                              'image/jpg']
   
  attr_accessible :image, :car_id, :order_id 
end
