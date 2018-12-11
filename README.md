Cube complexity analyzer for Magic the Gathering written in Ruby using the Gatherer API.

Made to analyze [my bucket cube](https://github.com/SLiV9/BucketCube).

# Usage

Create a list of Magic the Gathering card names in `data/cube.txt` and run one of the following scripts to analyze it.

### `count.rb`

Lists the number of cards per color identity, e.g. "White", "Red Green" or "Colorless", and the total number of cards.

Useful to make sure each color is represented equally.

### `types.rb`

Lists the number of card types, supertypes and subtypes among cards in the cube.
Optionally you can filter by color, e.g. `types.rb Red Colorless` for all types among colorless cards and cards with Red in their manacost.

Useful to make sure there is a nice ratio of creatures and non-creatures.

### `text.rb`

Lists the keywords, ability words, activated ability costs and *text effects* among cards in the cube.
Text effects are fragments of rules text separated by periods or commas. Card names in text effects are replaced with `~`. Quoted text effects, such as those granted by certain enchantments, are extracted and appear in the original effect as `""`.
As with `types.rb`, you can filter by color.

Useful if you want to reduce the complexity of the cube by removing keywords or text effects that occur only on a single card.

### `cube.rb`

This module downloads the card names listed in `data/cube.txt` from the Gatherer API and stores them in the subfolder `cache`. Its methods are called automatically by the other scripts.

If the cube list does not exist, a default list is created automatically the first time a script is run.
