module ApplicationHelper

#ABQIAAAAEk-zb2tXVlDszlKmCeOutxSDABrcoRPdOPWfMvq1re_XKws84hQCSYziXvzvJReiv04f0yV3PnX6lQ

def escape_url(str)
str = str.gsub(/\W+/, ' ') # all non-word chars to spaces
str.strip!            # ohh la la
str.downcase!         #
str.gsub!(/\ +/, '-') # spaces to dashes, preferred separator char everywhere
return str
end


end
