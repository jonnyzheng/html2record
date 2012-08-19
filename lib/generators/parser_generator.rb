class ParserGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("../templates", __FILE__)

  def create_parser_file
    template "parser.rb", "app/parsers/#{file_name}_parser.rb"
  end
end
