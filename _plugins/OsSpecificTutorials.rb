module Jekyll
  class OsSpecificTutorialsGenerator < Generator
    safe true
    def generate(site)
      tutorials = site.collections["tutorials"]
      docs = tutorials.docs
      site.data["non_dup_tuts"] = []
      docs.each do |doc|
        match = /\/([\w-]+)-(ios|android)\.\w+$/.match(doc.path)
        title = doc["title"]
        if match
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
        else
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
