require 'rubygems'
require 'nokogiri'

def validate(document_path, schema_path, root_element)
  schema = Nokogiri::XML::Schema(File.read(schema_path))
  # document = Nokogiri::XML(File.read(document_path))
  # schema.validate(document.xpath("//#{root_element}").to_s)
  schema.validate(document_path)
end

ARGV.each do |file|
  puts file
  target = File.expand_path(file)

  Dir.chdir 'NeTEx/xsd' do
    validate(target, 'NeTEx_publication.xsd', 'PublicationDelivery').each do |error|
      puts error.message
    end
  end
end
