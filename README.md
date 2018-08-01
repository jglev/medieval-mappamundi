# Toponym Sets from Medieval Mappamundi

## Current maintainers

This dataset and repository is currently maintained by Heather G. Wacha (<wacha2@wisc.edu>) and Jacob G. Levernier (<jlevern@upenn.edu>).

## Contributors

<!--
Initial contributors:
-->

- Heather G. Wacha: medieval domain expert who compiled and normalized the data
- Jacob G. Levernier: provided data management and data schema advice, and managed data processing.

## Additional Acknowledgements

We are grateful for the intellectually supportive environments fostered by the following organzations and individuals:

- The Council on Library and Information Resources (CLIR)
- Martin Foys, Professor of English, University of Wisconsin, Madison
- *Digital Mappa*
- The University of Pennsylvania Libraries

## Contents

The dataset currently contains the following *mappamundi:*

- Psalter Pictorial Map  
*Citation: British Library, Add. MS 28681, fol. 9r*
- Psalter List Map  
*Citation: British Library, Add. MS 28681, fol. 9v*
- Hugh of St. Victor's *Descriptio Mappamundi*  
*Citation: Gautier Dalché, Patrick. *La «Descriptio mappamundi» de Hugues de Saint-Victor.* Paris, Études Augustiniennes, 1988.*
- Lambert de Saint-Omer's Map(s)  
*Citation: Ghent, Ghent University, MS 92, f. 241r and Wolfenbüttel, Herzog Augustbibliothek Ms. Gudeanus lat. 1., fol. 69v*
- Munich Isidore Map  
*Citation: Bayerische Statsbibliotek, Clm 10058, fol. 154v*
- Cotton Map  
*Citation: British Library, Cotton Tiberius B v, fol. 56r*
- Higden Royal 14C IX Map  
*Citation: British Library, Royal 14.C IX, ff. 1v-2r*
- Hugh of St. Victor's *Chronicon* Map   
*Citation: Baron, Roger. "Hugh of Saint-Victor, Lexicographe." Cultura Neolatina 16 (1956): 109-145.*
- Sawley Map  
*Citation: Cambridge Corpus Christi College, Parker Library, 66, p. 2*
- Hereford Map  
*Citation: Hereford, Hereford Cathedral*

## Using this dataset

### Conditions of use

Please see the `LICENSE.txt` file for license information (i.e., the conditions under which you may reuse this dataset). In summary, we have released this dataset for others (especially researchers) to use freely, *provided the dataset is cited (see below) and any changes to it are shared back with the research community (preferably through this repository).*

The DOI for this repository will automatically update every time there is a new "Release" in GitHub. You can view the [list of Releases](https://github.com/publicus/medieval-mappamundi/releases).

The DOI for the [latest release](https://github.com/publicus/medieval-mappamundi/releases/latest) of this dataset can be found at [Zenodo](https://doi.org/10.5281/zenodo.1039872).

### Understanding and processing the dataset

After the first column, each column of the dataset represents one reading of one map. Currently, each map is represented across two columns. Rows are unimportant in the dataset, except that, within each map, a row contains variations on the same toponym from that map, across its two columns in the dataset:

1. The **`Diplomatic_Reading`** column contains an exact transcription of the contents of the map.
1. The **`Normalized_Reading`** column contains a normalized version of the `Diplomatic_Reading` column. See [below](#our-approach-to-normalizing "Our approach to normalizing") for detail on our approach to normalizing these data.

#### "Tidy" data

We chose this data format to ease adding data to the dataset by a researcher using a spreadsheet program such as Microsoft Excel or LibreOffice Calc. However, this format is not particularly useful for some types of analysis. Thus, the scripts in `data_transformation_scripts` will transform the dataset into a ["tidy" format](http://r4ds.had.co.nz/tidy-data.html), which looks like this:

|map_name                     |normalized                   |diplomatic                   |
|:----------------------------|:----------------------------|:----------------------------|
|psalter_pictorial_map        |transitus hebreorum          |[Transitus Israelis]         |
|psalter_pictorial_map        |trogodite                    |[Trogodite]                  |
|psalter_list_map             |italia                       |Ytalia                       |
|psalter_list_map             |zeugis r.                    |Zeugi                        |
|munich_isidore_map           |wulturnus v.                 |uulturnus                    |
|munich_isidore_map           |safris                       |uicus Safrim                 |
|descriptio_hsv_map           |wulturnus v.                 |wulturnus                    |
|descriptio_hsv_map           |zephirus v.                  |zephirus                     |
|lambert_de_saint_omer_map(s) |ponticum mare                |mare ponticum                |
|lambert_de_saint_omer_map(s) |zona fervida inhabilitabilis |Zona fervida inhabilitabilis |
|cotton_map                   |sicilia                      |[sicilia]                    |
|cotton_map                   |transitus hebreorum          |[transitur hebreorum]        |
|bl_royal_14.c_ix_map         |italia                       |ytalia                       |
|bl_royal_14.c_ix_map         |italicus s.                  |ytalicus sinus               |
|chronicon_hsv_map            |zeugis r.                    |zeugis                       |
|chronicon_hsv_map            |vienne                       |vienna                       |
|sawley_map                   |zabulon                      |zabulon                      |
|sawley_map                   |isachar                      |ysachar                      |
|hereford_map                 |zazintus i.                  |zazintus                     |
|hereford_map                 |ylis fl.                     | Fluuius Ylis                |

These scripts can either create a tidy dataset with a single file for all maps, or a set of tidy datasets, with one file per map.

### Our approach to normalizing

\[We will be adding this soon.]

## Contributing to this dataset and repository

We welcome contributions to this dataset!

**We also welcome contributions concerning documentation** -- if there are things that you had to work to understand (for example, how to even download these files in the first place), we welcome additional text for a Wiki that we can attach to this repository.

If you would like to contribute to this repository, please follow these steps:

1. If you feel comfortable using Git:
    1. Make a fork of this repository (from this repository's page on GitHub, click "Fork").
    1. Create a single commit that contains all of the changes that you would like to share (either by "squashing" your commits (see [here](http://stackoverflow.com/a/5189600 'StackOverflow: Squash my last X commits together using Git'), for example), or by just copying your altered files into a fresh copy of this repository).
    1. Make a pull request through GitHub (from your copy of the repository in GitHub, click "New Pull Request").
1. If you do not feel comfortable using Git: Send an email to the current repository maintainers listed [above](#current-maintainers 'Current maintainers'); we will work together to get your changes incorporated, and will add you to the [list of contributors](#contributors "List of contributors") in this Readme. We will also add you (for any affected versions of the dataset) to the example citation in the `CITATION.txt` file.

