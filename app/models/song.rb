class Song < ActiveRecord::Base
  include Authority::Abilities
  resourcify
  belongs_to :user, class_name: 'User'

  # attr_accessible :parsed, :body, :title, :user_id
  validates :title, :body, :presence => true
  before_update :parse_with_save


  def parse_with_save
    self.parsed = SongParser.new.initialize_with_attr(self.id, self.body)
    true
  end

  def parse
    SongParser.new.initialize_with_attr(self.id, self.body)
  end

end

class SongParser

  attr_accessor :input
  attr_accessor :output

  def header
    begin
      output.clear
      title = @input.shift().delete('**').strip
      artist = @input.shift().delete('**').strip
      notes = @input.shift().delete('**').strip

      output << "\\section{#{title} / #{artist}}\\label{sec:#{title.downcase.gsub(/[^a-z0-9]+/i, '_')}}\n"
      unless notes.empty?
        output << "{\\small #{notes}}\n"
      end
    rescue StandardError => e
      Rails.logger.error(e)
      output.clear
      output << "[ERROR] Your song is not yet written and formatted correctly.\n---\n"
    ensure
      output
    end
  end

  def chords
    begin
      space
      process = @input.take_while { |arr| arr != "chords **" }
      process.delete_at(0)
      process.each do |chord|
        output << "\\#{chord}\n"
        @input.delete(chord)
      end
      @input.slice!(0..1)
    rescue StandardError => e
      Rails.logger.error(e)
      output.clear
      output << "[ERROR] Your song is not yet written and formatted correctly.\n---\n"
    end
  end

  def lyrics
    begin
      space

      @input.each do |lyric|
        unless lyric.nil? || lyric.strip == "**"
          output << lyric.gsub(/[\[]/, '\upchord{').gsub(/[\]]/, '}').gsub(/---/, '\hrulefill') + "\n\n"
        end
      end
    rescue StandardError => e
      Rails.logger.error(e)
      output.clear
      output << "[ERROR] Your song is not yet written and formatted correctly.\n---\n"
    end
  end

  def space
    output << "\n"
  end

  def initialize
    @input = Array.new
    @output = Array.new
  end

  def initialize_with_attr(id, body)
    # create temporary file
    filename = "#{id}_#{SecureRandom.uuid}"
    file = File.new(filename, 'w+')
    file.write(body)
    file.close
    f = File.open(filename, 'r')
    f.each { |line|
      unless line.strip.empty?
        @input.push(line.strip)
      end
    }
    r = File.delete(filename)

    @input.collect! { |line| line[0..1] != "//" ? line : nil }
    @input.delete_if { |x| x == nil }

    header
    chords
    lyrics

    @output
  end

  def initialize_with_file(filepath)
    file = File.open(filepath, 'r')
    file.each { |line|
      unless line.strip.empty?
        @input.push(line.strip)
      end
    }

    @input.collect! { |line| line.strip! unless line[0..1] == '//' }
    @input.delete_if { |x| x == nil }

    header
    chords
    lyrics
  end

end
