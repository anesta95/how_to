# What is a VPN?

A Virtual Private Network (VPN) encrypts data sent between computers on the internet. When using a VPN your data is encrypted so your internet service provider (ISP) or mobile network provider cannot surveil your internet activity.

If you are not using a VPN and do not us HTTPS to visit websites, then every site you visit, and the content you view or download, can be tracked by your ISP. Even with HTTPS, the IP address or domain being visited can still be tracked by your ISP.

When you connect to your VPN, you connect to a server that they either own or maintain and they route your traffic to your ISP's servers. The ISP can only record that Bob is connected to a VPN server, nothing else. The servers he is connected to see only that the VPN server is connected to them and therefore can only record the IP address of the VPN server in their logs. 

The best VPN services will diligently ensure that they do not log any user connection data, ensuring their customers' privacy.

# How does a VPN work?

A VPN server is a computer operated by your VPN provider. When you establish a VPN tunnel, your internet connection is encrypted between your internet-connected device and the server.

The HTTP packets that are transmitted when you visit websites and sent emails are encrypted using an algorithm that converts the information from readable text to unreadable [ciphertext](https://proton.me/blog/what-is-ciphertext). Only the VPN app and VPN server can decrypt those packets using a secret key.

Data exchanged between the VPN server and the final destination, such as a website you’re visiting, is not encrypted by the VPN. These days, it’s usually encrypted using standard web encryption ([TLS](https://proton.me/blog/tls-ssl-certificate)), but this isn’t always the case. Now, your internet traffic appears to originate from the VPN server, even if the server is in another country.

# What does using a VPNs achieve?
* Securing an insecure internet connection
* Hiding your browsing history from your ISP
* Preventing data discrimination
* Prevening internet censorship
* Safe file sharing or BitTorrent

# What do VPNs *not* do?
Commercial VPNs are not useful or not alone sufficient for:
* providing better security when ['working from home'](https://www.ivpn.net/blog/most-people-dont-need-a-commercial-vpn-to-work-from-home-securely/)
* achieving anonymity
* defending yourself from hackers when at home
* solving all privacy issues, like unwanted profiling by social networks or search engines
* protecting your passwords
* hiding your mobile phone location (GPS)
* helping you avoid data breaches on services you use online
* defending against "cyber threats" and identity theft
* preventing your medical information or family photos getting in the wrong hands

# Resources
* [What is a VPN?](https://protonvpn.com/what-is-a-vpn)
* [What is a VPN?](https://www.ivpn.net/en/what-is-a-vpn/)
* [What is a VPN tunnel?](https://protonvpn.com/blog/what-is-a-vpn-tunnel/)
* [Understanding the VPN Threat Model](https://protonvpn.com/blog/threat-model/)
* [Do I need a VPN? Tool](https://www.doineedavpn.com/)
* [Why you don't need a VPN](https://www.ivpn.net/blog/why-you-dont-need-a-vpn/)
* [IVPN Privacy Guides](https://www.ivpn.net/privacy-guides/)
