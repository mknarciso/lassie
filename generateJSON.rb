def generateJSON()
  all = Resource.all;
  str = '';
  File.open("toAI.txt", 'a') do |file|
    all.each do |a|
      if !a["extended_slug"].nil?
        file.puts a["title"]+' '+a["slug"].gsub('-',' ')+' '+a["extended_slug"].gsub('/',' ').gsub('-',' ')+'? '+ a["url"];
      else
        file.puts a["title"]+' '+a["slug"].gsub('-',' ')+' '+'? '+ a["url"];
      end
    end
  end
end

