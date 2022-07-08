class Task < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    validates :deadline, presence: true
    validates :status, presence: true
    # def self.search
    #     if search
    #     Task.where(['title LIKE ?', "%#{keyword}%"])
    #     else
    #     Task.all
    #     end
    # end

end
