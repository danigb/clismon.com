require "lib/clismon.rb"

module ClismonHelpers
  IMG_BASE_PATH = 'https://s3-eu-west-1.amazonaws.com/clismon'

  GROUPS = ['lecrou', 'doplacie', 'historietas', 'dinero', 'elotromundo',
    'enciclopedia', 'tierra', 'encargos', 'muvirecor']

  DATA = ClismonData.new

  def find_group(name)
    DATA.groups_by_name[name]
  end

  def clip_url(clip)
    @url ||= "#{Clismon.images}/#{clip.group.name}/#{locator}"
  end

  def climage(path)
    "#{IMG_BASE_PATH}#{path}"
  end

  def clismon_data
    DATA
  end
end
