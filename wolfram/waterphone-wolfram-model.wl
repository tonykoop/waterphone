(* Waterphone parametric acoustic and engineering model.
   Wolfram Language 14.3.
   All numeric physical inputs are estimates only: pending measurement, not fabrication authority. *)

ClearAll["Global`*"];

waterphoneMetadata = <|
  "instrument" -> "waterphone",
  "packet" -> "Round 8 Wolfram build-packet model",
  "modelName" -> "Estimate-only bowed rod, bowl, and water-coupling explorer",
  "authority" -> "reference_only",
  "measurementStatus" -> "pending measurement, not fabrication authority"
|>;

(* estimate - pending measurement, not fabrication authority *)
rodLengthEstimate = 0.38;
(* estimate - pending measurement, not fabrication authority *)
rodLengthMinEstimate = 0.12;
(* estimate - pending measurement, not fabrication authority *)
rodLengthMaxEstimate = 0.75;
(* estimate - pending measurement, not fabrication authority *)
rodLengthStepEstimate = 0.005;

(* estimate - pending measurement, not fabrication authority *)
rodDiameterEstimate = 0.004;
(* estimate - pending measurement, not fabrication authority *)
rodDiameterMinEstimate = 0.0015;
(* estimate - pending measurement, not fabrication authority *)
rodDiameterMaxEstimate = 0.010;
(* estimate - pending measurement, not fabrication authority *)
rodDiameterStepEstimate = 0.0001;

(* estimate - pending measurement, not fabrication authority *)
rodYoungModulusEstimate = 1.9*10^11;
(* estimate - pending measurement, not fabrication authority *)
rodYoungModulusMinEstimate = 1.0*10^11;
(* estimate - pending measurement, not fabrication authority *)
rodYoungModulusMaxEstimate = 2.2*10^11;
(* estimate - pending measurement, not fabrication authority *)
rodYoungModulusStepEstimate = 0.05*10^11;

(* estimate - pending measurement, not fabrication authority *)
rodDensityEstimate = 7850.;
(* estimate - pending measurement, not fabrication authority *)
rodDensityMinEstimate = 7000.;
(* estimate - pending measurement, not fabrication authority *)
rodDensityMaxEstimate = 9000.;
(* estimate - pending measurement, not fabrication authority *)
rodDensityStepEstimate = 50.;

(* estimate - pending measurement, not fabrication authority *)
cantileverBeta1Estimate = 1.87510407;
(* estimate - pending measurement, not fabrication authority *)
cantileverBeta2Estimate = 4.69409113;

(* estimate - pending measurement, not fabrication authority *)
bowlRadiusEstimate = 0.18;
(* estimate - pending measurement, not fabrication authority *)
bowlRadiusMinEstimate = 0.08;
(* estimate - pending measurement, not fabrication authority *)
bowlRadiusMaxEstimate = 0.35;
(* estimate - pending measurement, not fabrication authority *)
bowlRadiusStepEstimate = 0.005;

(* estimate - pending measurement, not fabrication authority *)
waterDepthEstimate = 0.045;
(* estimate - pending measurement, not fabrication authority *)
waterDepthMinEstimate = 0.005;
(* estimate - pending measurement, not fabrication authority *)
waterDepthMaxEstimate = 0.16;
(* estimate - pending measurement, not fabrication authority *)
waterDepthStepEstimate = 0.001;

(* estimate - pending measurement, not fabrication authority *)
gravityEstimate = 9.80665;
(* estimate - pending measurement, not fabrication authority *)
sloshingModeRootEstimate = 1.84118;

(* estimate - pending measurement, not fabrication authority *)
bowlEffectiveMassEstimate = 1.2;
(* estimate - pending measurement, not fabrication authority *)
bowlEffectiveMassMinEstimate = 0.2;
(* estimate - pending measurement, not fabrication authority *)
bowlEffectiveMassMaxEstimate = 4.0;
(* estimate - pending measurement, not fabrication authority *)
bowlEffectiveMassStepEstimate = 0.05;

(* estimate - pending measurement, not fabrication authority *)
bowlStiffnessEstimate = 1.0*10^6;
(* estimate - pending measurement, not fabrication authority *)
bowlStiffnessMinEstimate = 1.0*10^4;
(* estimate - pending measurement, not fabrication authority *)
bowlStiffnessMaxEstimate = 8.0*10^6;
(* estimate - pending measurement, not fabrication authority *)
bowlStiffnessStepEstimate = 1.0*10^4;

(* estimate - pending measurement, not fabrication authority *)
couplingFactorEstimate = 0.15;
(* estimate - pending measurement, not fabrication authority *)
couplingFactorMinEstimate = 0.0;
(* estimate - pending measurement, not fabrication authority *)
couplingFactorMaxEstimate = 0.6;
(* estimate - pending measurement, not fabrication authority *)
couplingFactorStepEstimate = 0.01;

rodAreaEstimate[diameter_] := Pi diameter^2/4;

rodSecondMomentEstimate[diameter_] := Pi diameter^4/64;

cantileverRodFrequencyEstimate[length_, diameter_, youngModulus_, density_, beta_] :=
  (beta^2/(2 Pi length^2))*
    Sqrt[(youngModulus rodSecondMomentEstimate[diameter])/(density rodAreaEstimate[diameter])];

