# What is GPG?

GPG, or GNU Privacy Guard, is a public key cryptography implementation. This allows for the secure transmission of information between parties and can be used to verify that the origin of a message is genuine.

GPG relies on a security concept known as **public key encryption**. This idea is that you can split the encrypting and decrypting stages of the transmission of information into two separate pieces. That way, you can freely distribute the encrypting portion, as long as you secure the decrypting portion.

This would allow for a one-way message transfer that can be created and encrypted by anyone, but only be decrypted by the designated user (the one with the private decrypting key). This would ensure that only the intended party can read the data transmission.

Another benefit of this system is that the sender of a message can “sign” the message with their private key. The public key that the receiver has can be used to verify that the signature is actually being sent by the indicated user.

# Set up GPG key

To begin using GPG to encrypt you communications, you need to create a key pair. You can do this by issuing the following command:

```
gpg --gen-key
```

This will take you through a few questions that will configure your keys:

* Please select what kind of key you want: **(1) RSA and RSA (default)**
* What keysize do you want? **4096**
* Key is valid for? **1y** (expires after 1 year. If you are just testing, you may want to create a short-lived key the first time by using a number like “3” instead.)
* Is this correct? **y**
* Real name: **your real name here**
* Email address: **your_email@address.com**
* Comment: **Optional comment that will be visible in your signature**
* Change (N)ame, ©omment, (E)mail or (O)kay/(Q)uit? **O**
* Enter passphrase: **Enter a secure passphrase here (upper & lower case, digits, symbols)**

# How to import other users' public keys

If you've obtained a public key from someone in a text file, GPG can import it with the following command:

```
gpg --import name_of_pub_key_file
```

There is also the possibility that the person you are wishing to communicate with has uploaded their key to a public key server. These key servers are used to house people’s public keys from all over the world.

A popular key server that syncs its information with a variety of other servers is the MIT public key server. You can search for people by their name or email address by going [here](https://pgp.mit.edu) in your web browser or using the following command in the terminal:

```
gpg --keyserver pgp.mit.edu --search-keys search_parameters
```

These search parameters can be names and email addresses.

# How to verify and sign keys
## Verify the other person's identity

Instead of verifying the entire public keys of both parties, you can simply compare the "fingerprint" derived from the other party's public key. You can get the fingerprint of a public key by typing:

```
gpg --fingerprint your_email@address.com
```

This will produce a more management string of characters to compare. You can compare this string with the person themselves, or with someone else who has access to that person.

## Sign Their Key

Signing a key tells your software that you trust the key you have been provided with and that you hvae verified it is associated with the person in question.

To sign a key you've imported, simply type:

```
gpg --sign-key email@example.com
```

When you sign the key, it means you verify that you trust the person is who they claim to be. This can help other people decide whether to trust that person too. If someone trusts you, and they see that you’ve signed this person’s key, they may be more likely to trust their identity too.

You should allow the person whose key you are signing to take advantage of your trusted relationship by sending them back the signed key. You can do this by typing:

```
gpg --output ~/signed.key --export --armor email@example.com
```

You’ll have to type in your passphrase again. Afterwards, their public key, signed by you, will be displayed. Send them this, so that they can benefit from gaining your “stamp of approval” when interacting with others.

When they receive this new, signed key, they can import it, adding the signing information you’ve generated into their GPG database. They can do this by typing:

```
gpg --import ~/signed.key
```

They can now demonstrate to other people that *you* trust that their identity is correct.

# How to make your public key highly available

Because of the way that public key encryption is designed, there is not anything malicious that can happen if unknown people have your public key.

With this in mind, it may be beneficial to make your public key publicly available. People can then find your information to send you messages securely from your very first interaction.

You can send anyone your public key by requesting it from the GPG system:

```
gpg --output ~/mygpg.key --armor --export your_email@address.com
```

You can then send this file to the other party over an appropriate medium.

If you want to publish your key to a key server, you can do it manually through the forms available on most of the server sites.

Another option is to do this through the GPG interface. Look up your key ID by typing:

```
gpg --list-keys your_email@address.com
```

The \*\*starred\*\* portion in the output below is the key ID (look for the `pub` along the left-hand column if you’re uncertain about which one to use). It is a short way to reference the key to the internal software.

```
Output
pub   4096R/**311B1F84** 2013-10-04
uid                  Test User <test.user@address.com>
sub   4096R/8822A56A 2013-10-04
```

To upload your key to a certain key server, you can then use the syntax:

```
gpg --send-keys --keyserver pgp.mit.edu key_id
```

The key will be uploaded to the specified server. Afterwards, it will likely be distributed to other key servers around the world.

# Encrypt and decrypt messages with GPG

You can encrypt messgaes using the `--encrypt` flag for GPG:

```
gpg --encrypt --sign --armor -r  person@email.com your_email@address.com name_of_file
```
This encrypts the message using the recipient’s public key, signs it with your own private key to guarantee that it is coming from you, and outputs the message in a text format instead of raw bytes. The filename will be the same as the input filename, but with an `.asc` extension.

You should include a second `-r` recipient with your own email address if you want to be able to read the encrypted message. This is because the message will be encrypted with each person’s public key, and will only be able to be decrypted with the associated private key.

So if it was only encrypted with the other party’s public key, you would not be able to view the message again, unless you somehow obtained their private key. Adding yourself as a second recipient encrypts the message two separate times, one for each recipient.

# Decrypt messages

When you receive a message, simply call GPG on the message file:

```
gpg file_name.asc
```

If instead of a file, you have the message as a raw text stream, you can copy and paste it after typing gpg without any arguments. You can press “CTRL-D” to signify the end of the message and GPG will decrypt it for you.

# Key maintenance

There are a number of procedures that you may need to use on a regular basis to manage your key database.

To list your available GPG keys that you have from other people:

```
gpg --list-keys
```

Your key information can become outdated if you are relying on information pulled from public key servers. You do not want to be relying on revoked keys, because that would mean you are trusting potentially compromised keys.

You can update the key information by issuing:

```
gpg --refresh-keys
```

You can pull information from a specific key server by using:

```
gpg --keyserver key_server --refresh-keys
```

You may receive error messages if any of your keys cannot be foudn on the key server.

To recieve a gpg key from a specified keyserver when searching by name:

```
gpg --keyserver <site of keyserver> --search-keys <key name/id>
```

For example the current [posit key](https://posit.co/code-signing/) can be imported with:
```
gpg --keyserver keys.openpgp.org --search-keys 51C0B5BB19F92D60
```

You will need to then select `1` or the number of keys you'd like to import to confirm importing.

You can also import keys with the given _keyIDs_ from a keyserver:

```
gpg --keyserver hkps://keys.openpgp.org --recv-keys 288DD1632F6E8951
```

You are also able to import a plaintext file with a gpg keys with:
```
gpg --import /path/to/filewith.key
```

# Resources
* [How To Use GPG to Encrypt and Sign Messages](https://www.digitalocean.com/community/tutorials/how-to-use-gpg-to-encrypt-and-sign-messages)
* [The GNU Privacy Handbook](https://www.gnupg.org/gph/en/manual.html)
* [GPG/PGP Basics](https://aplawrence.com/Basics/gpg.html)
* [What is GPG/PGP and how do I use it?](https://www.privex.io/articles/what-is-gpg)
* [Using the GNU Privacy Guard](https://www.gnupg.org/(en)/documentation/manuals/gnupg/index.html#SEC_Contents)
* 

