import {Word} from './Word'

tag App
	### css
	body {
	    margin: 0;
	    height: 100vh;
	    width: 100vw;
	    font-size: 1rem;
	    background: #383838;
	}
	
	
	.vbox {
	    justify-items: center;
	    align-items: center;
	    display: grid;
	    height: 100vh;
	    color: white;
	    grid-template: repeat(4, 1fr)/ 1fr;    
	}
	
	.new {
	    align-self: end;
	    padding: 1rem;
	    margin-top: 1rem;
	    border-radius: 3px;
	    min-width: 200px;
	    background: #d5f1f9;
	    font-size: 2rem;
	    border: 3px solid transparent;
	}
	
	.new:hover {
	    background: #0984e3;    
	    border: 3px solid transparent;
	    color: white;
	    transition-duration: 1s;
	}
	
	
	
	footer {
	    margin-top: 1rem;
	    border-top: 1px solid gray;
	    width: 100%;
	    text-align: center;
	    padding-top: 1rem;
	    border-top-width: 1px;
	}
	
	a {
	    color: #00e0e0;
	}
	
	a:hover, a:active {
	    color: #DCC6E0;
	}
	
	noscript {
	    color: white;
	    text-align: center;
	}
	
	@media (max-width: 500px) {
	    h1 {
	        font-size: 1.5rem;
	    }
	
	    .new {
	        padding: 0px;
	    }
	
	    footer {
	        display: none;
	    }
	}
	###
	prop index default: 0
	prop currentWord default: {_: "Loading please wait"}

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
