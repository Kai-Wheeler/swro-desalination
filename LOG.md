# Project log

Self-directed chemical engineering project: designing a seawater reverse osmosis desalination plant in MATLAB and Simulink. One entry per session, newest at the bottom.

## 2026-10-23 — Week 1, Session 1 (1 hour)

**Did:** read the Session 1 lesson on thermal vs. RO desalination and worked both examples (kettle heating, Sydney plant energy). Set up a My answers tab for my work.

**Confused by / asked about:**

- How MSF and MED differ. Both use chambers at falling pressure; MSF uses the steam's heat to preheat incoming seawater, while MED uses it to boil seawater in the next effect.
- kJ vs. kWh. Both are energy; 1 kWh = 3,600 kJ. kW is power (a rate) and kWh is energy (a total).
- Why a kWh of low-temperature waste heat is worth less than a kWh of electricity. Heat can only partly become work (the Carnot limit), so 70 °C heat is worth at most about 13% of its value as electricity.

**Decisions / assumptions:** seawater = 35,000 mg/L for the whole project. Drinking water limit = 500 mg/L TDS.

**Next:** Session 1 self-check and Assignment 1.

## 2026-10-23 — Week 1, Assignment 1 and revisions (15 minutes)

**Did:** did the Session 1 self-check and wrote Assignment 1. Graded 6.5/10, then revised twice to reach 8/10.

**Learned from feedback:**

- Back claims with numbers, and give every number its full unit: kWh/m³, not just kWh.
- The energy figures are already per m³ of fresh water, so using recovery to argue about energy counts it twice. Recovery matters for a different reason: a smaller intake, less pretreatment and less harm to marine life.
- Recovery and efficiency mean different things. Recovery = share of seawater that becomes fresh water; efficiency usually refers to energy.
- Round at the end, not the start: the minimum salt removal is 98.6%, not 99%.

**Confused by:** nothing

**Next:** Assignment 2 (energy to boil 1 m³), then Session 2.

## 2026-10-23 — Week 1, Assignment 2 (15 minutes)

**Did:** worked out the energy to boil 1 m³ of seawater: about 93 kWh/m³ to heat it to 100 °C plus about 628 kWh/m³ to turn it into steam, about 720 kWh/m³ in total, roughly 200× an RO plant. Graded 7.5/10. This finishes Session 1.

**Learned from feedback:**

- The phase change (latent heat) is about 87% of the energy needed to boil seawater.
- MED gets the latent heat back when steam condenses and reuses it to boil seawater in the next effect, about 15–20 times over. That brings 720 kWh/m³ down to about 40 kWh/m³.
- Every written step should match the math: 334 kJ is for 1 kg, but 1 m³ is 1,000 kg.

**Decisions / assumptions:** from now on, grading focuses on understanding the concepts; sig figs, rounding and small differences in constants don't count.

**Confused by:** nothing

**Next:** Session 2 — inside an RO plant.

## 2026-11-08 — Topic 1, Session 2 (1 hour)

**Did:** read Session 2, Inside an RO plant: the seven units of the plant, plus recovery, salt rejection and brine salinity. Answered the Session 2 self-check, then did Assignment 3 (stream sizing for 25,000 m³/day of feed making 10,000 m³/day of permeate). Graded 9.5/10.

**Learned / asked about:**

- The membrane removes water, not salt. The seawater left on the feed side keeps its salt in less water, so it gets saltier element by element and ends up as brine.
- Antiscalant is dosed into the feed water at the end of pretreatment, before the high-pressure pump, so minerals don't crust onto the membranes.
- Membranes are packaged as sheets → elements → pressure vessels (6–8 elements) → trains, with one high-pressure pump per train.
- Pressure isn't conserved; energy is. The ERD moves pressure energy from the brine to the incoming seawater.
- Pretreatment chlorine is removed to protect the membranes; post-treatment chlorine stays in at low levels to keep the water safe in the city's pipes.
- The brine shortcut is fine when rejection is high; its error is about recovery × (1 − rejection), about 0.1% for seawater RO.

**Decisions / assumptions:** removed the plant sketch from Assignment 3 to focus on the math.

**Confused by:** *anything still unclear*

**Next:** Session 3, Balances and osmotic pressure. Setup moved to Session 5, after the rest of the background.

## 2026-11-18 — Topic 1, Session 3 (*time spent*)

