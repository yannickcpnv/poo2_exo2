# helper method that defines color for the different attribute types for the generated ERD diagram
def attr_color(attribute)
  case
  when attribute.primary_key? then 'gold'
  when attribute.foreign_key? then 'red3'
  else
    'royalblue'
  end
end

namespace :document do
  desc "Generate an ERD diagram with raisl-erd, pass a title in `title`, pass source files path in `sources` with comma separated values, pass the output format in `format`, you may pass your own template in `template`, optionnaly `output` as the output filename."
  task :erd do
    fail("You must pass a `title`!") unless ENV['title']
    fail("You must pass some `sources`!") unless ENV['sources']

    sources_path = ENV['sources'].split(ENV['sources'][':'] || ',').inject([]) { |memo, path| memo.concat(Dir.glob(path)) }
    template_path = ENV['template'] || File.expand_path('erd.html.erb', File.dirname(__FILE__))

    require "rails_erd/diagram/graphviz"

    # Load the source files
    sources_path.each { |file| require file }

    # Default options
    RailsERD.options.inheritance = true
    RailsERD.options.polymorphism = true
    RailsERD.options.notation = :crowsfoot
    RailsERD.options.sort = false
    RailsERD.options.attributes = %w{content timestamps primary_keys foreign_keys}
    RailsERD.options.title = ENV['title']
    RailsERD.options.filetype = ENV['format'] if ENV['format']
    RailsERD.options.filename = ENV['output'] || ENV['title']

    # Setup the options
    (RailsERD.options.keys.map(&:to_s) & (ENV.keys - %w{title sources format output template})).each do |option|
      RailsERD.options[option.to_sym] = case ENV[option]
                                        when "true", "yes" then true
                                        when "false", "no" then false
                                        when /,/ then ENV[option].split(/\s*,\s*/)
                                        else ENV[option].to_sym
                                        end
    end

    # Inject our own font config
    fonts = RailsERD::Diagram::Graphviz::FONTS
    fonts[:normal] = "Source Sans Pro"
    fonts[:italic] = "Source Sans Pro"
    fonts[:bold] = "Source Sans Pro Bold"
    RailsERD::Diagram::Graphviz::GRAPH_ATTRIBUTES[:fontname] = "Source Sans Pro Bold"
    RailsERD::Diagram::Graphviz::NODE_ATTRIBUTES[:fontname] = "Source Sans Pro"
    RailsERD::Diagram::Graphviz::EDGE_ATTRIBUTES[:fontname] = "Source Sans Pro"

    # Patch ERD so that we can inject our own template
    RailsERD::Diagram::Graphviz.send(:define_method, :read_template) do |type|
      ERB.new(File.read(template_path), nil, "<>")
    end

    # Create the diagram
    RailsERD::Diagram::Graphviz.create
  end
end

