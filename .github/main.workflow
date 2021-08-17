name: MONO everyday

on:
    schedule:
    # * is a special character in YAML so you have to quote this string
        - cron:  '0 * * * *'

jobs:
    build:
        runs-on: ubuntu-latest

        steps:
        -   name: Checkout master
            uses: actions/checkout@v2
            with:
                ref: master

        -   name: Set up Python 3.7
            uses: actions/setup-python@v1
            with:
                python-version: 3.7

        -   name: Download MONO
            run: |
                cd MONO_Pic
                pip install -r requirements.txt
                python ./main.py

        -   name: commit
            run: | 
                git config --global user.email borber.drum@gmail.com
                git config --global user.name BORBER
                git add .
                git commit -m "update" -a

        -   name: Push changes
            uses: ad-m/github-push-action@master
            with:
                github_token: ${{ secrets.GITHUB_TOKEN }}