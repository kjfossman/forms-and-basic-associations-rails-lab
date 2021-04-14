class Song < ActiveRecord::Base
  belongs_to :artist 
  belongs_to :genre 
  has_many :notes

  def artist_name=(input)
    self.artist = Artist.find_or_create_by(name: input)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_content=(array_of_content)
    array_of_content.each do |c|
      note = Note.find_or_create_by(content: c)
      self.notes << note
    end
  end

end
