class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: {in: [true, false]}
    validates :artist_name, presence: true
    include ActiveModel::Validations
    validates_with ReleaseYearValidator
end
