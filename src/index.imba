tag App
	prop index default: 0
	def setup
		data = await getJapaneseWords()
		updateIndex
		Imba.commit
		
	def updateIndex
		index = Math.floor(Math.random() * data:length)
	
	def getJapaneseWords
		const url = "https://api.sheety.co/254c026b-d500-458b-9e57-1e3182f56339"
		const request = await window.fetch(url)
		const data = await request.json()
		data

	def currentWord
		if data and data:length > 0
			data[index]		

	def render
		<self.vbox>
			<h1.title> "Random Japanese Word"
			if data and data:length > 0
				<h2> currentWord ? "{currentWord:kanji}" : "..."
				<h2.kana lang="ja"> "{currentWord:kana}"
				<h3.english> "{currentWord:english}"
				<button.new :tap.updateIndex> "New Word"
			else
				<h2.loading> "Loading, please wait..."
			<footer>
					<span> "Made by "
					<a href="https://github.com/scanf"> "Alexander Alemayhu"
					<br>
					<span> 
						"Built with"
						<a href="https://github.com/imba/imba"> " Imba"
					<p> 
						"All the words are from "
						<a href="https://www.csus.edu/indiv/s/sheaa/projects/genki/vocab_main.html"> " Usagi-Chan's Genki Resource Page"

Imba.mount <App>