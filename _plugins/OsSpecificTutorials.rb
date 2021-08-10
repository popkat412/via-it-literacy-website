module Jekyll
  class OsSpecificTutorialsGenerator < Generator
    safe true
    def generate(site)
      # puts("Active lang: #{site.active_lang}")
      tutorials = site.collections["tutorials"]
      docs = tutorials.docs
      site.data["non_dup_tuts"] = []
      docs.each do |doc|
        title = doc["title"]
        puts("title: #{title}, lang: #{doc["lang"]}")
        # lang = doc["lang"]
        # puts("Doc title: #{title}, lang: #{lang}")
        # if site.active_lang != lang
        #   puts("excluding")
        #   next
        # end
        # puts("including")
        begin
          match = /\/([\w-]+)-(ios|android)\.\w+$/.match(doc.path)
          captures = match.captures
          id = captures[0]
          os = captures[1]
          if !site.data["non_dup_tuts"].any? { |tut| tut["id"] == id }
            site.data["non_dup_tuts"].push({ 
              "id" => id, 
              "url" => doc.permalink, 
              "title" => title,
              "os_specific" => true,
            })
          end
        rescue
          site.data["non_dup_tuts"].push({
            "id" => doc.path, 
            "url" => doc.permalink, 
            "title" => title,
            "os_specific" => false,
          })
        end
      end
    end
  end
end
