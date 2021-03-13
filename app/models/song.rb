class Song < ActiveRecord::Base
  belongs_to :genre
  belongs_to :artist
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def notes_1=(content)
    self.notes << Note.find_or_create_by(content: content)
  end

  def notes_1
    self.notes.empty? ? nil : self.notes.first.content
  end

  def notes_2=(content)
    self.notes << Note.find_or_create_by(content: content)
  end

  def notes_2
    self.notes.empty? ? nil : self.notes[1].content
  end
end
