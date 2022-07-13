class Task < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    validates :deadline, presence: true
    validates :status, presence: true
    enum status:{選択してください: 1, 未着手: 2,着手中: 3,完了: 4}
    enum priority:{未選択: 0, 高: 1,中: 2,低: 3}

    scope :search_title, -> (title) {where("title LIKE ?", "%#{title}%")}
    scope :search_status, -> (status) {where(status: status)}

end
