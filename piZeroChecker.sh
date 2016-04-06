#!/bin/bash

# Checks the  distributors for stock of the Raspberry Pi Zero

# Original by Tobias Girstmair (http://isticktoit.net/?p=1434)
# Forked by dofl. I wasn't happy with the alarm sound, I rather have an e-mail. And I added some distributors

# Alarm Function
alarm() {
	echo "Raspberry Pi Zero available at $1! Check http://whereismypizero.com" | mail -s "Raspberry Pi Zero available" your@e-mail.com
}

# US: Adafruit
curl -A "Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:44.0) Gecko/20100101 Firefox/44.0" https://www.adafruit.com/products/2885 2>/dev/null | grep -A 1 '' | grep "IN STOCK" >/dev/null #"OUT OF STOCK"
[[ $? -eq 0 ]] && alarm "adafruit" || echo "adafruit out of stock"

# EU: Pimoroni
curl -A "Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:44.0) Gecko/20100101 Firefox/44.0" https://shop.pimoroni.com/products/raspberry-pi-zero 2>/dev/null | grep '<button data-product-id="3580233095" data-variant-id="10459456583" title="Back soon!" class="bis-notify"><span></span><strong>Notify me</strong></button>' >/dev/null #'class="stock-level out-of-stock">'
[[ $? -ne 0 ]] && alarm "pimoroni" || echo "pimoroni out of stock"

# EU: The Pi Hut
curl -A "Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:44.0) Gecko/20100101 Firefox/44.0" https://thepihut.com/products/raspberry-pi-zero?variant=14062715972 2>/dev/null | grep 'Raspberry Pi Zero Only - Sold Out' >/dev/null
[[ $? -ne 0 ]] && alarm "thepihut" || echo "thepihut out of stock"

# EU: Element 14
curl -A "Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:44.0) Gecko/20100101 Firefox/44.0" https://www.element14.com/community/docs/DOC-79263/l/introducing-the-raspberry-pi-zero 2>/dev/null | grep 'Raspberry Pi Zero&#160; <span style="color: #ff0000;">SOLD OUT</span>' >/dev/null
[[ $? -ne 0 ]] && alarm "element14" || echo "element14 out of stock"

# US: MicroCenter
curl -A "Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:44.0) Gecko/20100101 Firefox/44.0" http://www.microcenter.com/product/457746/Raspberry_Pi_Zero 2>/dev/null | grep '>In Store Only</div>' >/dev/null
[[ $? -ne 0 ]] && alarm "microcenter" || echo "microcenter out of stock"
