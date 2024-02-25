
<!--#echo json="package.json" key="name" underline="=" -->
ubhd-anno-server-22-config-util
===============================
<!--/#echo -->

<!--#echo json="package.json" key="description" -->
Tools that the Heidelberg University Library uses for maintaining config files
for their `anno-server-22` instances.
<!--/#echo -->



Usage
-----

1.  Open a shell in the repo directory.
1.  Obtain an `annoMetadataYAML` file: If you know the secret update URL,
    download it; otherwise, you may use
    `test/fixtures/frontend_fixture_cpgs.input.yaml`.
1.  Move, copy or symlink it to/as `cache/annoMetadataYAML.latest.txt`.
    * The `.txt` is for devel workflow reasons.
      You can change the path by setting the `ORIG_YAML` env var.
1.  Run `./src/convert_anno_metadata.sh`
1.  Output filenames will be logged.
1.  The last log message should be `All done.`


<!--#toc stop="scan" -->



Secrecy considerations
----------------------

#### Update URL for the full `annoMetadataYAML` download

* We keep that URL secret because abuse could inflict excessive server load.
* [OAI](https://en.wikipedia.org/wiki/Open_Archives_Initiative) sets
  are publicly available via our OAI server, and (most?) are also reflected
  on each book's overview page as `<meta name="DC.isPartOf"`.
* The "Sammlungsnummer" is public on each book's overview page in the `tei`
  part of the config script, e.g. `target: 'diglit|sammlung2|cpg389|0000|'`
  (Sammlungsnummer = 2).





Known issues
------------

* Needs more/better tests and docs.




&nbsp;


License
-------
<!--#echo json="package.json" key=".license" -->
MIT
<!--/#echo -->
