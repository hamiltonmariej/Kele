# Kele
A Ruby Gem API client to access the Bloc API; Bloc student project.  This gem was created to develop skills as a Rails developer.

Rather than using cURL to access the Bloc Application API, you can use this gem to access student information in your own Rails application or API.  

##How to Install
To install just add `kele` to your Gemfile or use `gem install kele` in your command line.

##How to Use
Once installed, you can:
*Initialize and authorize Kele wih a Bloc username and password using irb; this needs to be done every time you start a new session in irb when working with Kele before using the other commands below:
```
$ irb
>> require 'kele'
=> true
>> Kele.new("jane@gmail.com", "abc123")
```
*Retrieve the current user as a JSON blob;
```
kele_client.get_me
```
*Retrieve a list of their mentor's availability (get the mentor_id from the previous command);
```
kele_client.get_mentor_availability(mentor_id)
```
*Retrieve Bloc curriculum roadmaps and checkpoints (retrieve the roadmap_id from kele_client.get_me; checkpoint_id from get_roadmap command); and
```
kele_client.get_roadmap(roadmap_id)
```
```
kele_client.get_checkpoint(checkpoint_id)
```
*Retrieve a list of their messages, respond to an existing message, and create a new message thread (get arguments for create_message from get_messages or the Bloc_api console).
```
kele_client.get_messages
```
kele_client.create_message(user_id, recipient_id, token, subject, stripped)
```

##License
MIT License
