---
colorSchema: light
layout: cover
title: LLMs for research FORC
theme: neversink
monaco: false
drawings:
  persist: false
# slide transition: https://sli.dev/guide/animations.html#slide-transitions
transition: slide-left
# enable MDC Syntax: https://sli.dev/features/mdc
mdc: true
hideInToc: true
---

# Harnessing LLMs for research
Foundations of Research Computing (FORC) Camp

_Sajid Ali_, _NYU Research Technology Services_ <a href="https://services.rt.nyu.edu/" class="ns-c-iconlink"><mdi-open-in-new /></a>  

<div class="abs-br m-6 text-xl">
  <a href="https://github.com/NYU-RTS/llm-forc" target="_blank" class="slidev-icon-btn">
    <carbon:logo-github />
  </a>
</div>

<!--
The last comment block of each slide will be treated as slide notes. It will be visible and editable in Presenter Mode along with the slide. [Read more in the docs](https://sli.dev/guide/syntax.html#notes)
-->

---
hideInToc: true
---
  
# Table of contents

<Toc text-sm minDepth="1" maxDepth="1" />

---
layout: side-title
side: l
color: violet
titlewidth: is-4
align: rm-lm
---

:: title ::

# What are LLMs?

# <mdi-arrow-right />

:: content ::

Let's go over some basics of what LLMs are and how they generate text.

---
layout: top-title-two-cols
columns: is-5-7
align: l-lt-lt
color: violet-light
---


[^ref1]: <div class="ns-c-cite">Adapted from Hands-On Large Language Models by Jay Alammar & Maarten Grootendorst.</div>

:: title ::

# Neural Networks

:: left ::

- Neural networks are the building blocks of the components that make up an LLM.

- Connected layers of varying shapes

- Inputs "pass" through the network to generate output


:: right ::
<img src="/neural_nets.png"/>

Overview of neural networks[^ref1] 


---
layout: top-title-two-cols
columns: is-7-5
align: l-lt-lt
color: violet-light
---

[^ref1]: <div class="ns-c-cite">[Attention Is All You Need](https://arxiv.org/abs/1706.03762)</div>
[^ref2]: <div class="ns-c-cite">Adapted from Hands-On Large Language Models by Jay Alammar & Maarten Grootendorst.</div>


:: title ::

# LLMs overview

:: left ::

- Within natural language, the meaning of a word depends on the context it occurs in, but older language models did not account for this. 

- Recent advances in model architectures[^ref1] to account for it allowed language models to become better at a wider variety of tasks.

- LLMs are neural networks which have billions of parameters!


:: right ::
<img src="/llms_uses.png"/>

Applications of LLMs[^ref2]


---
layout: top-title-two-cols
columns: is-6
align: l-lt-lt
color: violet-light
---


[^ref1]: [<div class="ns-c-cite">Tiktokenizer</div>](https://tiktokenizer.vercel.app/?model=gpt-4o)


:: title ::

# From text to tokens

:: left ::

- Tokens are the basic unit of operation for LLMs, these are typically units of language 
smaller than words.

- Each token is internally represented by a token embedding

- Special tokens are used to denote things like start/end of sequence, denote the "role" for a sequence, etc.

:: right ::
<img src="/tiktoenizer.png"/>

Interactive demo of tokenization, head to [this link](https://tiktokenizer.vercel.app/?model=gpt-4o) and try it out![^ref1] 


---
layout: top-title-two-cols
columns: is-8
align: l-lt-lt
color: violet-light
---


[^ref1]: <div class="ns-c-cite">Adapted from Hands-On Large Language Models by Jay Alammar & Maarten Grootendorst.</div>

:: title ::

# How do LLMs generate output?

:: left ::

- Input tokens are then passed through the LLM to generate an output token. 
- This output token is appended to the input to generate another token.
- So forth until either a special `eos` (end of sequence) token is generated or the number of tokens exceeds the maximum number of tokens that the LLM was allowed to generate.


:: right ::
<img src="/one_token_at_a_time.png"/>

LLMs generate output one token at a time[^ref1] 


---
layout: top-title-two-cols
columns: is-5
align: l-lt-lt
color: violet-light
---


[^ref1]: <div class="ns-c-cite">Adapted from Hands-On Large Language Models by Jay Alammar & Maarten Grootendorst.</div>

:: title ::

# Token sampling

:: left ::

- Rather than generating a single token, LLMs generate a distribution.
- These tokens are then sampled to select one token.
- You can alter how the LLM performs this sampling by adjusting the `temperature` parameter.


:: right ::
<img src="/token_probs.png"/>

LLMs generate output one token at a time[^ref1]

---
layout: side-title
side: l
color: violet
titlewidth: is-4
align: rm-lm
---

:: title ::

# Hands on

# <mdi-arrow-right />

:: content ::

Head over to app.portkey.ai and choose the "Login with SSO" option with your NetID@nyu.edu email address.


---
layout: side-title
side: r
color: violet-light
align:  lm-lm
---

:: title ::
# Summary

# <mdi-arrow-left />

Reach out to Research Technology Services, https://services.rt.nyu.edu/

<PoweredBySlidev mt-10 />

:: content ::

We have learnt:
-  What LLMs are.
-  How they generate text.
-  What embeddings are.
-  How NYU facilitates your access to AI resources.