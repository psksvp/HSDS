SOURCES=$(wildcard ./book*.md)

outputDirs:
	mkdir -p ./output

epub: $(SOURCES) outputDirs
	pandoc --embed-resources  -t epub3 --css=style.epub.css \
					--metadata title="The Heaven Sword and Dragon Saber (倚天屠龍記)" \
					--metadata author="Jin Yong" \
					--epub-cover-image=cover.jpeg \
					--top-level-division=chapter \
					-o output/HSDS.epub README.md $(SOURCES)
           
html:  $(SRCS) outputDirs 
	pandoc --embed-resources=true --standalone \
					-t html5 \
					--toc \
					--css=style.epub.css \
					--top-level-division=chapter \
					--metadata pagetitle="The Heaven Sword and Dragon Saber (倚天屠龍記) by Jin Yong" \
					-o output/HSDS.html README.md $(SOURCES)

clean:
	rm -rf output