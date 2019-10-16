import Word from './Word'

tag App
	prop index default: 0
	prop currentWord default: {}

	def setup
		data = await getJapaneseWords()
		updateIndex
		Imba.commit
		
	def updateIndex
		index = Math.floor(Math.random() * data:length)		
		currentWord = data[index]

		console.log "currentWord",currentWord
		Imba.commit
	
	def getJapaneseWords
		const url = "https://api.sheety.co/254c026b-d500-458b-9e57-1e3182f56339"
		const request = await window.fetch(url)
		const data = await request.json()
		data

	def render
		<self.vbox>
			<h1.title> "Random Japanese Word"
			<Word[currentWord]>
			<button.new :tap.updateIndex> "New Word"
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