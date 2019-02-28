# What is a NeTEX file ?

NeTEx (Network Exchange) is a reference format for data exchange, collective transport, defined at European level. It provides a description of network topology, schedules, pricing datas and access to information services.

A NeTEx file is simply a unique or group of XML files, that must be compliant with a (complete) XSD schema.  

For French readers, you’ll find a lot of resources on [this page](http://www.normes-donnees-tc.org/format-dechange/donnees-theoriques/netex/).

You can read the European NeTEx profil which gives a good overview on what can contain a NeTEx file [here](https://blog.enroute.mobi/app/uploads/2019/02/prCEN-TS-16614-PI-Profile-FV-E-2018-Final-Draft-1.pdf).

# Install

```
git clone --recurse-submodules https://github.com/af83/netex-cli-validator.git
gem install bundler
bundle install
```

# Validate a file

We benefit from the amazing work performed by the NeTEx CEN team. They maintain an uptodate and living XSD in their GitHub repository : https://github.com/NeTEx-CEN/NeTEx. They provide both an XSD of NeTEx format and a large set of examples.

Our internal tool uses their XSD to valid a given NeTEx file. This simple command line tool in Ruby will give you a direct feedback of your XML file :

```
$ bundle exec ruby netex-cli-validator.rb netex_full20190212.xml
1060:27: ERROR: Element '{http://www.netex.org.uk/netex}CompanyCode': This element is not expected. Expected is one of ( {http://www.netex.org.uk/netex}validityConditions, {http://www.netex.org.uk/netex}ValidBetween, {http://www.netex.org.uk/netex}alternativeTexts, {http://www.netex.org.uk/netex}keyList, {http://www.netex.org.uk/netex}Extensions, {http://www.netex.org.uk/netex}BrandingRef, {http://www.netex.org.uk/netex}PublicCode, {http://www.netex.org.uk/netex}PrivateCode, {http://www.netex.org.uk/netex}CompanyNumber, {http://www.netex.org.uk/netex}ExternalOperatorRef ).
1078:22: ERROR: Element '{http://www.netex.org.uk/netex}stopPlaces': This element is not expected. Expected is one of ( {http://www.netex.org.uk/netex}validityConditions, {http://www.netex.org.uk/netex}ValidBetween, {http://www.netex.org.uk/netex}alternativeTexts, {http://www.netex.org.uk/netex}keyList, {http://www.netex.org.uk/netex}Extensions, {http://www.netex.org.uk/netex}BrandingRef, {http://www.netex.org.uk/netex}Name, {http://www.netex.org.uk/netex}Description, {http://www.netex.org.uk/netex}TypeOfFrameRef, {http://www.netex.org.uk/netex}BaselineVersionFrameRef ).
38934:84: ERROR: Element '{http://www.netex.org.uk/netex}LineRef': This element is not expected. Expected is one of ( {http://www.netex.org.uk/netex}DirectionRef, {http://www.netex.org.uk/netex}pointsInSequence, {http://www.netex.org.uk/netex}InverseRouteRef ).
38998:28: ERROR: Element '{http://www.netex.org.uk/netex}stopAssignements': This element is not expected. Expected is one of ( {http://www.netex.org.uk/netex}serviceLinks, {http://www.netex.org.uk/netex}servicePatterns, {http://www.netex.org.uk/netex}stopAreas, {http://www.netex.org.uk/netex}connections, {http://www.netex.org.uk/netex}tariffZones, {http://www.netex.org.uk/netex}stopAssignments, {http://www.netex.org.uk/netex}timingPoints, {http://www.netex.org.uk/netex}timingLinks, {http://www.netex.org.uk/netex}timingPatterns, {http://www.netex.org.uk/netex}journeyPatterns ).

```
