require 'yaml'

class ClismonData
  attr_reader :groups_by_name

  def initialize
    @groups_by_name = import_groups
    import_clips
    assign_backgrounds
    puts "Clismon ready."
  end

  def import_groups
    groups_by_name = {}
    yml = YAML::load_file(File.join(__dir__, 'data', 'groups.yml'))
    yml.each do |data|
      attr = data['attributes']
      group = OpenStruct.new(name: attr['name'], title: attr['title'],
        color: attr['color'], clips: [])
      groups_by_name[group.name] = group
    end
    groups_by_name
  end

  def import_clips
    id = 0
    File.readlines(File.join(__dir__, "data", "clips.txt")).each do |line|
      id += 1
      split = line.split('|')
      clip = OpenStruct.new(name: split[0], group_name: split[1], group: nil,
        width: split[2], height: split[3], locator: split[4].strip!, id: id)
      @groups_by_name[clip.group_name].clips << clip
      clip.group = @groups_by_name[clip.group_name]
    end
  end

  def assign_backgrounds
    fondos = @groups_by_name['fondos']
    @groups_by_name.values.each do |group|
      clip = fondos.clips.find {|c| c.name == group.name }
      #clip = fondos.clips.find_by_name(group.name)
      if clip
      group.bg_locator = clip.locator
      group.bg_width = clip.width
      group.bg_height = clip.height
      end
    end
  end
end