**Did:** read Session 3, Balances and osmotic pressure, and answered the self-check. Did Assignment 4: the water and salt balance and osmotic pressures for a 50% recovery plant. Graded 6.5/10; Claude wrote the fix for part 6.

**Learned / asked about:**

- Material balances in four ideas: system boundary, basis (the amount you choose to calculate on), in = out for water and for salt, and degrees of freedom.
- 1 mg/L = 1 g/m³, so m³/day × mg/L gives grams of salt per day directly.
- Osmotic pressure works like the ideal gas law: it depends on how many dissolved particles there are, and NaCl counts twice because it splits into two ions. That's about 0.85 bar per 1,000 mg/L; real seawater pulls back about 10% less because the ions interact.
- The pump has to beat the brine's osmotic pressure, not the seawater's. At 60 bar the highest possible recovery is about 50%.
- The MATLAB model will start with the ideal equation so it matches the check values; a correction for non-ideal behavior can come in Topic 4.

**Decisions / assumptions:** treat all the salt as NaCl at 25 °C. Moved setup to Session 5, after the rest of the background.

**Confused by:** *anything still unclear*

**Next:** Session 4, Pump energy and the membrane.

## 2026-11-19 — Topic 1, Session 4 (*time spent*)

**Did:** read Session 4, Pump energy and the membrane. Did Assignment 5: energy with and without energy recovery, and flux, for the 50% recovery plant at 68 bar. Graded 8/10. Claude answered the self-check.

**Learned / asked about:**

- Pressure is stored energy: 1 bar × 1 m³ = 100 kJ = 0.0278 kWh.
- Energy recovery doesn't change how much energy is stored in the water. It recycles the brine's pressure, so less has to be supplied from the grid: 2.19 vs. 4.63 kWh/m³, 53% less.
- With energy recovery, energy depends mostly on pressure. Without it, energy falls as recovery rises.
- The recovery trade-off: higher recovery needs more pressure and energy; lower recovery means more seawater to pull in and pretreat. Finding the cheapest point is the project question.
- Water flux falls along a pressure vessel because the feed side gets saltier: 30 to 6 L/(m²·h) at 45% recovery and 60 bar.
- The 60 bar design pressure comes from real plants, checked against the 53.9 bar the brine pulls back with.

**Decisions / assumptions:** 60 bar design pressure for the 45% base case; 80% pump efficiency; energy recovery device 96% efficient.

**Confused by:** *anything still unclear*

**Next:** Session 5, Setup.



## 2026-11-19 — Topic 1, Session 5 (*time spent*)

