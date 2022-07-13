class Task < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    validates :deadline, presence: true
    validates :status, presence: true
    enum status:{選択してください: 1, 未着手: 2,着手中: 3,完了: 4}

    scope :search_title, -> (title) {where("title LIKE ?", "%#{title}%")}
    scope :search_status, -> (status) {where(status: status)}

end
