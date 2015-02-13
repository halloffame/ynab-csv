# ynab-csv


Tool for making your CSV files ready to import into YNAB.

http://halloffame.github.io/ynab-csv/

**NOTE:** currently works best in Chrome. See "Known Issues" below for more details.


## How to Use

1. Visit the link above.
2. Drop or select the the csv file you want to make ready for YNAB.
3. For each column in the YNAB data file, choose which column you want to pull from your source data file.
4. Save the new YNAB file and you are ready to import that right into YNAB!

## Privacy

Your data never leaves your computer. All the processing happens locally. This is part of the reason Firefox and Safari have issues saving the new file.


## Known Issues

* Currently **Firefox** saves the file with a `.part` extension and **Safari** save the file with the filename as `Unknown`. You will probably need to rename these files before importing them into YNAB. For best support just use **Chrome** for now.

## Reporting Issues

If you have any other issues or suggestions, go to https://github.com/halloffame/ynab-csv/issues and create an issue if one doesn't already exist. If the issue has to do with your csv file, please create a new gist (https://gist.github.com/) with the content of the CSV file and share the link in the issue. If you tweak the CSV file before sharing, just make sure whatever version you end up sharing still causes the problem you describe.

## Contribute

1. Fork and clone the project
2. `cd` into project
3. Run `npm install`   # You will need to install node and npm if it is not already
4. Run `npm start`
5. Make your changes locally and test them to make sure they work
6. Commit those changes and push to your forked repository
7. Make a new pull request

