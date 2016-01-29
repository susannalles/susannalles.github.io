---
layout: default

---

**About this project**

The challenges of the project *Vitae Illustrium Virorum* are as follows:  

1. This project contains a serie of biographies written in Latin by Italian humanists and translated by the Spaniard Alfonso de Palencia at the end of the XVth century.

2. The aim is to publish the Latin text and an Spanish translation and display them synchronically in a unique a simple interface. 

3. As far as the Spanish text is concerned, we only have one edition, the *princeps* and this fact simplifies the textual tradition of the project. On the other hand, we know for sure the exact edition of the Latin text published by Jenson in 1478 in Venice. Thus the images of both texts have to be available to contrast the edition with the facsimile. 

4. Each of the texts has a critical apparatus, and a set of footnotes.

4. This project is still a work in progress and therefore we need a flexible infrastructure that will allow the manipulation of the core files (XML-TEI) and the update of the layout outcome, as well as will enable collaboration. 

 Following the principles of the [xpmethod](http://xpmethod.plaintext.in]), we belive that a good practice would be: 
 
* Keep the Latin Text and the Spanish Translation in separate files and as the source files, encoded in XML-TEI. 
* These source files will be integrated under form of plaintext to facilitate later development of online and print resources (web site, and critical edition). 
* Source files must be placed under version control when possible to facilitate back-up, the formation of drafts, branches, and to prevent editorial conflicts. 

To these ends, we propose: 
 
 a. To use git / GitHub for all textual material. Available [here](https://github.com/susannalles/Vitae). <br/>
 b. To use an existing responsive front-end framework to make easy to design a layout build in flexible "boxes". <br/>
 c. Keep the XML-TEI as source code and as main working station. <br/>
 d. Transform the textual parts of the XML-TEI through the XSLT language into markdown files. <br/>
 e. Build the infrastructure of a simple website using Jekyll 

In comparison to the existing platforms, our approach has the significant advantage of long-term sustainability: scalability, unified backup and versioning workflows, resilience to bit decay and editorial conflict, and powerful collaboration tools. Most importantly, it is easy to imagine building textual interfaces, critical editions, and online resources to make this rapidly growing archive more accessible to the public.