sloshingFrequencyEstimate[radius_, waterDepth_, gravity_, modeRoot_] :=
  Module[{waveNumberEstimate = modeRoot/radius},
    Sqrt[gravity waveNumberEstimate Tanh[waveNumberEstimate waterDepth]]/(2 Pi)
  ];

bowlLumpedFrequencyEstimate[stiffness_, mass_] :=
  Sqrt[stiffness/mass]/(2 Pi);

coupledFrequencyEstimate[rodHz_, bowlHz_, sloshHz_, couplingFactor_] :=
  Sqrt[(1 - couplingFactor) rodHz^2 + couplingFactor ((bowlHz + sloshHz)/2)^2];

WaterphoneSummary[length_, diameter_, youngModulus_, density_, radius_, waterDepth_, bowlMass_, bowlStiffness_, couplingFactor_] :=
  Module[
    {rodFundamentalHzEstimate, rodSecondModeHzEstimate, sloshHzEstimate,
      bowlHzEstimate, coupledHzEstimate},
    rodFundamentalHzEstimate = cantileverRodFrequencyEstimate[
      length, diameter, youngModulus, density, cantileverBeta1Estimate];
    rodSecondModeHzEstimate = cantileverRodFrequencyEstimate[
      length, diameter, youngModulus, density, cantileverBeta2Estimate];
    sloshHzEstimate = sloshingFrequencyEstimate[
      radius, waterDepth, gravityEstimate, sloshingModeRootEstimate];
    bowlHzEstimate = bowlLumpedFrequencyEstimate[bowlStiffness, bowlMass];
    coupledHzEstimate = coupledFrequencyEstimate[
      rodFundamentalHzEstimate, bowlHzEstimate, sloshHzEstimate, couplingFactor];
    <|
      "rodFundamentalHzEstimate" -> rodFundamentalHzEstimate,
      "rodSecondModeHzEstimate" -> rodSecondModeHzEstimate,
      "waterSloshHzEstimate" -> sloshHzEstimate,
      "bowlLumpedHzEstimate" -> bowlHzEstimate,
      "coupledResponseHzEstimate" -> coupledHzEstimate,
      "authority" -> "estimate only - pending measurement, not fabrication authority"
    |>
  ];

waterphoneModelManipulate =
  Manipulate[
    Module[
      {summary = WaterphoneSummary[
          length, diameter, youngModulus, density, bowlRadius, waterDepth,
          bowlMass, bowlStiffness, couplingFactor]},
      Grid[
        {
          {"instrument", waterphoneMetadata["instrument"]},
          {"authority", summary["authority"]},
          {"rod fundamental estimate (Hz)", NumberForm[summary["rodFundamentalHzEstimate"], {8, 2}]},
          {"rod second mode estimate (Hz)", NumberForm[summary["rodSecondModeHzEstimate"], {8, 2}]},
          {"water slosh estimate (Hz)", NumberForm[summary["waterSloshHzEstimate"], {8, 3}]},
          {"bowl lumped resonance estimate (Hz)", NumberForm[summary["bowlLumpedHzEstimate"], {8, 2}]},
          {"coupled response estimate (Hz)", NumberForm[summary["coupledResponseHzEstimate"], {8, 2}]}
        },
        Frame -> All,
        Alignment -> Left
      ]
    ],
    {{length, rodLengthEstimate, "rod length estimate (m)"}, rodLengthMinEstimate, rodLengthMaxEstimate, rodLengthStepEstimate},
    {{diameter, rodDiameterEstimate, "rod diameter estimate (m)"}, rodDiameterMinEstimate, rodDiameterMaxEstimate, rodDiameterStepEstimate},
    {{youngModulus, rodYoungModulusEstimate, "rod Young's modulus estimate (Pa)"}, rodYoungModulusMinEstimate, rodYoungModulusMaxEstimate, rodYoungModulusStepEstimate},
    {{density, rodDensityEstimate, "rod density estimate (kg/m^3)"}, rodDensityMinEstimate, rodDensityMaxEstimate, rodDensityStepEstimate},
    {{bowlRadius, bowlRadiusEstimate, "bowl radius estimate (m)"}, bowlRadiusMinEstimate, bowlRadiusMaxEstimate, bowlRadiusStepEstimate},
    {{waterDepth, waterDepthEstimate, "water depth estimate (m)"}, waterDepthMinEstimate, waterDepthMaxEstimate, waterDepthStepEstimate},
    {{bowlMass, bowlEffectiveMassEstimate, "bowl effective mass estimate (kg)"}, bowlEffectiveMassMinEstimate, bowlEffectiveMassMaxEstimate, bowlEffectiveMassStepEstimate},
    {{bowlStiffness, bowlStiffnessEstimate, "bowl stiffness estimate (N/m)"}, bowlStiffnessMinEstimate, bowlStiffnessMaxEstimate, bowlStiffnessStepEstimate},
    {{couplingFactor, couplingFactorEstimate, "rod-water-bowl coupling factor estimate"}, couplingFactorMinEstimate, couplingFactorMaxEstimate, couplingFactorStepEstimate}
  ];

waterphoneModelManipulate
