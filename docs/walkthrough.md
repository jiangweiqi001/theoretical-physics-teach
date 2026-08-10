# Exact Resume and Coherent Writeback Walkthrough

[English README](../README.md) · [简体中文说明](../README.zh-CN.md) · [Architecture](architecture.md)

The self-contained [retarded-propagator workspace](../examples/retarded-propagator/MISSION.md) is the normative public example for `v0.4.0`. Every identity in it is labeled illustrative; it is not evidence about a real learner or a claim that a published paper said something not supplied here.

## 1. Register one self-contained source

The [materials registry](../examples/retarded-propagator/MATERIALS.md) assigns a stable demo version to the [source snapshot](../examples/retarded-propagator/sources/DEMO-SRC-001.md). The lesson therefore has a reopenable anchor for the time-domain propagator and its convention.

## 2. Locate one prerequisite boundary

The [baseline diagnostic](../examples/retarded-propagator/BASELINE.md) asks one multiple-choice question: which factor makes the negative-time integrand vanish? Each distractor corresponds to a particular confusion.

The illustrative learner selects the step function. That demonstrates recognition, not the ability to rewrite the integral. The [Evidence record](../examples/retarded-propagator/learning-records/EV-DEMO-0001.md) keeps the unaided response separate from the later self-report and assisted explanation.

## 3. Write the first lesson with notation before use

The [lesson Note](../examples/retarded-propagator/lessons/L-DEMO-0001-free-retarded-propagator.md) starts with `## Notation and conventions`. Its table orders domains, variables, functions, the regulator, compound exponent, and propagator forms by dependency before the derivation uses them.

The Note then states the source equation and inserts it into the regulated Fourier transform.

## 4. Integrate the clarification at its first dependency point

The learner reports: the step function is familiar, but changing the integration limits is not.

The writeback does not append a conversation log. It rewrites the first equality that depends on support:

1. split the full domain at zero;
2. show that the negative-time term vanishes because the step function is zero there;
3. retain the positive-time term;
4. state that the regulator controls large-positive-time convergence, not causal support;
5. continue immediately into the regulated exponential integral.

The exact equation block is `^resume-regulated-integral`. The explanation has an incoming transition from the support statement and an outgoing transition to convergence, so it reads as part of one planned derivation.

## 5. Preserve evidence without overstating mastery

The Evidence record says exactly what happened:

- unaided recognition of the step function;
- learner self-report of the range-reduction gap;
- assisted explanation integrated into the Note;
- no observed unaided evaluation of the regulated integral.

The option answer is not promoted into reconstruction mastery.

## 6. Store one exact next action

The [current state](../examples/retarded-propagator/CURRENT-STATE.md) links the exact equation block, names the finite-cutoff evaluation as the remaining obstacle, and gives one next action: choose which regulator sign produces decay.

On the next session, the Skill opens that block and Evidence boundary. It does not restart the definition of the retarded propagator or repeat the support explanation unless the learner asks for review.

## 7. Keep the code path absent when it is outside the mission

This example's mission sets the code gate to N/A. The lesson therefore contains no empty Code Map scaffold and no Run claim. A code section would appear only when implementation is a target and trustworthy corresponding material is registered.

## Reproduce the checks

From the repository root:

```powershell
./tests/example-contract.ps1
python -X utf8 scripts/validate_workspace.py examples/retarded-propagator
```

The first command checks the example-specific learning contract. The second runs the same read-only structural validator used for real workspaces.
