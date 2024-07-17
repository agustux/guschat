xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title "RSS Rails"
    xml.description "Guschat messages"
    xml.link root_path

    @messages.each do |message|
      xml.item do
        xml.description message.body
        xml.pubDate message.created_at.to_s()
        xml.link root_path
      end
    end
  end
end
