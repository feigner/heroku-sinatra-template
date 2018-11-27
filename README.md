# Heroku + Sinatra

Minimum viable webhook handler via Heroku + Sinatra

Put private / configurable values in `.env`

## Commands

Install things:

	bundle install

Start the app locally:

	shotgun config.ru

Deploy:
	
	git push heroku origin
	
View logs:

	heroku logs --tail