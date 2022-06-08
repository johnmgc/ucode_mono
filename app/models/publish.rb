class Publish < ApplicationRecord


#>>>>>>>>>>>>>>validaciones<<<<<<<<<<<<<<<<<<<
validates :title, presence: true, length: {minimum:3, maximum:55}
validates :content, presence: true
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#>>>>>>>>>>>>>>>Asociacciones/Relaciones<<<<<<<<<<<<<<<<<
has_many :comment
belongs_to :user
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

has_rich_text :content

has_one_attached :content


#>>>>>>>>>>>>>>Scopes<<<<<<<<<<<<<<<<<<

scope :search_content, ->(search){ where("content LIKE ? or title LIKE ?", "%"+search+"%","%"+search+"%" ).order("created_at DESC") }
scope :more_likes, ->(){ order("likes DESC").limit(10) }

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


#>>>>>>>>>>>>>>>>>>>>paginacion<<<<<<<<<<<<<<<<<<<<<<<
paginates_per 2
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


    def counterLikes(id)
        where_str = "id = #{id}"
        count_likes = Publish.select(:likes).where(where_str)
            count_likes.each do |lk|
                count = lk.likes.to_i 
                return count += 1
            end
    end

    def counterdislikes(id)
        where_str = "id = #{id}"
        count_likes = Publish.select(:dislikes).where(where_str)
            count_likes.each do |lk|
                count = lk.dislikes.to_i 
                return count += 1
            end
    end

    
end

