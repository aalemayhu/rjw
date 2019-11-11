export tag Word
    def setup
        console.log "data -> {data}"

    def render
            <self>
                if !data
                    <h2.loading> "Loading, please wait..."
                else
                    if data:kanji
                        <ruby> "{data:kanji}"
                            <rp> "("
                            <rt> "{data:kana}"
                            <rp> ")"
                    else if data:kana                     
                        <h2.kana lang="ja"> "{data:kana}"
                    else
                        <h2> JSON.stringify(data, null, 2)
                    <h3.english> data:english
### css
.kana, ruby {
    font-size: 4rem;
    justify-self: center;
}

.kana, .kanji {
    font-family: 'Sawarabi Mincho', sans-serif;
}
@media (max-width: 500px) {
    .kana {
        font-size: 3rem;
    }
}
###

