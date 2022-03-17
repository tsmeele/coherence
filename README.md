# Using an interaction DSL to prevent races in a distributed system.
This dataset contains software used to model check coherence.

The dataset is part of and described in a thesis research by Ton Smeele
executed in 2021 with the above title.

## problemcase-uppaal-and-prototype
This folder contains a labeled transition system model written in UPPAAL 4.1.
Multiple agents issue requests to update a data object and its replicas.
The requests are interleaved.

We measure coherence of values held by the data object and its replicas.
Coherence is not protected when using a naive agent.
The milestone agent uses a locking style that protects coherence, 
regardless of the number of replicas involved,  while
minimizing the lock period.

## mcrl2
This folder contains a protocol simulator written in mcrl2 language.
The concrete protocols comply with a calculus described in the thesis.
This language annotates interactions with coherence information, which
allows us to reason about coherence.
The coherence property is implemented in muCalculus language (g.mcf).

The mcrl2 program includes a set of testcases.


## Author
Ton Smeele - https://orcid.org/0000-0001-6485-4337
