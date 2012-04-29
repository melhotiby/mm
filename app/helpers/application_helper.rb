module ApplicationHelper
  def full_title(page_title)
    base_title = "Muslim Marriage, Muslim Matrimonial, Muslim Singles, Muslim Dating, Muslima and Quran Dating at MuslimaLove.com"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  
  def logo
    image_tag("logo-big.png", alt: "MuslimaLove.com", title: "MuslimaLove.com")
  end
  
end
