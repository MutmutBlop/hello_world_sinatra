require 'pry'
require 'csv'

class Gossip

  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open("db/gossips.csv", "ab") do |row|
    row << [@author,@content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("db/gossips.csv").each do |csv_line|
    all_gossips << Gossip.new(csv_line[0], csv_line[1])
  end
  return all_gossips
  end

  def self.find(id)
    #méthode qui servira à aller chercher un gossip en particulier (via son n° de ligne) et l'affichera dans une page unique
    CSV.read("db/gossips.csv")[id.to_i]
  end

end

#binding.pry