**Did:** set up the tools for the build. Created a MathWorks account and confirmed MATLAB works. Created a GitHub account and the [swro-desalination](https://github.com/Kai-Wheeler/swro-desalination) repository, and copied this log into LOG.md. This finishes Topic 1.

**Decisions / assumptions:** commit straight to the main branch while working solo. Skipped the Topic 1 quiz; my own notes on each unit are my reference. Felder & Rousseau is optional, not needed for the build.

**Confused by:** *anything still unclear*

**Next:** check that Simulink is included in my MATLAB license, then Topic 2, MATLAB model.

## 2026-11-22 — Topic 2, Session 1 (*time spent*)

**Did:** completed all of MATLAB Onramp and earned the 100% course certificate. Worked through the MATLAB ideas and the kettle example, then answered the Session 1 self-check. Graded 8/10.

**Learned / asked about:**

- `[value, index] = max(x)` gives two outputs in a fixed order: the value, then its position. `min` works the same way, which is how I'll find the lowest-energy recovery in Session 3.
- `start:step:end` builds an evenly spaced vector, and `'` flips a row into a column. Square brackets are for typing out a few specific values.
- Indexing: `v(3)` picks the 3rd element of a vector, and `A(:,v)` picks a whole column of a matrix.
- `hold on` keeps earlier plots on the same axes; `hold off` ends it.
- `for` loops and `if`/`else` blocks each close with their own `end`. Plot settings like `"LineWidth", 3` go at the end of `plot` as name–value pairs.

**Learned from feedback:** `./` is needed when dividing by an array (`a./b` or `1./r`). Dividing an array by a single number works either way.

**Decisions / assumptions:** did the full Onramp, not just the modules the project needs, so the certificate shows 100% for my resume.

**Confused by:** *anything still unclear*

**Next:** Session 2, Balance and osmotic pressure in code.

## 2026-11-22 — Topic 2, Session 2 and Assignment 1 (*time spent*)

**Did:** built `plant_model.mlx` section by section: inputs, water and salt balance, salt check, an `osmoticPressure` function, results compared with the Topic 1 check values, and a `maxRecovery` function. Every result matched its check value. Ran Case 1 (45% recovery, 99.7% rejection) and Case 2 (50%, 99.5%) by changing only the inputs, exported a PDF of each, and uploaded them to GitHub. Claude supplied the `maxRecovery` code; I wrote the rest. Session 2 self-check graded 5/10.

**Learned / asked about:**

- Live scripts: code and text lines, sections, Ctrl+Enter to run one section and Run for the whole script, and the Workspace panel for checking variables.
- MATLAB file names can only use letters, numbers and underscores.
- Functions: the inputs in the first line are placeholders that get filled each time the function is called. A function can't see variables outside it, so constants are defined inside. Functions go at the bottom of the file and are called from sections above.
- Don't use `pi` or `i` as variable names; MATLAB already uses them.
- The brine's osmotic pressure is the one that matters for design. The permeate's is about 0.09 bar, small enough to ignore.
- mol/L = (g/L) ÷ molar mass.
- Max recovery at 60 bar is 50.5%. At 50% recovery the brine pushes back with 59.2 bar, almost at the limit, which is why the 50% plant in Topic 1 used 68 bar.

**Learned from feedback:** the main reason to keep all inputs in one section is that a new design only means editing that section; nothing below has hard-coded numbers. Writing a formula as a function means it's written once, reused for any input, and fixed in one place if it changes.

**Decisions / assumptions:** one live script, saved with the Case 1 inputs, plus a PDF of each case with its own check values.

**Confused by:** *anything still unclear*

**Next:** Session 3, Energy and energy recovery.

## 2026-11-26 — Topic 2, Session 3 and Assignment 2 (*time spent*)

**Did:** added energy to `plant_model`: two energy functions, without and with an energy recovery device (ERD), checked against Topic 1 (4.63 / 2.19 kWh/m³ at 45% and 60 bar; 4.73 / 2.46 at 50% and 68 bar). Swept recovery from 30% to 60%, calculating the required pressure (brine osmotic pressure + 6 bar) and energy at each step, and plotted both curves. Lowest energy without an ERD: 4.53 kWh/m³ at 52% recovery. With an ERD: 1.84 kWh/m³ at 30%. Uploaded the updated code and `plant_model_session3.pdf`. Claude answered the Session 3 self-check and Assignment 2 part 5 at my request.

**Learned / asked about:**

- Energy without an ERD: E = P × (1/36) ÷ (recovery × pump efficiency). 1 bar × 1 m³ = 100 kJ = 1/36 kWh, and the pump pushes 1/r m³ of seawater per m³ of fresh water.
- With an ERD, multiply by (1 − (1 − r) × ERD efficiency), the share of pumped energy the pump still supplies. Per m³ of fresh water the brine is (1 − r)/r m³, but the /r is already in the first part of the formula.
- The pressure margin is the net driving pressure that keeps water flowing through the last membranes, plus room for friction and fouling. 6 bar matches the 60 bar design (60 − 53.9).
- A sweep runs every calculation on a list of 31 recoveries at once. It only works with `.*` and `./`; checking one position, like `(16)` for 45%, is a quick way to test it.
- `[value, index] = min(list)` gives the position of the lowest point; `rSweep(index)` turns that position into a recovery.
- Pump efficiency is held at 80% for every design: each plant would get a pump chosen for its own flow and pressure.
- Without an ERD, energy has a minimum in the middle (more seawater at low recovery vs. more pressure at high recovery). With an ERD, energy follows pressure, so it's lowest at the lowest recovery. Energy alone ignores intake, pretreatment and equipment size, which is why Topic 4 adds cost.

**Decisions / assumptions:** 80% pump efficiency, 96% ERD efficiency, 6 bar pressure margin. Added "optimize the pressure margin" as an optional extra after Topic 4, so the margin becomes a value I work out rather than assume.

**Confused by:** *anything still unclear*

**Next:** Topic 2 check-in quiz, then Topic 3, Membrane model.
