# == Schema Information
#
# Table name: shorten_urls
#
#  id        :bigint           not null, primary key
#  long_url  :string           not null
#  short_url :string           not null
#  user_id   :integer          not null
#
class ShortenUrl < ApplicationRecord
    validates :long_url, presence: true, uniqueness: true
    validates :short_url, presence: true, uniqueness: true
    validates :user_id, presence: true

    include SecureRandom

    belongs_to :user,
        primary_key: :id.
        foreign_key: :user_id,
        class_name: :User


    def self.random_code(short_url, long_url)
        until ShortenUrl.exists?(short_url)
            short_url = SecureRandom.urlsafe_base64(long_url)
        end
    end
end
