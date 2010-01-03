xml.instruct!
xml.rss(:version=>2.0){
  xml.channel{
    xml.title("#{@author.username}'s latest articles")
    xml.link("#{url_for(:controller=>"users",:action=>"home",:id=>@author.id)}")
    for article in @articles
      xml.item{
        xml.title("#{article.title}")
        xml.description("#{article.content}")
        xml.link(article_path(article))
      }
    end
  }
}