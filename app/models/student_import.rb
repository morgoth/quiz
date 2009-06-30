class StudentImport < ActiveRecord::Base
  require "yaml"

  belongs_to :teacher
  attr_accessor :file
  validates_presence_of :file
  validate :format_of_file, :if => :file
  before_save :parse_file

  private

  def format_of_file
    errors.add(:file, 'wrong type') unless file.original_filename =~ /\.yml$/i
  end

  # OPTIMIZE: cleanup yaml parsing
  def parse_file
    users = YAML::load(file)
    users.each do |key, attributes|
      Student.create(attributes.merge('password_confirmation' => attributes['password']))
    end
  end
end
