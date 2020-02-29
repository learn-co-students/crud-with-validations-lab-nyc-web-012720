class Song < ApplicationRecord

    validates :released, inclusion: { in: [true, false] }
    validates :title, uniqueness: { scope: [:release_year, :artist_name] }, presence: true
    validates :release_year, numericality: { less_than: Time.now.year, greater_than: 1900 }, if: :released?

    def released?
        self.released == true
    end 

end
