class Publish < ApplicationRecord


#>>>>>>>>>>>>>>validaciones<<<<<<<<<<<<<<<<<<<
validates :title, presence: true, length: {minimum:3, maximum:55}
validates :content, presence: true
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#>>>>>>>>>>>>>>>Asociacciones/Relaciones<<<<<<<<<<<<<<<<<
has_many :comments
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


#>>>>>>>>>>>>>>Scopes<<<<<<<<<<<<<<<<<<

scope :search_title, ->(search){ where("title LIKE ?", "%"+search+"%" ).order("created_at DESC") }
scope :search_content, ->(search){ where("content LIKE ?", "%"+search+"%" ).order("created_at DESC") }

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>



    def counterLikes_dislikes(likes, id)
        if likes.to_i == 1
            where_str = "id = #{id}"
            count_likes = Publish.select(:likes).where(where_str)
              count_likes.each do |lk|
                count = lk.likes.to_i 
                return count += 1
            end
        elsif likes.to_i == 0
            where_str = "id = #{id}"
            count_likes = Publish.select(:dislikes).where(where_str)
              count_likes.each do |lk|
                count = lk.dislikes.to_i 
                return count += 1
            end
        end
    end

    
end

