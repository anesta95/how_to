# What is Tor?
"Tor" can refer to several different components. 

Tor is a program you can run on your computer that helps keep you safe on the Internet. It protects you by bouncing your communications around a distributed network of relays run by volunteers all around the world. It prevents somebody watching your Internet connection from learning what sites you visit, and it prevents the sites you visit from learning your physical location. This set of volunteer relays is called the _Tor network_.

The way most people use Tor is with Tor Browser, which is a version of Firefox that fixes many privacy issues.

The Tor Project is a non-profit (charity) organization that maintains and develops the Tor software.

# Tor Browser
Tor Browser uses the Tor network to protect your privacy and anonymity. Using the Tor network has two main properties:

Your internet service provider, and anyone watching your connection locally, will not be able to track your internet activity, including the names and addresses of the websites you visit.

The operators of the websites and services that you use, and anyone watching them, will see a connection coming from the Tor network instead of your real Internet (IP) address, and will not know who you are unless you explicitly identify yourself.

In addition, Tor Browser is designed to prevent websites from "fingerprinting" or identifying you based on your browser configuration.

By default, Tor Browser does not keep any browsing history. Cookies are only valid for a single session (until Tor Browser is exited or a New Identity is requested).

## How Tor Works
Tor works by sending your traffic through three random servers (also known as relays) in the Tor network. The last relay in the circuit (the "exit relay") then sends the traffic out onto the public Internet.

The idea is similar to using a twisty, hard-to-follow route in order to throw off somebody who is tailing you — and then periodically erasing your footprints. Instead of taking a direct route from source to destination, data packets on the Tor network take a random pathway through several relays that cover your tracks so no observer at any single point can tell where the data came from or where it's going.

To create a private network pathway with Tor, the user's software or client incrementally builds a circuit of encrypted connections through relays on the network. The circuit is extended one hop at a time, and each relay along the way knows only which relay gave it data and which relay it is giving data to. No individual relay ever knows the complete path that a data packet has taken. The client negotiates a separate set of encryption keys for each hop along the circuit to ensure that each hop can't trace these connections as they pass through.

Once a circuit has been established, many kinds of data can be exchanged and several different sorts of software applications can be deployed over the Tor network. Because each relay sees no more than one hop in the circuit, neither an eavesdropper nor a compromised relay can use traffic analysis to link the connection's source and destination. Tor only works for TCP streams and can be used by any application with SOCKS support.

For efficiency, the Tor software uses the same circuit for connections that happen within the same ten minutes or so. Later requests are given a new circuit, to keep people from linking your earlier actions to the new ones.

# Resources
* [What is Tor?](https://support.torproject.org/about/what-is-tor/)
* [About Tor Browser](https://tb-manual.torproject.org/about/)
* [Tor: Overview](https://2019.www.torproject.org/about/overview.html.en)
* [Tor: Most Frequently Asked Questions](https://support.torproject.org/faq/)
* [Tor: Onion Services](https://community.torproject.org/onion-services/)
* [Tor: Community Training](https://community.torproject.org/training/)



