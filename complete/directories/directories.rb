#!/apollo/env/ruby193/bin/ruby

class TreeNode

  attr_accessor :name, :is_new

  def initialize( name, is_new )
    @children = []
    @name = name
    @is_new = is_new
  end

  def get( name )
    @children.select{|node| node.name == name}[0]
  end

  def add( node )
    @children.push( node ) unless @children.include? node
  end

  def get_required_mkdirs
    required_mkdirs = @is_new ? 1 : 0
    @children.each do |child|
      required_mkdirs += child.get_required_mkdirs
    end
    #puts "required mkdirs: #{required_mkdirs} for name #{name}"
    return required_mkdirs
  end
end

def put_line_in_tree( root, rawline, is_new )
  path_array = rawline.split('/')
  path_array.shift
  current_node = root
  path_array.each do |directory|
    if current_node.get( directory )
      current_node = current_node.get( directory )
      #puts "Found existing directory #{current_node.name} in #{path_array.to_s}"
    else
      new_node = TreeNode.new( directory, is_new )
      current_node.add( new_node )
      current_node = new_node
    end
  end
end

filename = ARGV[0]
file = File.new( filename )
num_cases = file.readline.to_i

(1..num_cases).each do |n|
  existing,nonexisting = file.readline.split.map(&:to_i)
  root = TreeNode.new("",false)

  # Step 1: Insert all of the existing directories
  existing.times do |m|
    put_line_in_tree(root,file.readline.strip,false)
  end

  nonexisting.times do |m|
    put_line_in_tree(root,file.readline.strip,true)
  end

  puts "Case ##{n}: #{root.get_required_mkdirs}"
end

=begin
PSEUDOCODE:

Build the directory structure as a tree
Put all of the new directories into the tree, but mark their nodes as new
Do a b
=end

