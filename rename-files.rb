require 'pdf-reader'

# grab all file names from directory
pdf_files = Dir.entries("./").select { |f| f.end_with? ".pdf" }
pdf_files.each do |file|
  reader = PDF::Reader.new(file)
  first_page = reader.pages.first
  first_line = first_page.to_s.split("\n").first
  first_line_as_file_name = first_line.gsub(" ", "-") + ".pdf"
  # save as new file
  puts "#{file} -> #{first_line_as_file_name}"
  File.rename(file,  first_line_as_file_name)
end
