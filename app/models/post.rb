class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :title_clickbait?

    def title_clickbait?
        clickbait = [ /Won't Believe/i,/Secret/i,/Top \d/i,/Guess/i]

        if clickbait.none? {|bait| bait.match(title)}
            errors.add(:title, "Must be clickbait")
        end
    end
end
