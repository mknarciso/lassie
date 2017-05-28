def generateJSON()
  all = Resource.all;
  str = '';
  File.open("toAI.tsv", 'a') do |file|
    all.each do |a|
      if !a["extended_slug"].nil?
        file.puts a["title"]+' '+a["slug"].gsub('-',' ')+' '+a["extended_slug"].gsub('/',' ').gsub('-',' ')+"\t"+ a["url"];
      else
        file.puts a["title"]+' '+a["slug"].gsub('-',' ')+' '+"\t"+ a["url"];
      end
    end
  end
end

