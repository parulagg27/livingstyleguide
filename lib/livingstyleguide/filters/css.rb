LivingStyleGuide.add_filter :css, :scss do |arguments, source|
  file = arguments.first
  if file =~ /\.(css|scss|sass)$/
    if document.file
      file = File.join(File.dirname(document.file), file)
    end
    document.depend_on file
    document.scss << %Q(@import "#{file}";\n)
  else
    document.scss << "##{document.id.gsub('/', '\\/')} {\n#{source}\n}\n"
  end
  nil
end