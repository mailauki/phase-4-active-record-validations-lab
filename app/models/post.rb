class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

  validate :clickbait?

  CLICKBAIT = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]

  def clickbait?
    if CLICKBAIT.none? { |x| x.match title }
      errors.add(:title, "not clickbait-y enough")
    end
  end
end
