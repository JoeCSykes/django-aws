dockerRunserver:
	python3 manage.py make migrations
	python3 manage.py migrate
