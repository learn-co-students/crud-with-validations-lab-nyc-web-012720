class ReleaseYearValidator < ActiveModel::Validator
    def validate(record)
        Song.all.each do |song|
            if record.title == song.title && record.artist_name == song.artist_name
                record.errors[:artist_name] << "Artist already released this song"
            end
        end

        if record.release_year != nil && record.release_year > Time.now.strftime("%Y").to_i
            record.errors[:release_year] << "Cant be in the future."
        end

        if record.released == true && record.release_year == nil
            record.errors[:release_year] << "Must have a release year"
        end
    end
end