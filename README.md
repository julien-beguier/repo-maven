# repo-maven

Hi,
This is my maven repository, you can find in here my Java libraries. I made those libraries for myself and I know it already exists elsewhere (probably in a better way) but I wanted to know how to do it myself. 

But anyway I release it publicly in case of someone wants to try something new :)

The **Javadoc** is provided on the repo, so don't forget to project>maven>Download Javadoc

In the _**pom.xml**_ add the **following repository**:

	<repository>
		<id>repo-julien-beguier</id>
		<name>Julien Beguier's repo</name>
		<url>http://repo-maven.julienbeguier.fr</url>
	</repository>

####- **DifferentLanguages _(i18n)_**

DifferentLanguages permit you to use an infinity of languages. Let your swing application (or something else) have custom text... If you want your app to run on a variety of computer around the world, you better want every users understand what's written in the menu, panel, anything.

Add the following **dependency**:

	<dependency>
		<groupId>fr.julienbeguier.dl</groupId>
		<artifactId>DifferentLanguages</artifactId>
		<version>0.8</version>
	</dependency>

####- **ParameterFinder**

ParameterFinder handles arguments you provide on the command line. It has a callback system for each argument you "listen" on.

Add the following **dependency**:

	<dependency>
		<groupId>fr.julienbeguier.pf</groupId>
		<artifactId>ParameterFinder</artifactId>
		<version>0.8</version>
	</dependency>
