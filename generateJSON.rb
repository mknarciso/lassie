def generateJSON()
  all = Resource.all;
  str = '';
  File.open("toAI.txt", 'a') do |file|
    all.each do |a|
      if !a["extended_slug"].nil?
        file.puts a["title"]+' '+a["slug"].gsub('-',' ')+' '+a["extended_slug"].gsub('/',' ').gsub('-',' ')+"? \n"+ a["url"]+"\n\n\n";
      else
        file.puts a["title"]+' '+a["slug"].gsub('-',' ')+' '+"? \n"+ a["url"]+"\n\n\n";
      end
    end
  end
end

