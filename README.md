# The Psalter Maps, and other medieval mappamundi, transcribed and normalized

## Current maintainers

This dataset and repository is currently maintained by Heather G. Wacha (<wacha2@wisc.edu>) and Jacob G. Levernier (<jlevern@upenn.edu>).

## Contributors

<!--
Initial contributors:
-->

- Heather G. Wacha: medieval domain expert who compiled and normalized the data
- Jacob G. Levernier: provided data management and data schema advice, and managed data processing.

## Contents

The dataset currently contains the following *mappamundi:*

\[Full citations will be added soon.]

- The Psalter Pictorial Map  
Citation: BL Add. MS 28681, fol. 9r
- The Psalter List Map  
Citation: BL Add. MS 28681, fol. 9v
- Hugh of St. Victor's *Descriptio Mappamundi*  
Citation: Gautier Dalché, Patrick. *La «Descriptio mappe mundi» de Hugues de Saint-Victor.* Paris, Études Augustiniennes, 1988.
- Lambert de Saint-Omer's Map(s)  
Citation: Ghent, Ghent University, MS 92
- The Munich Isidore Map  
Citation: Bayerische Statsbibliotek, Clm 10058, fol.154v
- The Cotton Map  
Citation: BL, Cotton B v
- The Higden Royal 14C IX Map
- Hugh of St. Victor's *Chronicon* Map   
Citation: Baron, Roger. "Hugh of Saint-Victor, Lexicographe." Cultura Neolatina 16 (1956): 109-145.

## Using this dataset

### Conditions of use

Please see the `LICENSE.txt` file for license information (i.e., the conditions under which you may reuse this dataset). In summary, we have released this dataset for others (especially researchers) to use freely, *provided the dataset is cited (see below) and any changes to it are shared back with the research community (preferably through this repository).*

Please see the `CITATION.txt` file for an example citation to use for this dataset. That file also contains information on how to refer to different "versions" of the dataset going forward.

### Understanding and processing the dataset

After the first column, each column of the dataset represents one reading of one map. Currently, each map is represented across two columns. Rows are unimportant in the dataset, except that, within each map, a row contains variations on the same toponym from that map, across its two columns in the dataset:

1. The **`Diplomatic_Reading`** column contains an exact transcription of the contents of the map.
1. The **`Normalized_Reading`** column contains a normalized version of the `Diplomatic_Reading` column. See [below](#our-approach-to-normalizing "Our approach to normalizing") for detail on our approach to normalizing these data.

The `Extras` directory contains an example script written in R for transforming the dataset into a toponym-to-map "edge list" / ["adjacency list"](https://en.wikipedia.org/wiki/Adjacency_list "Wikipedia: 'Adjacency List'"), to facilitate network analyses of these data. This script also facilitates creating an alphabetized text file of all unique toponyms across all maps, to facilitate deduplication (e.g., looking for mis-spelled, etc. toponyms).

### Our approach to normalizing

\[We will be adding this soon.]

### Contributing to this dataset

## Contributing to this Repository

We welcome contributions to this dataset!

**We also welcome contributions in documentation** -- if there are things that you had to work to understand (for example, how to even download these files in the first place), we welcome additional text for a Wiki that we can attach to this repository.

If you would like to contribute to this repository, please follow these steps:

1. 
  1. If you feel comfortable using Git:
    1. Make a fork of this repository (from this repository's page on GitHub, click "Fork").
    1. Create a single commit that contains all of the changes that you would like to share (either by "squashing" your commits (see [here](http://stackoverflow.com/a/5189600 'StackOverflow: Squash my last X commits together using Git'), for example), or by just copying your altered files into a fresh copy of this repository).
    1. Make a pull request through GitHub (from your copy of the repository in GitHub, click "New Pull Request").
  1. If you do not feel comfortable using Git: Send an email to the current repository maintainers listed [above](#current-maintainers 'Current maintainers'); we will work together to get your changes incorporated, and will add you to the [list of contributors](#contributors "List of contributors") in this Readme. We will also add you (for any affected versions of the dataset) to the example citation in the `CITATION.txt` file.

