
class Comment < ApplicationRecord
    belongs_to :publish
    belongs_to :user

end
