# CryptoKitties "Gene Science" Glossary - Technical Terms & Definitions

## Active gene
A gene in the primary / dominant gene slot that is expressed as a Cattribute in a Kitty. 
Currently, most Kitties have 8 active genes.
All active genes are in the primary / dominant gene slot, but not all genes in the primary / dominant gene slot are active 
(e.g. WE05 is not active even when it is in the primary / dominant gene slot). 
[The term "Primary / Dominant" is preferred over "Active" in any case where the distinction between 
the Cattribute being expressed is not explicitly required.]

## Base level gene 
Some genes are released at gen 0, and these are called base level genes (INT 00-15). 
Certain pairs of these genes, when bred together, have a chance to mutate - 
two base level genes can create a first order mutation (M1, INT 16-23), two M1 genes can create a second order mutation (M2, INT 24-27), etc. 
The highest possible mutation is a fourth order mutation (M4, INT31).

## Cattribute
these are what you see on a Kitty—both the visible expression of the trait representing a gene and the resulting Cattribute tag
on that Kitty's profile. Note: Fancies and Exclusives do not have any Cattributes, 
even though the primary / dominant eye color gene still determines the background color for Fancies and Exclusives.

## DNA sequence 
A Kitty's DNA sequence is a 256-bit number that exists on the blockchain and determines a Kitty's primary / dominant genes, 
as well as the hidden / recessive genes for each of the 12 trait categories. 
When two Kitties breed, the parents' DNA sequences are mixed in a particular way to determine the DNA sequence 
that will define the resulting Kitty. 

## Gene 
A gene is a 5-bit chunk (i.e. 11001) from a Kitty's DNA sequence. All genes belong to one of 12 trait categories, 
though not all genes map directly to a named Cattribute. All genes fall into one of four slots within a given trait category. 
Each Kitty has 48 genes in total, most of which are not expressed (shown visually on the Kitty).

## Gene code
A gene code is a shorthand used to identify genes, particularly those that do not map to any known Cattribute.
A gene code consists of the two letter abbreviation of the gene's associated trait category 
and the two digit integer representation of the 5-bit chunk that makes up the gene in the dna sequence  (e.g. WE05). 
See the gene page to understanding how to read these genes. 

## Hidden / recessive gene 
Any gene that does not actively cause the expression of a Cattribute in a Kitty. 
This could be because it is in a hidden / recessive slot, because the gene does not map to a Cattribute,
or because the Kitty is Fancy or Exclusive and thus expresses no Cattributes. 
Currently, most Kitties have 40 hidden / recessive genes. There are three hidden / recessive gene slots for every trait category,
and these are designated as H1 / H2 / H3  or R1 / R2 / R3. 
The more deeply hidden / recessive a gene is, the less likely it is to pass down to the primary gene slot in any offspring.

## Primary / dominant genes
Genes which are in the primary / dominant gene slot in the DNA sequence for a given trait category. 

## Special gene
There is one remaining gene, INT32, which we call a special gene because there is no way to mutate into this gene 
without involving this gene in the mutation. If and how this gene will be released, 
or what effect(s) it will have are an unknown mystery to all.

## Trait categories
The known trait categories are accent colour (AC), highlight colour (HC), base colour (BC), mouth (MO), pattern (PA), 
eye shape (ES), eye colour (EC), fur (FU), wild element (WE), and environment (EN).
One category is called Purrstige (PU), since genes from this category are required to breed Kitties with Purrstige traits. 
There is additional apparent trait category where no Cattributes have yet been discovered. 
In the community, this trait category is currently called "secret" (SE), until an official name is revealed. 
The term "Cattribute categories" is used colloquially and essentially describes trait categories, 
though it would not really be used to describe "secret" or "unknown" since neither of those categories yet contain any Cattributes.
"Trait" is a colloquial term that sometimes describes a gene and sometimes describes a Cattribute. 
Technically a trait is the name of the Cattribute that a given gene maps to, though we sometimes use the term as a catch-all 
to include genes that don’t map to any Cattributes. To avoid confusion when getting technical about breeding, 
it is always be best to specify whether you are referring to a gene (e.g. this Kitty has a deeply hidden / recessive wingtips gene) 
or a Cattribute (e.g. this Kitty has the wingtips Cattribute).



Sources:

mostly <https://guide.cryptokitties.co/guide/glossary/technical-glossary>
