within OpenIPSL.UsersGuide.ReleaseNotes;
class v310 "Version 3.1.0 (2026-02-25)"
  extends Modelica.Icons.ReleaseNotes;
  annotation (Documentation(info="<html>
<p>This release version 3.1.0 of <strong><code>OpenIPSL</code></strong> is led by an <strong>Industrial-Grade Model Expansion</strong>. The release significantly expands the availability of <strong>new models</strong> and examples, with broad additions across synchronous machine dynamics, governors, excitation and stabilizer systems, and WECC-type renewable energy source models (Wind, PV and BESS), while also improving compatibility and quality checks. </p>
<h4>Highlights</h4>
<p><strong>Primary highlight:</strong> <strong>Industrial-Grade Model Expansion</strong>:</p>
<ul>
<li><strong>Industrial-Grade Model Expansion</strong>: substantial additions and hardening of production-ready dynamic models and associated examples.</li>
<li><strong>Comprehensive model catalog growth</strong>: expanded synchronous machine, governor, excitation systems, and <strong>WECC renewable models</strong> for large-scale stability studies.</li>
<li><strong>WECC renewables energy source models (RES)</strong>: WECC generic renewable models, including REGC, REEC, and REPC components for Wind/PV/BESS integration studies. Pre-defined templates with hierarchical modeling for BESS, PV and Wind.</li>
<li><strong>Expanded Microgrid and Voltage Source Models</strong>: new and updated IEEE/University Campus microgrid examples and voltage-behind-impedance source variants.</li>
<li><strong>Generic Variable Speed Drive Model</strong>: new model for variable speed drive systems with their power electronics and controller modules.</li>
<li><strong>Model quality and robustness improvements</strong>: targeted updates to key dynamic models and release checks.</li>
<li><strong>New Addition to Tutorial Examples</strong>: new example showing the integration of power flow records from GridCal/VeraGrid. </li>
</ul>
<h5>New component additions:</h5>
<p>Key additions highlighted for this release include:</p>
<ul>
<li><strong>New machine models:</strong> CIM5, CIM6, GENTPJ.</li>
<li><strong>Renewable Energy (WECC generic models):</strong> Renewable Energy Generator/Converter (REGC) models REGC_A; Renewable Energy Electric Controller (REEC) models REEC_A, REEC_B, and REEC_C; Renewable Energy Plant Controller (REPC) models REPC_A.</li>
<li><strong>Governing systems (thermal, gas, and hydro):</strong> DEGOV, IEEEG2, WEHGOV, WPIDHY, and WSIEG1.</li>
<li><strong>Excitation systems and compensators:</strong> AC7B, AC8B, DC4B, ESDC1A, ESDC2A, ESURRY, EXBAS, EXNI, SCRX, and IEEEVC. </li>
</ul>
<h4>Changes in detail</h4>
<h5>🚀 Features</h5>
<ul>
<li>feat: Update HYGOV.mo by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/309\">#309</a></li>
<li>feat: Adding New Test Models for PSAT Solar PV by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/322\">#322</a></li>
<li>feat: Ideal Voltage Source by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/320\">#320</a></li>
<li>feat: Ideal Current Source Model by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/319\">#319</a></li>
<li>feat: Add advanced Example 4 (which uses GridCal) to tutorials by <a href=\"https://github.com/maguilerac\">@maguilerac</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/324\">#324</a></li>
<li>feat: Graphical enhancements of line model and IEEE14 example by <a href=\"https://github.com/ceraolo\">@ceraolo</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/336\">#336</a></li>
<li>feat: Adding Data package containing typical data sets of powerplant components. by <a href=\"https://github.com/maguilerac\">@maguilerac</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/329\">#329</a></li>
<li>feat: WECC-Based Renewable Models by <a href=\"https://github.com/fachif\">@fachif</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/327\">#327</a></li>
<li>feat: Updates to the PV all-in-one model by <a href=\"https://github.com/fachif\">@fachif</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/345\">#345</a></li>
<li>feat: New Voltage Behind Impedance Models for the implementation of GFC by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/349\">#349</a></li>
<li>feat: Adding input option to voltage source behind an impedance model by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/352\">#352</a></li>
<li>feat: Updated Tutorial - Example 4 by <a href=\"https://github.com/maguilerac\">@maguilerac</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/351\">#351</a></li>
<li>feat: New PSSE models (COMP, ES, TG, UEL, Machines) by <a href=\"https://github.com/GiuseppeLaera\">@GiuseppeLaera</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/347\">#347</a></li>
<li>feat: Adding PowerFactory implementation of distributed solar PVD1 by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/267\">#267</a></li>
<li>feat: New IEEE Microgrid and new components by <a href=\"https://github.com/fachif\">@fachif</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/343\">#343</a></li>
<li>feat: University Campus Microgrid by <a href=\"https://github.com/fachif\">@fachif</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/341\">#341</a></li>
<li>feat: Added Experiment Annotations and Modified ULTC Example by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/376\">#376</a></li>
</ul>
<h5>🐛 Bug Fixes</h5>
<ul>
<li>fix: &apos;abs&apos; function not properly converted to MSL 4.0.0 by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/302\">#302</a></li>
<li>fix: Remove cyclical dependency on function input by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/333\">#333</a></li>
<li>fix: remove bogus libraries AC7B and DC4B from the uses annotation by <a href=\"https://github.com/adrpo\">@adrpo</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/354\">#354</a></li>
<li>fix: Fixes the variability of function variables by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/356\">#356</a></li>
<li>fix: Update Reals IEE2ST, REECA1, REECB1, REECCU1, and REPCA1 by <a href=\"https://github.com/gkhalley\">@gkhalley</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/366\">#366</a></li>
<li>fix: Typo on PV and Wind Template Parameters by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/385\">#385</a></li>
</ul>
<h5>📚 Documentation</h5>
<ul>
<li>docs: Fix typo by <a href=\"https://github.com/tbeu\">@tbeu</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/312\">#312</a></li>
<li>docs: Adding publications from AMConf 2022 by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/321\">#321</a></li>
<li>docs: Update CITATION.cff by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/330\">#330</a></li>
<li>docs: Document RampTrackingFilter, PSS2A and PSS2B model implementation details by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/374\">#374</a></li>
<li>doc: Enhance README with tutorial links for OpenIPSL by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/389\">#389</a></li>
<li>doc: Update Release Notes by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/381\">#381</a></li>
</ul>
<h5>⚡ Performance Improvements</h5>
<ul>
<li>perf: Avoid equality on Real variables in SE Non-electrical function by <a href=\"https://github.com/gkhalley\">@gkhalley</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/313\">#313</a></li>
<li>perf: Avoid equality on Real variables by <a href=\"https://github.com/tbeu\">@tbeu</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/310\">#310</a></li>
<li>perf: Invalid == on Reals NegCurLogic by <a href=\"https://github.com/gkhalley\">@gkhalley</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/326\">#326</a></li>
<li>perf: Invalid == on Reals IEEEST by <a href=\"https://github.com/gkhalley\">@gkhalley</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/325\">#325</a></li>
<li>perf: Changes to ULTC and correct syntax fixes for OCT by <a href=\"https://github.com/hubertus65\">@hubertus65</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/265\">#265</a></li>
<li>perf: Division by zero protection block and function added by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/348\">#348</a></li>
<li>perf: Parameter evaluation for simpler initial equation systems by <a href=\"https://github.com/maltelenz\">@maltelenz</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/369\">#369</a></li>
<li>perf: Adding &quot;--daeMode&quot;, &quot;DAEsolver=true&quot; and related changes by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/375\">#375</a></li>
</ul>
<h5>♻️ Code Refactoring</h5>
<ul>
<li>refactor: Converts internal variable to connector by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/332\">#332</a></li>
</ul>
<h5>🔨 Build System &amp; CI</h5>
<ul>
<li>ci: Fix regex to optionally ignore quoted strings when checking for deprecated Text.lineColor annotation by <a href=\"https://github.com/tbeu\">@tbeu</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/339\">#339</a></li>
<li>ci: Enable deprecation checks in CI by <a href=\"https://github.com/beutlich\">@beutlich</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/382\">#382</a></li>
</ul>
<h5>🔧 Chores &amp; Maintenance</h5>
<ul>
<li>chore: Replaces deprecated lineColor with textColor by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/380\">#380</a></li>
</ul>
<h5>New Contributors</h5>
<ul>
<li><a href=\"https://github.com/gkhalley\">@gkhalley</a> made their first contribution in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/313\">#313</a></li>
<li><a href=\"https://github.com/hubertus65\">@hubertus65</a> made their first contribution in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/265\">#265</a></li>
<li><a href=\"https://github.com/ceraolo\">@ceraolo</a> made their first contribution in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/336\">#336</a></li>
<li><a href=\"https://github.com/fachif\">@fachif</a> made their first contribution in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/327\">#327</a></li>
<li><a href=\"https://github.com/GiuseppeLaera\">@GiuseppeLaera</a> made their first contribution in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/347\">#347</a></li>
<li><a href=\"https://github.com/adrpo\">@adrpo</a> made their first contribution in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/354\">#354</a></li>
<li><a href=\"https://github.com/maltelenz\">@maltelenz</a> made their first contribution in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/369\">#369</a></li>
<li><a href=\"https://github.com/beutlich\">@beutlich</a> made their first contribution in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/382\">#382</a></li>
</ul>
<h5>Full Changelog</h5>
<p><code><a href=\"https://github.com/OpenIPSL/OpenIPSL/compare/v3.0.1...v3.1.0\">v3.0.1...v3.1.0</a></code></p>
</html>"));
end v310;
