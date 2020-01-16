class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def total_likes
        total = 0
        self.posts.each do |post|
            total += post.likes
        end
        total
        # cleaner way:
        # self.posts.sum { |post| post.likes }
    end

    def feature_post
        most_liked = 0
        most_liked_post = {}
        self.posts.each do |post|
            if post.likes > most_liked
                most_liked_post = post
            end
        end
        most_liked_post
        # cleaner way:
        # self.posts.max_by { |post| post.likes }
    end

end
