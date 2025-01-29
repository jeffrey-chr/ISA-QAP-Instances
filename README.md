# ISA-QAP-Instances
Quadratic Assignment Problem instances

## Initial Instance Space

The "QAPLIB" instances are from the Quadratic Assignment Problem Library sourced from e.g. https://coral.ise.lehigh.edu/data-sets/qaplib/

The "Drezner" instances are those proposed by Z. Drezner, P. Hahn and E. Taillard in Section 2.1 of "Recent Advances for the Quadratic Assignment Problem with Special Emphasis on Instances that are Difficult for Meta-Heuristic Methods", Annals of Operations Research 139, 65–94, 2005, sourced from http://mistic.heig-vd.ch/taillard/problemes.dir/qap.dir/qap.html

The "TermGen" instances have been created by the generator proposed by Section 2.2 of the same paper. We note that the tai-e instances avaliable at the above link do not appear to meet the specifications of this generator, and hence omit them.

The "PaluGen" instances have been created by the generator proposed by G. Palubeckis in "Generating hard test instances with known optimal solution for the rectilinear quadratic assignment problem", Journal of Global Optimization, 1999, vol.15, n.2, 127-156. 

The "TaiBGen" instances have been created by the generator proposed by E. Taillard in "Comparison of iterative searches for the quadratic assignment problem". These augment the similar instances already present in QAPLIB.

The "UniRndGen" instances result from generating all problem data from a uniform random distribution. These augment the similar instances already present in QAPLIB.

The "StuFerGen" instances have been created by the generator proposed by T. Stutzle and S. Fernandes in "New benchmark instances for the QAP and the experimental analysis of algorithms", volume 3004 of "Lecture Notes in Computer Science". The corresponding instances are created by this generator.

The "Hypercube" instances are created by a generator novel to this work. (Citation to be added later.)

The "QAPSAT" instances have been created by the generator proposed by S. Verel, S.L. Thomson, and O. Rifki in "Where the really hard quadratic assignment problems are: The qap-sat instances", Lecture Notes in Computer Science, 2024 129 – 145. The code for this generator is available at https://gitlab.com/verel/qap-sat and we do not reproduce it here.

## Expanded Instance Space

The "Recomb" instances, referred to as "Hybrid" instances in our paper, combine distance and flow generators from different classes to create a new QAP instance. (We do not combine specific instances since this would limit our options to instances of the same size.)

The "FlowCluster" instances combine a Hypercube or Terminal-type distance matrix with a flow matrix based on clusters of facilities with large flows between them, in various patterns. 

The "Evolved Flow" instances take a distance matrix from one of the above instance classes, and combine it with a flow matrix created by a generator whose parameters are evolved to produce a desired result.

## Instances not included in Analysis

The "tinytest" instances are very small instances useful for testing feature measurement (for example, for n <= 9 it is practical to enumerate all possible solutions).

The "Palubeckis" instances, based on the same generator as stated above, were previously hosted at https://www.personalas.ktu.lt/~ginpalu/qproblem.html. Since this link is now defunct, we instead used new instances for the analysis.

## Other Files

The "Lists" files list groups of similar instancces to be taken together e.g. to be solved by an algorithm.

The "Descriptions" files list the paramaters used to generate certain of the instances.

The "Solutions" file contains the solutions to the QAPLIB instances.