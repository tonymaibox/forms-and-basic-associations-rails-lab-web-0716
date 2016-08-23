class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
attr_reader :song_artist_name, :song_genre_id, :song_notes_1, :song_notes_2, :genre_name

  def song_artist_name=(name)
  	self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name=(genre)
  	self.genre = Genre.find_or_create_by(name: genre)
  	self.save
  end

  def genre_name
  	self.genre.name
  end

  def artist_name=(name)
  	self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
  	self.artist.name
  end

  def song_notes_1=(note)
  	# byebug
  	self.notes << Note.create(content: "#{note}", song_id: self.id)
  	self.save
  end

  def song_notes_2=(note)
  	self.notes << Note.create(content: "#{note}", song_id: self.id)
  	self.save
  end

  def note_contents=(notes)
  	notes.each do |note|
  		unless note.empty?
  		self.notes << Note.create(content: note)
  		self.save
  		end
  	end
  end

  def note_contents
  	self.notes.all.collect do |note| 
  			note.content
  	end
  end

  def song_artist
  	self.artist.name
  end

  def song_genre
  	self.genre.name
  end
end

